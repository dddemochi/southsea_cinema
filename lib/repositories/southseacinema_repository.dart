import 'package:southsea_cinema/models/southsea_cinema.dart';

class SouthseaCinemaRepository {
  List<SouthseaCinema> getSouthseaCinemas() {
    return const [
      SouthseaCinema(
        id: 'SpiritedAway',
        name: 'Spirited Away',
        location: 'Southsea Cinema, UK',
        quantityoftickets: 'Quantity of tickets you would like to buy keep in mind the maximum is 5',
        capacity: 100,
        time: 'Tuesday 14 October 2026 19:00',
        imagepath: 'assets/images/OIP (1).webp',
        description: 'The movie is about a girl named chiriho who finds herself trapped in another world, and must find a way to escape and save her parents, the film mainly revolves around self discovery and the importance of family and friends',
        price: 5.00,
        agerating: '(12)',
      ),
      SouthseaCinema(
        id: 'Kaleidoscope (Hyaku iro Megane)',
        name: 'Kaleidoscope (Hyaku iro Megane)',
        location: 'Southsea Cinema, UK',
        quantityoftickets: 'Quantity of tickets you would like to buy keep in mind the maximum is 5',
        capacity: 100,
        time: 'Wednesday 15 October 2026 21:00',
        imagepath: 'assets/images/Y4csO19pt3G2zBf47Nh8iJpEfXViGfZ1iqT16lto4Et1R5CtCCe4bPcZRm71jYDLP8j_ZmkrN7yBYyS-LC57tnbtA3zliu0L60ETwfz-RRALjLN4-Y5E2IemY5gVfcRhNe-WKEZ9FqLNwGLwIJca8f2RijCBEayIfxwkJKRyRoaypcYjTQDeBcB9mHPHLqLi.jpg',
        description: "The film follows Amagi, a man hired by a police official to investigate Kaede Katsuragi, a mysterious stage actress suspected of something. When Amagi unexpectedly encounters Kaede at a theatre, he becomes fascinated by her and begins approaching her without revealing his true identity. Drawn deeper into her world, he eventually watches her secretly at night, hoping to discover the truth about her life",
        price: 7.50,
        agerating: '(18)',
      ),
    ];
  }
}

// //final int quantityoftickets;
//   final int capacity;
//   final double price;
//   final String description;
//   final String imagepath;
//   final String spiritedaway;
//   final int time;
//   final String location;
