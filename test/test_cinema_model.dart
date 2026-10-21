import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie', () {
    test('creates movie instance with given properties', () {
      const cinema = Movie(
        id: '1',
        name: 'Test Movie',
        location: 'Test Location',
        quantityoftickets: '5',
        capacity: 100,
        time: '2023-01-01 12:00',
        imagepath: 'assets/images/test_image.jpg',
        description: 'Test Description',
        price: 7.5,
        agerating: 'PG',
      );

      expect(cinema.formattedPrice, equals('£7.50'));
      expect(cinema.id, equals('1'));
      expect(cinema.name, equals('Test Movie'));
      expect(cinema.location, equals('Test Location'));
      expect(cinema.quantityoftickets, equals('5'));
      expect(cinema.capacity, equals(100));
      expect(cinema.time, equals('2023-01-01 12:00'));
      expect(cinema.imagepath, equals('assets/images/test_image.jpg'));
      expect(cinema.description, equals('Test Description'));
      expect(cinema.price, equals(7.5));
      expect(cinema.agerating, equals('PG'));
    });
  });
  group('Movie', () {
    test('creates movie instance with given properties', () {
      const cinema = Movie(
        id: '1',
        name: 'Test Movie',
        location: 'Test Location',
        quantityoftickets: '5',
        capacity: 100,
        time: '2023-01-01 12:00',
        imagepath: 'assets/images/test_image.jpg',
        description: 'Test Description',
        price: 7,
        agerating: 'PG',
      );

      expect(cinema.formattedPrice, equals('£7.00'));
      expect(cinema.id, equals('1'));
      expect(cinema.name, equals('Test Cinema'));
      expect(cinema.location, equals('Test Location'));
      expect(cinema.quantityoftickets, equals('5'));
      expect(cinema.capacity, equals(100));
      expect(cinema.time, equals('2023-01-01 12:00'));
      expect(cinema.imagepath, equals('assets/images/test_image.jpg'));
      expect(cinema.description, equals('Test Description'));
      expect(cinema.price, equals(7));
      expect(cinema.agerating, equals('PG'));
    });
  });
}
