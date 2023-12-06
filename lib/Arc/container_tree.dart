import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'Tree Widgets/new_tree.dart';

class TreeBox extends StatelessWidget {
  const TreeBox({
    required this.width,
    super.key,
    this.topSide = false,
    this.leftSide = false,
    this.bottomSide = false,
    this.rightSide = false,
    this.node = false,
  });

  final double width;
  final bool topSide;
  final bool leftSide;
  final bool bottomSide;
  final bool rightSide;
  final bool node;

  final double borderWidth = 2;

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: node ? Colors.yellow : getRandomColor(),
          border: Border(
            top: topSide
                ? BorderSide(
                    color: Colors.black.withOpacity(1),
                    width: borderWidth,
                  )
                : BorderSide.none,
            left: leftSide
                ? BorderSide(
                    color: Colors.black.withOpacity(1),
                    width: borderWidth,
                  )
                : BorderSide.none,
            bottom: bottomSide
                ? BorderSide(
                    color: Colors.black.withOpacity(1),
                    width: borderWidth,
                  )
                : BorderSide.none,
            right: rightSide
                ? BorderSide(
                    color: Colors.black.withOpacity(1),
                    width: borderWidth,
                  )
                : BorderSide.none,
          ),
        ),
      );
}

Color getRandomColor() =>
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(0.2);

Widget node = Container(
  height: nodeWidth,
  width: nodeWidth,
  decoration: BoxDecoration(
    color: Colors.black.withBlue(250),
    borderRadius: BorderRadius.circular(50),
  ),
);
