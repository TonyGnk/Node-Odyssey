import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/tracking_container.dart';

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
void adddTrackingContainer(
  WidgetRef ref,
  String text,
  int width,
  int target,
) {
  double a = width / target * 10;
  double bc = 10 - a;
  ref.read(trackingBox.notifier).state.add(
        Column(
          children: [
            Expanded(
              child: Container(
                width: 10,
                color: const Color.fromARGB(255, 73, 67, 67).withOpacity(1),
              ),
            ),
            Expanded(
              child: Container(
                width: 10,
                color: const Color.fromARGB(255, 73, 67, 67).withOpacity(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: bc.toInt(), child: const SizedBox()),
                    Expanded(
                        flex: a.toInt(),
                        child: Container(color: Colors.grey.withOpacity(0.4))),
                    //Expanded(flex: bc.toInt(), child: const SizedBox()),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

//log
final trackingBox = StateProvider<List<Column>>(
  (ref) => [],
);
