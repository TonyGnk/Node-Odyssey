// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

Widget bodyWithAppBar({
  required BuildContext context,
  required Widget appBar,
  required Widget body,
}) =>
    Column(
      children: [
        appBar,
        Expanded(child: body),
      ],
    );

Widget bodyWithAppBarGlass({
  required BuildContext context,
  required Widget appBar,
  required Widget body,
}) =>
    Stack(
      children: [
        BackgroundWallWithRandShapes(),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Column(
              children: [
                appBar,
                Expanded(child: body),
              ],
            ),
          ),
        ),
      ],
    );

class BackgroundWallWithRandShapes extends StatefulWidget {
  const BackgroundWallWithRandShapes({super.key});

  @override
  State<BackgroundWallWithRandShapes> createState() =>
      _BackgroundWallWithRandShapesState();
}

class _BackgroundWallWithRandShapesState
    extends State<BackgroundWallWithRandShapes> {
  late Color color1 = Color.fromRGBO(32, 102, 224, 0.6);
  late Color color2 = Color.fromRGBO(32, 102, 224, 0.6);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Initialize colors with random values
    _updateColors();
    // Set up a timer to update colors every 4 seconds
    timer = Timer.periodic(Duration(seconds: 7), (Timer t) {
      _updateColors();
    });
  }

  @override
  void dispose() {
    // Dispose of the timer to avoid memory leaks
    timer.cancel();
    super.dispose();
  }

  void _updateColors() {
    setState(() {
      // Generate random RGB values
      Random random = Random();
      int randomRed = random.nextInt(40);
      int randomGreen = random.nextInt(40);
      int randomBlue = random.nextInt(40);
      Color newColor = Color.fromRGBO(
        17 + randomRed,
        87 + randomGreen,
        204 + randomBlue,
        0.5,
      );
      color2 = color1;
      color1 = newColor;
    });
  }

//Color.fromRGBO(32, 102, 224, 0.2);
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Column(
            children: [
              Expanded(child: SizedBox()),
              Expanded(child: SizedBox()),
              AnimatedContainer(
                duration: const Duration(seconds: 3),
                height: 400 * MediaQuery.of(context).size.height / 620,
                width: 400 * MediaQuery.of(context).size.height / 620,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      color1,
                      color2,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(1400),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      );
}
