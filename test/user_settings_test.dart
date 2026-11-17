import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/user_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:southsea_cinema/views/settings_screen.dart';

void main() {
  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
  });

  testWidgets('SettingsScreen pre-fills saved settings on open', (
    WidgetTester tester,
  ) async {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.withData(<String, Object>{
          prefName: 'Dimitri Gallardo',
          prefAddress: 'commercial road, Portsmouth',
          prefEmail: 'dimitri@example.com',
          prefNewsletter: true,
        });

    await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Dimitri Gallardo'), findsOneWidget);
    expect(find.text('commercial road, Portsmouth'), findsOneWidget);
    expect(find.text('dimitri@example.com'), findsOneWidget);
    final Switch switchWidget = tester.widget<Switch>(find.byType(Switch));
    expect(switchWidget.value, isTrue);
  });

  testWidgets('Toggling switch and saving settings updates state', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));
    await tester.pumpAndSettle();

    final Finder nameField = find.byType(TextField).at(0);
    final Finder addressField = find.byType(TextField).at(1);
    final Finder emailField = find.byType(TextField).at(2);
    final Finder newsletterSwitch = find.byType(Switch);
    final Finder saveButton = find.text('Save Settings');

    await tester.enterText(nameField, 'Gerald Vernon-Jackson');
    await tester.enterText(addressField, 'Guildhall, PO1 2AJ');
    await tester.enterText(
      emailField,
      'gerald.vernon-jackson@portsmouthcc.gov.uk',
    );

    await tester.ensureVisible(newsletterSwitch);
    await tester.tap(newsletterSwitch);
    await tester.pumpAndSettle();

    await tester.ensureVisible(saveButton);
    await tester.tap(saveButton);
    await tester.pumpAndSettle();

    expect(
      find.text('Settings saved for Gerald Vernon-Jackson'),
      findsOneWidget,
    );

    // Verify persistence, not just the confirmation message
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    expect(await prefs.getString(prefName), 'Gerald Vernon-Jackson');
    expect(await prefs.getString(prefAddress), 'Guildhall, PO1 2AJ');
    expect(
      await prefs.getString(prefEmail),
      'gerald.vernon-jackson@portsmouthcc.gov.uk',
    );
    expect(await prefs.getBool(prefNewsletter), isTrue);

    // Remove and recreate the screen to verify the saved profile is loaded again
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Gerald Vernon-Jackson'), findsOneWidget);
    expect(find.text('Guildhall, PO1 2AJ'), findsOneWidget);
    expect(
      find.text('gerald.vernon-jackson@portsmouthcc.gov.uk'),
      findsOneWidget,
    );
    final Switch reopenedSwitch = tester.widget<Switch>(find.byType(Switch));
    expect(reopenedSwitch.value, isTrue);
  });

  group('UserSettings', () {
    test('default instance has empty strings and no newsletter', () {
      const UserSettings settings = UserSettings();

      expect(settings.name, isEmpty);
      expect(settings.email, isEmpty);
      expect(settings.address, isEmpty);
      expect(settings.receiveNewsletter, isFalse);
    });

    test('configured instance stores the values passed to the constructor', () {
      const UserSettings settings = UserSettings(
        name: 'Dimitri Gallardo',
        email: 'dimitri@example.com',
        address: 'commercial road, Portsmouth',
        receiveNewsletter: true,
      );

      expect(settings.name, 'Dimitri Gallardo');
      expect(settings.email, 'dimitri@example.com');
      expect(settings.address, 'commercial road, Portsmouth');
      expect(settings.receiveNewsletter, isTrue);
    });
  });
}