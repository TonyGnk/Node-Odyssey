import 'package:flutter/material.dart';

Widget resultsAppBar(BuildContext context) => const Row(
      children: [
        Center(
            child: Text(
          '  Αποτελέσματα',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),

        Expanded(child: SizedBox()),
        // colIconButton(Icons.arrow_left, () {}),
        // colIconButton(Icons.arrow_right, () {}),
      ],
    );

Widget colIconButton(IconData icon, Function() onPressed) => Column(
      children: [
        const SizedBox(
          height: 2,
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: 23.0,
        ),
      ],
    );
