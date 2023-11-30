// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/six_calculations.dart';

final stopTimerProvider = StateProvider<bool>(
  (ref) => false,
);

final bfRunningProvider = StateProvider<BfRunning>(
  (ref) => BfRunning(
    startValue: 0,
    targetValue: 0,
    speed: 1,
    enableCalculationMap: {
      CalculationType.addition: true,
      CalculationType.subtraction: true,
      CalculationType.multiplication: true,
      CalculationType.division: true,
      CalculationType.exponential: true,
      CalculationType.square: true,
    },
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
    required this.enableCalculationMap,
  });

  //Αρχική Τιμή
  int startValue;

  //Τελική Τιμή
  int targetValue;

  // Speed of the algorithm
  int speed = 1;

  Map<CalculationType, bool> enableCalculationMap;

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
// ref.read(chartColumnsProvider.notifier).state.length == 2300
//     ? ref.read(chartColumnsProvider.notifier).state.clear()
//     : null;
//

//

/// This function adds a container in column list
/// Every container had a given a height witch is a BigInt. Maybe is number 1 maybe 10^9
void addTrackingContainer(WidgetRef ref, int height, int target) {
  double logOfWidth;
  ref.read(chartColumnsProvider.notifier).state.length == 2300
      ? ref.read(chartColumnsProvider.notifier).state.clear()
      : null;

  logOfWidth = log(height.toInt() + 1);

  logOfWidth = logOfWidth / log(1.0219);
  double doubleFlex2 = logOfWidth / 9.565920679129044;
  doubleFlex2 = doubleFlex2 * 10;

  //

  //Calculating the flex
  int flex2 = doubleFlex2.toInt();
  int flex1 = 1000 - flex2;

  //Adding the container
  ref.read(chartColumnsProvider.notifier).state.add(
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Expanded(
            flex: flex1,
            child: const SizedBox(),
          ),
          Expanded(
            flex: flex2,
            child: Tooltip(
              preferBelow: false,
              message: '$height',
              child: simpleContainer(),
            ),
          )
        ]),
      );
}

//

//

//

//

//

//

//

//

//

//
//

//

//

//
Widget simpleContainer() => Container(
      width: 10,
      margin: const EdgeInsets.all(0.2),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.7),
      ),
    );

//

void addTrackingContainer2(WidgetRef ref, int width, int target) {
  ref.read(chartColumnsProvider.notifier).state.clear();

  double logOfWidth = log(width + 1);
  double logOfTarget = log(target + 1);
  logOfWidth = logOfWidth / log(1.02);
  print(logOfWidth);

  List<int> customSetOfWidth = [
    1,
    10,
    100,
    1000,
    10000,
    100000,
    1000000,
    10000000,
    100000000,
    1000000000
  ];
  List<double> logCustomSetOfWidth = [];

  for (int i = 0; i < customSetOfWidth.length; i++) {
    logCustomSetOfWidth.add(log(customSetOfWidth[i] + 1) / log(1.0219));
  }

  ref.read(chartColumnsProvider.notifier).state.length == 2300
      ? ref.read(chartColumnsProvider.notifier).state.clear()
      : null;
  for (int i = 0; i < logCustomSetOfWidth.length; i++) {
    double doubleFlex2 = logCustomSetOfWidth[i] / 9.565920679129044;
    int flex2 = doubleFlex2.toInt();
    int flex1 = 100 - flex2;

    ref.read(chartColumnsProvider.notifier).state.add(
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
              flex: flex1,
              child: const SizedBox(),
            ),
            Expanded(
              flex: flex2,
              child: Tooltip(
                preferBelow: false,
                message:
                    'Flex: $flex2 Value: ${customSetOfWidth[i]} Log: ${logCustomSetOfWidth[i]} ',
                child: Container(
                  //height: logCustomSetOfWidth[i],
                  width: 10,
                  margin: const EdgeInsets.all(0.2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ]),
        );
  }
}

//log
final chartColumnsProvider = StateProvider<List<Column>>(
  (ref) => [],
);

//function for clearing trackingBox
// void clearCharts(WidgetRef ref) {
//   ref.read(chartColumnsProvider.notifier).state.clear();
// }
