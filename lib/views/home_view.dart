import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/southseacinema_repository.dart';
import 'package:southsea_cinema/widgets/cinema_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Movie> _movies = [];
  bool _loading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadSandwiches();
  }

  Future<void> _loadSandwiches() async {
    try {
      final SouthseaCinemaRepository repository = SouthseaCinemaRepository();
      final List<Movie> movies = await repository.loadMoviesFromAsset();
      if (!mounted) {
        return;
      }
      setState(() {
        _movies = movies;
        _loading = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _errorMessage = 'Could not load the menu: $error';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (_loading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (_errorMessage.isNotEmpty) {
      body = Center(child: Text(_errorMessage));
    } else {
      body = ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Cinemacard(cinema: _movies[index]);
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            appTitle,
            style: cinemaHeaderStyle,
          ),
        ),
        drawer: const NavDrawer(),
        body: body);
  }
}
