import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/southsea_cinema.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

class Cinemacard extends StatelessWidget {
  final Movie cinema;

  const Cinemacard({super.key, required this.cinema});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaBackground,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  cinema.imagepath,
                  width: 240,
                  height: 360,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cinema.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: cinemaBrand,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        cinema.description,
                        style: const TextStyle(
                            color: cinemaFontWhite, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        cinema.agerating,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: cinemaFontWhite,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        cinema.time,
                        style: const TextStyle(
                            color: cinemaFontWhite, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '£${cinema.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: cinemaBrand,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return MovieListing(cinema: cinema);
                        }),
                      );
                    },
                    child: const Text(
                      'Book',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
