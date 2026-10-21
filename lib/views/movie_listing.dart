import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieListing extends StatelessWidget {
  final Movie cinema;
  final int maxQuantity;

  const MovieListing({super.key, required this.cinema, this.maxQuantity = 5});

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
          width: double.infinity,
          color: cinemaBackground,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  cinema.name,
                  style: TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  cinema.imagepath,
                  width: 200,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Text(cinema.description,
                    style: TextStyle(color: cinemaFontWhite, fontSize: 18)),
                const SizedBox(height: 20),
                Text(
                  cinema.location,
                  style: TextStyle(color: cinemaFontWhite, fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(cinema.time,
                    style: TextStyle(color: cinemaFontWhite, fontSize: 16)),
                const SizedBox(height: 40),
                Text(
                    'Please note that Discounts / Membership benefits will be applied after you have selected your tickets'),
                const SizedBox(height: 20),
                Text('Select the quantity of tickets you want to buy (max 5)'),
                const SizedBox(height: 30),
                Text(
                  'Tickets',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TicketDropdown(cinema: cinema),
              ],
            ),
          ),
        ));
  }
}

class TicketDropdown extends StatefulWidget {
  final Movie cinema;

  const TicketDropdown({super.key, required this.cinema});

  @override
  State<TicketDropdown> createState() => _TicketDropdownState();
}

class _TicketDropdownState extends State<TicketDropdown> {
  int? _ticketQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const SizedBox(width: 20),
          DropdownMenu<int>(
            initialSelection: 1,
            textStyle: const TextStyle(color: Colors.black),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: cinemaFontWhite,
            ),
            onSelected: (int? value) {
              if (value != null) {
                setState(() {
                  _ticketQuantity = value;
                });
              }
            },
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: '1'),
              DropdownMenuEntry(value: 2, label: '2'),
              DropdownMenuEntry(value: 3, label: '3'),
              DropdownMenuEntry(value: 4, label: '4'),
              DropdownMenuEntry(value: 5, label: '5'),
            ],
          ),
          const SizedBox(width: 20),
          Text(
            'Adult (${widget.cinema.formattedPrice})',
          ),
        ]),
        const SizedBox(height: 30),
        LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: cinemaBrand,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '$_ticketQuantity tickets were added to order'),
                        ),
                      );
                    },
                    child: const Text('Add to order',
                        style: TextStyle(
                          color: cinemaFontWhite,
                        ))),
              ],
            );
          } else {
            return Row(
              children: [
                const SizedBox(width: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: cinemaBrand,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '$_ticketQuantity tickets were added to order'),
                        ),
                      );
                    },
                    child: const Text('Add to order',
                        style: TextStyle(
                          color: cinemaFontWhite,
                        ))),
              ],
            );
          }
        })
      ],
    );
  }
}
