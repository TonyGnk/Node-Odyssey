import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'Tree Widgets/new_tree.dart';

class Leaf extends StatelessWidget {
  const Leaf({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        flex: (nodeWidth * 2 + gapWidth).toInt(),
        child: Container(
          //height: 30,
          //width: nodeWidth * 2 + gapWidth,
          decoration: decoration(),
        ),
      );
}

decoration() => const BoxDecoration(
      color: Colors.yellow,
      shape: BoxShape.circle,
    );

// get random color only for 50 first rgb not more. and opacity 0.6
Color getRandomColor() => Color.fromARGB(
      255,
      math.Random().nextInt(111),
      math.Random().nextInt(111),
      0,
    );
