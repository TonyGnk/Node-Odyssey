import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screen_list.dart';

final isHoveredProviderModernButton = StateProvider<bool>((ref) => false);

class TheGloriousButton extends StatefulWidget {
  const TheGloriousButton({required this.label, required this.icon, super.key});

  final String label;
  final IconData icon;

  @override
  State<TheGloriousButton> createState() => _TheGloriousButtonState();
}

class _TheGloriousButtonState extends State<TheGloriousButton> {
  late Color color = Colors.grey.withOpacity(0.1);
  late Color borderColor = Colors.white.withOpacity(0.2);
  late Timer timer;
  late AlignmentGeometry alignmentGeometryA =
      alignmentGeometryList[gradientIndex];
  late AlignmentGeometry alignmentGeometryB =
      alignmentGeometryList2[gradientIndex];
  late List<AlignmentGeometry> alignmentGeometryList = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerRight,
    Alignment.bottomRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.centerLeft,
  ];
  late List<AlignmentGeometry> alignmentGeometryList2 = [
    Alignment.bottomRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.centerLeft,
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerRight,
  ];
  int gradientIndex = 0;

  @override
  void initState() {
    super.initState();
    _updateGradientType();
    // Set up a timer to update gradient every 4 seconds
    timer = Timer.periodic(const Duration(milliseconds: 1100), (Timer t) {
      _updateGradientType();
    });
  }

  @override
  void dispose() {
    // Dispose of the timer to avoid memory leaks
    timer.cancel();
    super.dispose();
  }

  void _updateGradientType() {
    setState(() {
      //Update the index to next one in the list
      gradientIndex = (gradientIndex + 1) % alignmentGeometryList.length;
      alignmentGeometryA = alignmentGeometryList[gradientIndex];
      alignmentGeometryB = alignmentGeometryList2[gradientIndex];
    });
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (event) {
          setState(() {
            //color = Colors.grey.withOpacity(0.2);
            color = const Color.fromARGB(255, 33, 117, 243).withOpacity(0.4);
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
            duration: const Duration(seconds: 1),
            width: 190,
            height: 80,
            decoration: BoxDecoration(
              //color: color,
              gradient: LinearGradient(
                colors: [
                  Colors.grey.withOpacity(0.1),
                  // Colors.grey.withOpacity(0.7),
                  color,
                ],
                begin: alignmentGeometryA,
                end: alignmentGeometryB,
              ),
              border: Border.all(
                color: borderColor,
                width: 2.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            clipBehavior: Clip.antiAlias,
            child: theColumn(context),
          ),
        ),
      );

  Widget theColumn(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          widget.icon,
          size: 27,
        ),
        const SizedBox(width: 8),
        Text(
          widget.label,
          style: const TextStyle(fontSize: 19),
        ),
      ]);
}
