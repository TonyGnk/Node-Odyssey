import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screen_list.dart';

final isHoveredProviderModernButton = StateProvider<bool>((ref) => false);

class theGloriousButton extends StatefulWidget {
  const theGloriousButton({required this.label, super.key});

  final String label;

  @override
  State<theGloriousButton> createState() => _theGloriousButtonState();
}

class _theGloriousButtonState extends State<theGloriousButton> {
  late Color color = Colors.grey.withOpacity(0.1);
  late Color borderColor = Colors.white.withOpacity(0.2);

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (event) {
          setState(() {
            color = Colors.grey.withOpacity(0.2);
            borderColor =
                const Color.fromARGB(255, 33, 117, 243).withOpacity(0.3);
          });
        },
        onExit: (event) {
          setState(() {
            color = Colors.grey.withOpacity(0.1);
            borderColor = Colors.white.withOpacity(0.2);
          });
        },
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            setState(() {
              color = Colors.grey.withOpacity(0.1);
              borderColor = Colors.white.withOpacity(0.2);
            });
            Navigator.push(
              context,
              // push breadthFirstAlgScreen(),
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: breadthFirstAlgScreen(),
                ),
              ),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 340 * MediaQuery.of(context).size.width / 1380,
            height: 150,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: borderColor,
                width: 2.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: theColumn(context),
            ),
          ),
        ),
      );

  Widget theColumn(BuildContext context) => Stack(
        children: [
          const Column(
            children: [
              SizedBox(height: 4),
              Icon(
                Icons.radar_outlined,
                size: 30,
              ),
            ],
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              widget.label,
              style: const TextStyle(fontSize: 23),
            ),
          ]),
        ],
      );
}
