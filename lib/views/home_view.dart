import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/southseacinema_repository.dart';
import 'package:southsea_cinema/widgets/cinema_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final southseaCinemaRepository = SouthseaCinemaRepository();
    final List<Movie> cinemas = southseaCinemaRepository.getSouthseaCinemas();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: cinemaHeaderStyle,
        ),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: ListView.builder(
        itemCount: cinemas.length,
        itemBuilder: (context, index) {
          return Cinemacard(cinema: cinemas[index]);
        },
      ),
    );
  }
}
