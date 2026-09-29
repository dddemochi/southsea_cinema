import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Spirited Away (2001)',
              style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
                'The movie is about a girl named chiriho who finds herself trapped in another world, and must find a way to escape and save her parents, the film mainly revolves around self discovery and the importance of family and friends.'),
            const SizedBox(height: 20),
            Text(
              'Southsea Cinema Room',
            ),
            const SizedBox(height: 10),
            Text(
                'Friday 20th May 2026, 18:30 - ends at 20:34'), //yes i did search how long spirited away was
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
            const TicketDropdown(),
          ],
        ),
      ),
    );
  }
}

class TicketDropdown extends StatefulWidget {
  const TicketDropdown({super.key});

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
          Text('Adult (£7.50)'),
        ]),
        const SizedBox(height: 30),
        Row(children: [
          const SizedBox(width: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                backgroundColor: cinemaBrand,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('$_ticketQuantity tickets were added to order'),
                  ),
                );
              },
              child: const Text('Add to order',
                  style: TextStyle(
                    color: cinemaFontWhite,
                  ))),
        ])
      ],
    );
  }
}
