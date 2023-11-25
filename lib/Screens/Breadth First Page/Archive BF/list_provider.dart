// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stopTimerProvider = StateProvider<bool>(
  (ref) => false,
);

final bfRunningProvider = StateProvider<BfRunning>(
  (ref) => BfRunning(
    startValue: BigInt.from(0),
    targetValue: BigInt.from(0),
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
  BigInt startValue;

  //Τελική Τιμή
  BigInt targetValue;

  // Speed of the algorithm
  int speed = 1;

  BigInt getStartValue() => startValue;
  void setStartValue(BigInt startValue) {
    this.startValue = startValue;
  }

  BigInt getTargetValue() => targetValue;
  void setTargetValue(BigInt targetValue) {
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

//

//

//

//

//

//

//

//

/// This function adds a container in column list
/// Every container had a given a height witch is a BigInt. Maybe is number 1 maybe 10^9
/// First we need to find the logarithm of the height.
/// We have 2 cases. The bigInt is actual big number or is a small number.
void addTrackingContainer(WidgetRef ref, BigInt height, BigInt target) {
  double logOfWidth;
  //Check if the bigInt is a small number (<60000)
  if (height < BigInt.from(50000)) {
    //If is a small number we can find the logarithm of the number
    logOfWidth = log(height.toInt() + 1);
  } else {
    //The number is a big number. We have to split the number in 3 parts first and after that in 50000 parts

    //Split the number in 3 parts
    BigInt bigInt1of3 = height ~/ BigInt.from(3);
    BigInt remainder = height % BigInt.from(3);

    //Split the number in 50000 parts
    double bigInt10f3of50 =
        (bigInt1of3.toDouble() + remainder.toDouble() / 3) / 50000;

    //With these 2 numbers we can find the logarithm of the number. We add 1 because the log of 0 is not defined.
    logOfWidth = log(bigInt10f3of50 + 1) + log(50000) + log(3);
    height < BigInt.from(110000) ? logOfWidth = logOfWidth - 0.8 : null;
  }
  //

  //
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
              message: 'Flex: $flex2 Value: ${height} Log: ${logOfWidth} ',
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
void clearTrackingBox(WidgetRef ref) {
  ref.read(chartColumnsProvider.notifier).state.clear();
}
