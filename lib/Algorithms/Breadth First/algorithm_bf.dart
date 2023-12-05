import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services & Providers/Public Search Bar/submit_function.dart';
import '../../Services & Providers/node.dart';
import '../../Services & Providers/six_calculations.dart';

Future<List<Node>?> runBFGui(WidgetRef ref, RunningRequest request) async {
  int start = request.startValue;
  int end = request.targetValue;
  int speed = request.speed;
  Map<CalculationType, bool> enabledOperations = request.enabledOperations;

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};

  queue.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  while (queue.isNotEmpty) {
    await Future.delayed(Duration(milliseconds: speed));

    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    updateChartAndTrackingPanel(ref, current, end);

    if (current.value == end) {
      return currentPath;
    }

    for (CalculationType type in CalculationType.values) {
      if (enabledOperations[type]!) {
        int newValue = getNewValue(current.value, type);
        if (isAllowed(newValue, current.value, type)) {
          if (!visited.contains(newValue)) {
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

  return null;
}

List<Node>? runBFGuiTerminal(WidgetRef ref, RunningRequest request) {
  int start = request.startValue;
  int end = request.targetValue;

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};

  queue.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  while (queue.isNotEmpty) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    if (current.value == end) {
      return currentPath;
    }

    for (CalculationType type in CalculationType.values) {
      int newValue = getNewValue(current.value, type);
      if (isAllowed(newValue, current.value, type)) {
        if (!visited.contains(newValue)) {
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

  return null;
}
