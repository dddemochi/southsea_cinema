import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie', () {
    test('creates movie instance with given properties', () {
      const cinema = Movie(
        id: '1',
        name: 'Test Movie',
        location: 'Test Location',
        quantity: '5',
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
      expect(cinema.quantity, equals('5'));
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
        quantity: '5',
        capacity: 100,
        time: '2023-01-01 12:00',
        imagepath: 'assets/images/test_image.jpg',
        description: 'Test Description',
        price: 7,
        agerating: 'PG',
      );

      expect(cinema.formattedPrice, equals('£7.00'));
      expect(cinema.id, equals('1'));
      expect(cinema.name, equals('Test Movie'));
      expect(cinema.location, equals('Test Location'));
      expect(cinema.quantity, equals('5'));
      expect(cinema.capacity, equals(100));
      expect(cinema.time, equals('2023-01-01 12:00'));
      expect(cinema.imagepath, equals('assets/images/test_image.jpg'));
      expect(cinema.description, equals('Test Description'));
      expect(cinema.price, equals(7));
      expect(cinema.agerating, equals('PG'));
    });
  });
  group('Movie model tests', () {
    test('JSON conversion preserves every movie field', () {
      final Map<String, dynamic> data = <String, dynamic>{
        'id': '0',
        'name': 'Spirited Away',
        'description': 'A girl trapped in another world.',
        'price': 5.00,
        'imagePath': 'assets/images/spiritedaway_poster.webp',
        'quantity': 'Maximum of 5 tickets',
        'capacity': 100,
        'time': 'Wednesday 14 October 2026 19:00',
        'location': 'Southsea Cinema, UK',
        'agerating': '(12)',
      };

      final Movie movie = Movie.fromJson(data);
      expect(movie.id, '0');
      expect(movie.name, 'Spirited Away');
      expect(movie.description, 'A girl trapped in another world.');
      expect(movie.price, 5.00);
      expect(movie.imagepath, 'assets/images/spiritedaway_poster.webp');
      expect(movie.quantity, 'Maximum of 5 tickets');
      expect(movie.capacity, 100);
      expect(movie.time, 'Wednesday 14 October 2026 19:00');
      expect(movie.location, 'Southsea Cinema, UK');
      expect(movie.agerating, '(12)');
      expect(movie.toJson(), data);
    });
  });
}
