import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';

List<Node> runDepth(WidgetRef ref, RunningStyle style) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  List<List<Node>> stack = [
    [Node(start, 0, 'Initial Value')]
  ];
  Set<int> visited = {start};

  while (stack.isNotEmpty &&
      DateTime.now().difference(startTime).inSeconds < timeLimit) {
    int counter = 0;

    List<Node> currentPath = stack.removeLast();
    Node current = currentPath.last;

    updateGraphicalContent(ref, current, end);

    if (current.value == end) return currentPath;

    // Calculate all the possible
    for (CalculationType type in CalculationType.values) {
      //If the operation is enabled
      if (enabledOperations[type]!) {
        int newValue = getNewValue(current.value, type);
        // If the new value is allowed from the rules
        if (isAllowed(newValue, current.value, type)) {
          // If the new value is not visited
          if (!visited.contains(newValue) || avoidVisitedIsDisable) {
            Node newNode = getNewNode(
              current.value,
              current.cost,
              newValue,
              type,
            );
            List<Node> newPath = List.from(currentPath)..add(newNode);
            stack.insert(stack.length - counter, newPath);
            if (counter == 0) {
              visited.add(newNode.value);
            }
          }
        }
      }
      counter++;
    }
  }

  return [];
}

Future<List<Node>> runDepthAsync(WidgetRef ref, RunningStyle style) async {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  List<List<Node>> stack = [
    [Node(start, 0, 'Initial Value')]
  ];
  Set<int> visited = {start};

  while (stack.isNotEmpty &&
      DateTime.now().difference(startTime).inSeconds < timeLimit) {
    int counter = 0;

    List<Node> currentPath = stack.removeLast();
    Node current = currentPath.last;

    updateGraphicalContent(ref, current, end);

    if (current.value == end) return currentPath;

    // Calculate all the possible
    for (CalculationType type in CalculationType.values) {
      //If the operation is enabled
      if (enabledOperations[type]!) {
        int newValue = getNewValue(current.value, type);
        // If the new value is allowed from the rules
        if (isAllowed(newValue, current.value, type)) {
          // If the new value is not visited
          if (!visited.contains(newValue) || avoidVisitedIsDisable) {
            Node newNode = getNewNode(
              current.value,
              current.cost,
              newValue,
              type,
            );
            List<Node> newPath = List.from(currentPath)..add(newNode);
            stack.insert(stack.length - counter, newPath);
            if (counter == 0) {
              visited.add(newNode.value);
            }
          }
        }
      }
      counter++;
    }
    await Future.delayed(Duration(milliseconds: searchSpeed));
  }

  return [];
}
