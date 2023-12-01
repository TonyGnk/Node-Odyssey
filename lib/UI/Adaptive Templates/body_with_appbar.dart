// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  required bool isBlackFirst,
  required WidgetRef ref,
}) =>
    Stack(
      children: [
        BackgroundWallWithRandShapes(isBlackFirst: isBlackFirst, ref: ref),
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
  const BackgroundWallWithRandShapes({
    required this.isBlackFirst,
    required this.ref,
    super.key,
  });

  final bool isBlackFirst;
  final WidgetRef ref;

  @override
  State<BackgroundWallWithRandShapes> createState() =>
      _BackgroundWallWithRandShapesState();
}

class _BackgroundWallWithRandShapesState
    extends State<BackgroundWallWithRandShapes> {
  late Color color1 = widget.isBlackFirst
      ? Color.fromRGBO(32, 102, 224, 0)
      : Color.fromRGBO(32, 102, 224, 0.3);
  late Color color2 = widget.isBlackFirst
      ? Color.fromRGBO(32, 102, 224, 0)
      : Color.fromRGBO(32, 102, 224, 0.3);
  late Timer timer;
  late Duration duration = const Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    // Initialize colors with random values
    //_updateColors();

    //wait 2 seconds
    Future.delayed(const Duration(seconds: 1), () {
      // Here you can write your code
      setState(() {
        duration = const Duration(seconds: 5);
        widget.ref.read(durationProvider.notifier).state =
            const Duration(seconds: 5);
      });
    });

    // Set up a timer to update colors every 4 seconds
    timer = Timer.periodic(widget.ref.watch(durationProvider), (Timer t) {
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
      int randomRed = random.nextInt(50);
      int randomGreen = random.nextInt(50);
      int randomBlue = random.nextInt(50);
      Color newColor = Color.fromRGBO(
        17 + randomRed,
        87 + randomGreen,
        204 + randomBlue,
        widget.ref.watch(hideSmoothProvider) ? 0.0 : 0.5,
      );
      color2 = color1;
      color1 = newColor;
    });
  }

//Color.fromRGBO(32, 102, 224, 0.2);
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      //Colors.blue,
                      Theme.of(context).splashColor,
                      //Colors.red,
                      Theme.of(context).scaffoldBackgroundColor
                    ],
                    stops: const [
                      0.1,
                      0.6
                    ]),
              ),
            ),
          ),
          // Expanded(
          //   child: SizedBox(),
          // ),
          Row(
            children: [
              AnimatedContainer(
                duration: widget.ref.watch(durationProvider),
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
              Expanded(child: SizedBox()),
            ],
          ),
        ],
      );
}

//Create an bool provider
final hideSmoothProvider = StateProvider<bool>((ref) => false);

final durationProvider =
    StateProvider<Duration>((ref) => const Duration(milliseconds: 200));
