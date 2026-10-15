import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:flutter/material.dart';

void main() {
  // testWidgets('Basic app loading test', (WidgetTester tester) async {
  //   await tester.pumpWidget(const SouthseaCinemaApp());
  //   expect(find.text('Welcome to Southsea Cinema'), findsOneWidget);
  // });
  group('SouthseaCinemaApp widget tests', () {
    testWidgets('App displays Southsea Cinema home',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text('Kaleidoscope (Hyaku iro Megane)'), findsWidgets);
      expect(find.text('Spirited Away'), findsOneWidget);
      expect(find.text('£5.00'), findsOneWidget);
      expect(find.text('£7.50'), findsOneWidget);
      expect(find.text('Book'), findsNWidgets(2));
      expect(find.byType(Image), findsNWidgets(2));
    });
  });
}
