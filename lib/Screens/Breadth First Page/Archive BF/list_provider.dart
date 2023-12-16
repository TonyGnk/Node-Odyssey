// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void addTrackingContainer(WidgetRef ref, int height) {
  double logOfWidth;
  ref.read(chartColumnsProvider.notifier).state.length == 2300
      ? ref.read(chartColumnsProvider.notifier).state.clear()
      : null;

  logOfWidth = log(height + 1);

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
Widget simpleContainer() => Container(
      width: 10,
      margin: const EdgeInsets.all(0.2),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.7),
      ),
    );

//

final chartColumnsProvider = StateProvider<List<Column>>(
  (ref) => [],
);

//function for clearing trackingBox
// void clearCharts(WidgetRef ref) {
//   ref.read(chartColumnsProvider.notifier).state.clear();
// }
