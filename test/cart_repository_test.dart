import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';

const Movie testMovie1 = Movie(
  id: 'movie1',
  name: 'Movie 1',
  description: 'Description for Movie 1',
  price: 10.0,
  imagepath: 'assets/images/movie1.jpeg',
  quantity: '3',
  capacity: 100,
  time: '2023-01-01 12:00',
  location: 'Test Location',
  agerating: 'PG',
);

const Movie testMovie2 = Movie(
  id: 'movie2',
  name: 'Movie 2',
  description: 'Description for Movie 2',
  price: 12.0,
  imagepath: 'assets/images/movie2.jpeg',
  quantity: '5',
  capacity: 100,
  time: '2023-01-01 12:00',
  location: 'Test Location',
  agerating: 'PG',
);

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });

  group('CartRepository tests', () {

    test('starts with empty basket and zero totals', () {
      final CartRepository cart = CartRepository.instance;

      expect(cart.getItems().length, 0);
      expect(cart.getTotalItems(), 0);
      expect(cart.totalItemCount, 0);
      expect(cart.getSubtotal(), 0.0);
      expect(cart.getTotalDue(), 0.0);
    });

    test('adds items and calculates subtotal and delivery fee correctly', () {
      final CartRepository cart = CartRepository.instance;

      final CartItem item1 = CartItem(
        movie: testMovie1,
        quantity: 2,
      );

      final CartItem item2 = CartItem(
        movie: testMovie2,
        quantity: 1,
      );

      cart.addItem(item1);
      cart.addItem(item2);

      expect(cart.getItems().length, 2);
      expect(cart.getTotalItems(), 3);
      expect(cart.totalItemCount, 3);
      expect(cart.getSubtotal(), 32.0);
      expect(cart.getTotalDue(), 32.0);
    });

    test('removes items correctly', () {
      final CartRepository cart = CartRepository.instance;

      final CartItem item = CartItem(
        movie: testMovie1,
        quantity: 1,
      );

      cart.addItem(item);

      expect(cart.getItems().length, 1);

      cart.removeItem(0);

      expect(cart.getItems().length, 0);
      expect(cart.getTotalItems(), 0);
      expect(cart.getTotalDue(), 0.0);
    });
  });
}