import 'package:southsea_cinema/models/southsea_cinema.dart';

class SouthseaCinemaRepository {
  List<SouthseaCinema> getSouthseaCinemas() {
    return const [
      SouthseaCinema(
        id: 'SpiritedAway',
        name: 'Spirited Away',
        location: 'Southsea, UK',
        quantityoftickets: 100,
        capacity: 100,
        time: 'Tuesday 14 October 2026 19:00',
        imagepath: 'assets/images/OIP (1).webp',
        description: 'The movie is about a girl named chiriho who finds herself trapped in another world, and must find a way to escape and save her parents, the film mainly revolves around self discovery and the importance of family and friends',
        price: 7.00,
        agerating: '12',
      ),
      SouthseaCinema(
        id: 'Kaleidoscope (Hyaku iro Megane)',
        name: 'Kaleidoscope (Hyaku iro Megane)',
        location: 'Southsea, UK',
        quantityoftickets: 100,
        capacity: 100,
        time: 'Wednesday 15 October 2026 21:00',
        imagepath: 'assets/images/Y4csO19pt3G2zBf47Nh8iJpEfXViGfZ1iqT16lto4Et1R5CtCCe4bPcZRm71jYDLP8j_ZmkrN7yBYyS-LC57tnbtA3zliu0L60ETwfz-RRALjLN4-Y5E2IemY5gVfcRhNe-WKEZ9FqLNwGLwIJca8f2RijCBEayIfxwkJKRyRoaypcYjTQDeBcB9mHPHLqLi.jpg',
        description: 'A visually stunning film that explores the complexities of human relationships and the power of imagination',
        price: 7.00,
        agerating: '18',
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
