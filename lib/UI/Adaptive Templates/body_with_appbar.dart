// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'boy_with_appbar_helper.dart';

Widget bodyWithAppBarGlass({
  required Widget appBar,
  required Widget body,
}) =>
    Stack(
      children: [
        BackgroundWall(),
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

final durationProvider =
    StateProvider<Duration>((ref) => const Duration(milliseconds: 500));

final glassColor1 =
    StateProvider<Color>((ref) => Color.fromRGBO(32, 102, 224, 0));

final glassColor2 =
    StateProvider<Color>((ref) => Color.fromRGBO(32, 102, 224, 0));

updateColors(WidgetRef ref) async {
  Random random = Random();
  int randomRed = random.nextInt(60);
  int randomGreen = random.nextInt(60);
  int randomBlue = random.nextInt(50);
  Color newColor = Color.fromRGBO(
    17 + randomRed,
    87 + randomGreen,
    204 + randomBlue,
    0.5,
  );

  ref.read(glassColor2.notifier).state = ref.read(glassColor1.notifier).state;
  ref.read(glassColor1.notifier).state = newColor;
}

setColors(WidgetRef ref) async {
  Future.delayed(const Duration(milliseconds: 400), () {
    ref.read(glassColor1.notifier).state = Color.fromRGBO(32, 102, 224, 0.5);
  });
  Future.delayed(const Duration(milliseconds: 700), () {
    ref.read(glassColor1.notifier).state = Color.fromRGBO(32, 102, 194, 0.5);
    ref.read(glassColor2.notifier).state = Color.fromRGBO(32, 102, 224, 0.5);
  });
  Future.delayed(const Duration(seconds: 2), () {
    ref.read(durationProvider.notifier).state = const Duration(seconds: 5);
  });
}
