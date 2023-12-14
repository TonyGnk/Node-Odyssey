import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';

List<List<Node>> stackDf = [];
Set<int> visitedDf = {};

List<Node>? runDepthFirstStep(WidgetRef ref) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  stackDf.add([Node(start, 0, 'Initial Value')]);
  visitedDf.add(start);

  List<Node> currentPath = stackDf.removeLast();
  Node current = currentPath.last;

  updateChartAndTrackingPanel(ref, current, end);

  if (current.value == end) {
    return currentPath;
  }

  int counter = 0;

  // Calculate all the possible
  for (CalculationType type in CalculationType.values) {
    //If the operation is enabled
    if (enabledOperations[type]!) {
      int newValue = getNewValue(current.value, type);
      // If the new value is allowed from the rules
      if (isAllowed(newValue, current.value, type)) {
        // If the new value is not visited
        if (!visitedDf.contains(newValue) || avoidVisitedIsDisable) {
          Node newNode = getNewNode(
            current.value,
            current.cost,
            newValue,
            type,
          );
          List<Node> newPath = List.from(currentPath)..add(newNode);
          stackDf.insert(stackDf.length - counter, newPath);
          if (counter == 0) {
            visitedDf.add(newNode.value);
          }
        }
      }
    }
    counter++;
  }

  return null;
}

List<Node>? runDepthStep(WidgetRef ref) {
  int end = int.parse(targetController.text);

  List<Node> currentPath = stackDf.removeLast();
  Node current = currentPath.last;

  updateChartAndTrackingPanel(ref, current, end);

  if (current.value == end) {
    return currentPath;
  }

  int counter = 0;

  // Calculate all the possible
  for (CalculationType type in CalculationType.values) {
    //If the operation is enabled
    if (enabledOperations[type]!) {
      int newValue = getNewValue(current.value, type);
      // If the new value is allowed from the rules
      if (isAllowed(newValue, current.value, type)) {
        // If the new value is not visited
        if (!visitedDf.contains(newValue) || avoidVisitedIsDisable) {
          Node newNode = getNewNode(
            current.value,
            current.cost,
            newValue,
            type,
          );
          List<Node> newPath = List.from(currentPath)..add(newNode);
          stackDf.insert(stackDf.length - counter, newPath);
          if (counter == 0) {
            visitedDf.add(newNode.value);
          }
        }
      }
    }
    counter++;
  }

  return null;
}

List<Node>? runDepthToEnd(WidgetRef ref) {
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  while (stackDf.isNotEmpty) {
    int counter = 0;

    if (DateTime.now().difference(startTime).inSeconds >= timeLimit) {
      stackDf.clear();
      break;
    }

    List<Node> currentPath = stackDf.removeLast();
    Node current = currentPath.last;

    updateChartAndTrackingPanel(ref, current, end);

    if (current.value == end) {
      return currentPath;
    }

    for (CalculationType type in CalculationType.values) {
      int newValue = getNewValue(current.value, type);
      if (isAllowed(newValue, current.value, type)) {
        if (!visitedDf.contains(newValue) || avoidVisitedIsDisable) {
          Node newNode = getNewNode(
            current.value,
            current.cost,
            newValue,
            type,
          );
          List<Node> newPath = List.from(currentPath)..add(newNode);
          stackDf.insert(stackDf.length - counter, newPath);
          if (counter == 0) {
            visitedDf.add(newNode.value);
          }
        }
      }
      counter++;
    }
  }

  return null;
}
