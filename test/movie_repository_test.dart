import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/southseacinema_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('SouthseaCinemaRepository unit tests', () {
    test('getSouthseaCinemas returns two cinemas', () {
      final SouthseaCinemaRepository repository = SouthseaCinemaRepository();
      final List<Movie> cinemas = repository.getMovies();

      expect(cinemas.length, 3);
    });
    test('getSandwiches contains valid Footlong and Six-Inch subs', () {
      final SouthseaCinemaRepository repository = SouthseaCinemaRepository();
      final List<Movie> cinemas = repository.getMovies();

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

    test('loadMoviesFromAsset reads the bundled JSON menu', () async {
      final SouthseaCinemaRepository repository = SouthseaCinemaRepository();
      final List<Movie> movies = await repository.loadMoviesFromAsset();

      expect(movies.length, 5);
      expect(movies[0].id, '0');
      expect(movies[1].id, '1');
      expect(movies[2].id, '2');
      expect(movies[2].name, 'Sakuran');
      expect(movies[3].name, 'Princess Mononoke');
      expect(movies[4].name, 'Nonexistent Movie');
      expect(movies[3].id, '3');
      expect(movies[4].id, '4');
      expect(repository.getMovies(), movies);
    });
  });
}
