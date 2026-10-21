import 'package:southsea_cinema/models/movie.dart';

class SouthseaCinemaRepository {
  List<Movie> getSouthseaCinemas() {
    return const [
      Movie(
        id: '0',
        name: 'Spirited Away',
        location: 'Southsea Cinema, UK',
        quantityoftickets:
            'Quantity of tickets you would like to buy keep in mind the maximum is 5',
        capacity: 100,
        time: 'Tuesday 14 October 2026 19:00',
        imagepath: 'assets/images/spiritedaway_poster.webp',
        description:
            'The movie is about a girl named chiriho who finds herself trapped in another world, and must find a way to escape and save her parents, the film mainly revolves around self discovery and the importance of family and friends',
        price: 5.00,
        agerating: '(12)',
      ),
      Movie(
        id: '1',
        name: 'Kaleidoscope (Hyaku iro Megane)',
        location: 'Southsea Cinema, UK',
        quantityoftickets:
            'Quantity of tickets you would like to buy keep in mind the maximum is 5',
        capacity: 100,
        time: 'Wednesday 15 October 2026 21:00',
        imagepath:
            'assets/images/kaleidoscope_poster.jpg',
        description:
            "The film follows Amagi, a man hired by a police official to investigate Kaede Katsuragi, a mysterious stage actress suspected of something. When Amagi unexpectedly encounters Kaede at a theatre, he becomes fascinated by her and begins approaching her without revealing his true identity. Drawn deeper into her world, he eventually watches her secretly at night, hoping to discover the truth about her life",
        price: 7.50,
        agerating: '(18)',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final cinema in getSouthseaCinemas()) {
      if (cinema.id == id) {
        return cinema;
      }
    }
    return null;
  }
}
