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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(220, 255, 255, 255),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          ListTileModifier(
            name: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Πλάτος',
            onTap: () => log('h'),
            cornerType: 'Top',
            iconRight: const Icon(Icons.arrow_right),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTileModifier(
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
            name: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Πλάτος',
            onTap: () => log('h'),
            cornerType: 'Bottom',
            iconRight: const Icon(Icons.arrow_right),
          ),
          AdaptElevatedButton(
              onPressed: () => log('None'),
              label: 'Αλγόριθμος Πρώτα σε Πλάτος'),
          AdaptElevatedButton(
              onPressed: () => log('None'),
              label: 'Αλγόριθμος Πρώτα σε Πλάτος'),
          AdaptElevatedButton(
              onPressed: () => log('None'),
              label: 'Αλγόριθμος Πρώτα σε Πλάτος'),
          const Expanded(child: SizedBox()),
          ListTileModifier(
            name: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Πλάτος',
            onTap: () => log('h'),
            cornerType: 'Bottom',
            iconRight: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
