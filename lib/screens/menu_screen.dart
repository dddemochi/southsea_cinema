import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/southsea_cinema.dart';
import 'package:southsea_cinema/repositories/southseacinema_repository.dart';
import 'package:southsea_cinema/widgets/cinema_card.dart';

class MenuScreen extends StatelessWidget{
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final southseaCinemaRepository = SouthseaCinemaRepository();
    final List<SouthseaCinema> cinemas = southseaCinemaRepository.getSouthseaCinemas();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Southsea Cinema Menu'),
      ),
      body: ListView.builder(
        itemCount: cinemas.length,
        itemBuilder: (context, index) {
          return Cinemacard(cinema: cinemas[index]);
        },
      ),
    );
  
  }
}