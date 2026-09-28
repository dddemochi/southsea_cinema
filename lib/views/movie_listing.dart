import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int? _ticketQuantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        child: Column(
          children: [
            const Text('Spirited Away (2001)', style: TextStyle(fontSize: 30)),
            Text(
                'The movie is about a girl named chiriho who finds herself trapped in another world, and must find a way to escape and save her parents.'),
            DropdownMenu<int>(
              initialSelection: 1,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                  });
                }
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 1, label: '1 Ticket'),
                DropdownMenuEntry(value: 2, label: '2 Tickets'),
                DropdownMenuEntry(value: 3, label: '3 Tickets'),
                DropdownMenuEntry(value: 4, label: '4 Tickets'),
                DropdownMenuEntry(value: 5, label: '5 Tickets'),
              ],
            ),
            ElevatedButton(onPressed: () => print('$_ticketQuantity tickets were added to order'),
            child: const Text ('Add to order'))
          ],
        ),
      ),
    );
  }
}
