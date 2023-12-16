import 'dart:collection';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';

List<Node> runBreadth(WidgetRef ref, RunningStyle style) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  ListQueue<List<Node>> queue = ListQueue();
  queue.add([Node(start, 0, 'Initial Value')]);
  Set<int> visited = {start};

  while (queue.isNotEmpty &&
      DateTime.now().difference(startTime).inSeconds < timeLimit) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    updateGraphicalContent(ref, current, end);

    if (current.value == end) return currentPath;

    for (CalculationType type in CalculationType.values) {
      if (enabledOperations[type]!) {
        int newValue = getNewValue(current.value, type);
        if (isAllowed(newValue, current.value, type)) {
          if (!visited.contains(newValue) || avoidVisitedIsDisable) {
            Node newNode = getNewNode(
              current.value,
              current.cost,
              newValue,
              type,
            );
            List<Node> newPath = List.from(currentPath)..add(newNode);
            queue.add(newPath);
            visited.add(newNode.value);
          }
        }
      }
    }
  }

  return [];
}

Future<List<Node>> runBreadthAsync(WidgetRef ref, RunningStyle style) async {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  ListQueue<List<Node>> queue = ListQueue();
  queue.add([Node(start, 0, 'Initial Value')]);
  Set<int> visited = {start};

  while (queue.isNotEmpty &&
      DateTime.now().difference(startTime).inSeconds < timeLimit) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    updateGraphicalContent(ref, current, end);

    if (current.value == end) return currentPath;

    for (CalculationType type in CalculationType.values) {
      if (enabledOperations[type]!) {
        int newValue = getNewValue(current.value, type);
        if (isAllowed(newValue, current.value, type)) {
          if (!visited.contains(newValue) || avoidVisitedIsDisable) {
            Node newNode = getNewNode(
              current.value,
              current.cost,
              newValue,
              type,
            );
            List<Node> newPath = List.from(currentPath)..add(newNode);
            queue.add(newPath);
            visited.add(newNode.value);
          }
        }
      }
    }
    await Future.delayed(Duration(milliseconds: searchSpeed));
  }

  return [];
}
