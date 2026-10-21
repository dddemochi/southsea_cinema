import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/southseacinema_repository.dart';

void main() {
  group('SouthseaCinemaRepository unit tests', () {
    test('getSouthseaCinemas returns two cinemas', () {
      final SouthseaCinemaRepository repository = SouthseaCinemaRepository();
      final List<Movie> cinemas = repository.getSouthseaCinemas();

      expect(cinemas.length, 2);
    });
    test('getSandwiches contains valid Footlong and Six-Inch subs', () {
      final SouthseaCinemaRepository repository = SouthseaCinemaRepository();
      final List<Movie> cinemas = repository.getSouthseaCinemas();

      final Movie spiritedAway = cinemas[0];
      expect(spiritedAway.id, '0');
      expect(spiritedAway.name, 'Spirited Away');
      expect(spiritedAway.price, 5.00);
      expect(spiritedAway.imagepath, isNotEmpty);

      final Movie kaleidoscope = cinemas[1];
      expect(kaleidoscope.id, '1');
      expect(kaleidoscope.name, 'Kaleidoscope (Hyaku iro Megane)');
      expect(kaleidoscope.price, 7.50);
      expect(kaleidoscope.imagepath, isNotEmpty);
    });
    test('getMovieById returns matching movie when id exists', () {
      final SouthseaCinemaRepository repository = SouthseaCinemaRepository();
      final Movie? movie = repository.getMovieById('0');

      expect(movie, isNotNull);
      expect(movie?.name, 'Spirited Away');
      expect(movie?.price, 5.00);
    });

    test('getMovieById returns null when id does not exist', () {
      final SouthseaCinemaRepository repository = SouthseaCinemaRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
