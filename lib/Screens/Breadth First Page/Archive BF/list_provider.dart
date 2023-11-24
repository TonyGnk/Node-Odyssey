import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stopTimerProvider = StateProvider<bool>(
  (ref) => false,
);

final bfRunningProvider = StateProvider<BfRunning>(
  (ref) => BfRunning(
    startValue: 0,
    targetValue: 0,
    speed: 1,
  ),
);

final bfRunningProviderUpdater = StateProvider<bool>(
  (ref) => false,
);

class BfRunning {
  BfRunning({
    required this.startValue,
    required this.targetValue,
    required this.speed,
  });

  //Αρχική Τιμή
  int startValue;

  //Τελική Τιμή
  int targetValue;

  // Speed of the algorithm
  int speed = 1;

  int getStartValue() => startValue;
  void setStartValue(int startValue) {
    this.startValue = startValue;
  }

  int getTargetValue() => targetValue;
  void setTargetValue(int targetValue) {
    this.targetValue = targetValue;
  }

  int getSpeed() => speed;
  void setSpeedFromSlider(double currentSliderValue) {
    if (currentSliderValue >= 0 && currentSliderValue <= 90) {
      speed = 1000 - (currentSliderValue.toInt() * 10);
    } else {
      speed = 1;
    }
  }
}

final isCreatingProvider = StateProvider<bool>(
  (ref) => true,
);

//

//3
void addTrackingContainer(
  WidgetRef ref,
  int width,
  int target,
) {
  double a = width / target * 10;
  double bc = 10 - a;
  double logOfWidth = log(width + 1);
  //find the logarithm of width with base 3
  logOfWidth = logOfWidth / log(1.03);
  print(logOfWidth);
  ref.read(chartColumnsProvider.notifier).state.length == 2300
      ? ref.read(chartColumnsProvider.notifier).state.clear()
      : null;
  ref.read(chartColumnsProvider.notifier).state.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Tooltip(
              preferBelow: false,
              message: '$width',
              child: Container(
                height: logOfWidth,
                width: 10,
                margin: EdgeInsets.all(0.2),
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   width: 1,
                  //   color: Colors.black,
                  // ),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
}

//log
final chartColumnsProvider = StateProvider<List<Column>>(
  (ref) => [],
);

//function for clearing trackingBox
void clearTrackingBox(WidgetRef ref) {
  ref.read(chartColumnsProvider.notifier).state.clear();
}
