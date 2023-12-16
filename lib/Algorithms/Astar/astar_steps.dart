import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';
import 'astar_helper.dart';

Set<int> visited = {};
PriorityQueue queue = PriorityQueue();

List<Node>? runStarFirstStep(WidgetRef ref, RunningStyle style) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  visited = {start};
  queue = PriorityQueue([Node(start, 0, 'Initial Value')]);

  Node current = queue.removeFirst();

  updateTracking(ref, style, current);

  if (current.value == end) return reconstructPath(current);

  for (CalculationType type in CalculationType.values) {
    if (enabledOperations[type]!) {
      int newValue = getNewValue(current.value, type);
      if (isAllowed(newValue, current.value, type)) {
        if (!visited.contains(newValue)) {
          Node newNode = getNewNodeZ(
            current,
            current.value,
            current.cost,
            newValue,
            type,
          );
          newNode.setDistance(end);
          queue.add(newNode);
          visited.add(newNode.value);
        }
      }
    }
  }

  return null;
}

List<Node>? runStarStep(WidgetRef ref, RunningStyle style) {
  int end = int.parse(targetController.text);

  Node current = queue.removeFirst();
  updateTracking(ref, style, current);

  if (current.value == end) return reconstructPath(current);

  for (CalculationType type in CalculationType.values) {
    if (enabledOperations[type]!) {
      int newValue = getNewValue(current.value, type);
      if (isAllowed(newValue, current.value, type)) {
        if (!visited.contains(newValue)) {
          Node newNode = getNewNodeZ(
            current,
            current.value,
            current.cost,
            newValue,
            type,
          );
          newNode.setDistance(end);
          queue.add(newNode);
          visited.add(newNode.value);
        }
      }
    }
  }

  return null;
}

List<Node> runStarToEnd(WidgetRef ref, RunningStyle style) {
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  while (!queue.isEmpty) {
    if (DateTime.now().difference(startTime).inSeconds >= timeLimit) {
      queue.clear();
      updateTracking(ref, style);
      break;
    }

    Node current = queue.removeFirst();
    updateTracking(ref, style, current);

    if (current.value == end) return reconstructPath(current);

    for (CalculationType type in CalculationType.values) {
      if (enabledOperations[type]!) {
        int newValue = getNewValue(current.value, type);
        if (isAllowed(newValue, current.value, type)) {
          if (!visited.contains(newValue)) {
            Node newNode = getNewNodeZ(
              current,
              current.value,
              current.cost,
              newValue,
              type,
            );
            newNode.setDistance(end);
            queue.add(newNode);
            visited.add(newNode.value);
          }
        }
      }
    }
  }

  return [];
}
