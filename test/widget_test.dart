import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:flutter/services.dart';

void main() {
  setUp(() {
    rootBundle.clear();
  });
  // testWidgets('Basic app loading test', (WidgetTester tester) async {
  //   await tester.pumpWidget(const SouthseaCinemaApp());
  //   expect(find.text('Welcome to Southsea Cinema'), findsOneWidget);
  // });
  group('SouthseaCinemaApp widget tests', () {
    testWidgets('App displays Southsea Cinema home',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      // Movies now load from the JSON asset, so wait for the load to finish.
      await tester.pumpAndSettle();

      expect(find.text('Kaleidoscope (Hyaku iro Megane)'), findsWidgets);
      expect(find.text('Spirited Away'), findsOneWidget);
      expect(find.text('£5.00'), findsOneWidget);
      expect(find.text('£7.50'), findsOneWidget);
      expect(find.text('Book'), findsNWidgets(2));
      expect(find.byType(Image), findsNWidgets(2));
    });
    testWidgets('Tapping Book to move to the movie listing page',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      // Wait for the movies to load before looking for the Book buttons.
      await tester.pumpAndSettle();

      await tester.tap(find.text('Book').first);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Add to order'), findsOneWidget);
      final addButton = find.widgetWithText(
        ElevatedButton,
        'Add to order',
      );
      await tester.ensureVisible(addButton);
      await tester.tap(addButton);
      await tester.pump();
      expect(
        find.text('1 tickets were added to order'),
        findsOneWidget,
      );
    });
  });
}
