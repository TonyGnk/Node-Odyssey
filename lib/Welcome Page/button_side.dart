import 'dart:developer';
import 'package:flutter/material.dart';
import '../UI/Components/Buttons/elevated_button.dart';
import '../UI/Components/List Tiles/list_tile_modifier.dart';

class ButtonsSide extends StatelessWidget {
  const ButtonsSide({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Create a large label with text 'Πανεπιστημιακή Εργασία Αλγορίθμων 2023-2024'
            const Text(
              'Επιλέξτε τον επιθυμητό αλγόριθμο:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(child: listButtons(context))
          ],
        ),
      );
}

//Widget for the list buttons to go each algorithm screen
Widget listButtons(BuildContext context) => Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 245, 245, 255),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Color.fromARGB(255, 220, 220, 255),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          ListTileModifier(
            padding: const EdgeInsets.all(10),
            name: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Βάθος',
            onTap: () => log('h'),
            cornerType: 'Top',
            iconRight: const Icon(Icons.arrow_right),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTileModifier(
            padding: const EdgeInsets.all(10),
            name: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Πλάτος',
            onTap: () => log('h'),
            cornerType: 'None',
            iconRight: const Icon(Icons.arrow_right),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTileModifier(
            padding: const EdgeInsets.all(10),
            name: 'Μετάβαση σε άλλο Αλγόριθμο',
            onTap: () => log('h'),
            cornerType: 'Bottom',
            iconRight: const Icon(Icons.arrow_right),
          ),
          const Expanded(child: SizedBox()),
          ListTileModifier(
            name: 'Μετάβαση σε άλλο Αλγόριθμο',
            padding: const EdgeInsets.all(10),
            onTap: () => log('h'),
            cornerType: 'Bottom',
            iconRight: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
