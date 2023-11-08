import 'package:flutter/material.dart';

Widget terminalSide(BuildContext context) => SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Column(
        children: [
          Text(
            'Εργασία Αλγορίθμων 2023-2024',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
