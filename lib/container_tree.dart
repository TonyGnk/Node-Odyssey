import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'tree.dart';

class TreeBox extends StatelessWidget {
  const TreeBox({
    required this.width,
    this.height,
    this.child = const SizedBox.shrink(),
    super.key,
    this.topSide = false,
    this.leftSide = false,
    this.bottomSide = false,
    this.rightSide = false,
    required this.number,
  });

  final double width;
  final double? height;
  final Widget child;
  final bool topSide;
  final bool leftSide;
  final bool bottomSide;
  final bool rightSide;
  final int number;

  final double borderWidth = 2;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height ?? width,
        width: width,
        decoration: BoxDecoration(
          color: getRandomColor(),
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
        child: Center(
          child: Text(
            number.toString(),
          ),
        ),
      );
}

Color getRandomColor() =>
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(0.3);

Widget node = Container(
  height: circleWidth,
  width: circleWidth,
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(50),
  ),
);
