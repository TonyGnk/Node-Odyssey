import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/Public Search Bar/Search Call/call_helper.dart';
import '../../Services & Providers/Public Search Bar/check_box_search.dart';
import '../../Services & Providers/Public Search Bar/closed_search.dart';
import '../../Services & Providers/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services & Providers/six_calculations.dart';

ListQueue<List<Node>> queueBf = ListQueue();
Set<int> visitedBf = {};

List<Node>? runBreadthFirstStep(WidgetRef ref) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  queueBf.add([Node(start, 0, 'Initial Value')]);
  visitedBf.add(start);

  List<Node> currentPath = queueBf.removeFirst();
  Node current = currentPath.last;

  updateChartAndTrackingPanel(ref, current, end);

  if (current.value == end) {
    return currentPath;
  }

  for (CalculationType type in CalculationType.values) {
    if (enabledOperations[type]!) {
      int newValue = getNewValue(current.value, type);
      if (isAllowed(newValue, current.value, type)) {
        if (!visitedBf.contains(newValue) || avoidVisitedIsDisable) {
          Node newNode = getNewNode(
            current.value,
            current.cost,
            newValue,
            type,
          );
          List<Node> newPath = List.from(currentPath)..add(newNode);
          queueBf.add(newPath);
          visitedBf.add(newNode.value);
        }
      }
    }
  }

  return null;
}

List<Node>? runBreadthStep(WidgetRef ref) {
  int end = int.parse(targetController.text);

  List<Node> currentPath = queueBf.removeFirst();
  Node current = currentPath.last;

  updateChartAndTrackingPanel(ref, current, end);

  if (current.value == end) {
    return currentPath;
  }

  for (CalculationType type in CalculationType.values) {
    if (enabledOperations[type]!) {
      int newValue = getNewValue(current.value, type);
      if (isAllowed(newValue, current.value, type)) {
        if (!visitedBf.contains(newValue) || avoidVisitedIsDisable) {
          Node newNode = getNewNode(
            current.value,
            current.cost,
            newValue,
            type,
          );
          List<Node> newPath = List.from(currentPath)..add(newNode);
          queueBf.add(newPath);
          visitedBf.add(newNode.value);
        }
      }
    }
  }

  return null;
}
