import 'dart:developer';

import 'package:flutter/material.dart';

import 'UI/Components/Buttons/elevated_button.dart';

Widget buttonsSide(BuildContext context) => SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Create a large label with text 'Πανεπιστημιακή Εργασία Αλγορίθμων 2023-2024'
          const Text(
            'Επιλέξτε τον επιθυμητό αλγόριθμο:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: listButtons(context))
        ],
      ),
    );

//Widget for the list buttons to go each algorithm screen
Widget listButtons(BuildContext context) => Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
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
          AdaptElevatedButton(
              onPressed: () => log('None'),
              label: 'Αλγόριθμος Πρώτα σε Πλάτος'),
        ],
      ),
    );
