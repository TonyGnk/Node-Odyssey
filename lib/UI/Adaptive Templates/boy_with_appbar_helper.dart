// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'body_with_appbar.dart';

class BackgroundWall extends ConsumerStatefulWidget {
  const BackgroundWall({
    super.key,
  });

  @override
  ConsumerState<BackgroundWall> createState() => _BackgroundWallState();
}

class _BackgroundWallState extends ConsumerState<BackgroundWall> {
  late Timer timer;

  @override
  void initState() {
    super.initState();

    setColors(ref);

    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      updateColors(ref);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(child: scaffoldGradient()),
          Row(
            children: [
              blueBall(),
              Expanded(child: SizedBox()),
            ],
          ),
        ],
      );

  scaffoldGradient() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).splashColor,
                Theme.of(context).scaffoldBackgroundColor
              ],
              stops: const [
                0.1,
                0.6
              ]),
        ),
      );

  blueBall() {
    final color1 = ref.watch(glassColor1);
    final color2 = ref.watch(glassColor2);
    final duration = ref.watch(durationProvider);
    return AnimatedContainer(
      duration: duration,
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
    );
  }
}
