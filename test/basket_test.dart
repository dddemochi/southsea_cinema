import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/views/basket_screen.dart';

final Movie testMovie = Movie(
  name: 'Test Movie',
  imagepath: 'assets/images/test.jpg',
  description: 'A film used in tests.',
  location: 'Screen 1',
  time: '7:30pm',
  price: 10.0,
  id: 'test-movie',
  quantity: '0',
  capacity: 100,
  agerating: 'PG',
);

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });

  testWidgets('BasketScreen shows the empty message when there are no items', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: BasketScreen()));

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('Checkout'), findsNothing);
  });

  testWidgets('BasketScreen shows the items, totals and checkout button', (
    WidgetTester tester,
  ) async {
    CartRepository.instance.addItem(CartItem(movie: testMovie, quantity: 2));

    await tester.pumpWidget(const MaterialApp(home: BasketScreen()));

    expect(find.text('Your basket'), findsOneWidget);
    expect(find.text('2 x Test Movie'), findsOneWidget);
    expect(find.text('£20.00'), findsWidgets);
    expect(find.text('Items subtotal'), findsOneWidget);
    expect(find.text('Total to pay'), findsOneWidget);
    expect(find.text('Checkout'), findsOneWidget);
  });

  testWidgets('Tapping the delete icon removes the item', (
    WidgetTester tester,
  ) async {
    CartRepository.instance.addItem(CartItem(movie: testMovie, quantity: 2));

    await tester.pumpWidget(const MaterialApp(home: BasketScreen()));
    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(CartRepository.instance.getItems(), isEmpty);
  });

  testWidgets('Checkout clears the basket and shows a confirmation', (
    WidgetTester tester,
  ) async {
    CartRepository.instance.addItem(CartItem(movie: testMovie, quantity: 1));

    await tester.pumpWidget(const MaterialApp(home: BasketScreen()));
    await tester.tap(find.text('Checkout'));
    await tester.pump();

    expect(find.text('Thanks, your order is on its way'), findsOneWidget);
    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(CartRepository.instance.getItems(), isEmpty);
  });
}
