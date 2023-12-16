import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';
import 'astar_helper.dart';

List<Node> runStar(WidgetRef ref, RunningStyle style) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  Set<int> visited = {start};
  PriorityQueue queue = PriorityQueue([Node(start, 0, 'Initial Value')]);

  while (!queue.isEmpty &&
      DateTime.now().difference(startTime).inSeconds < timeLimit) {
    Node current = queue.removeFirst();
    updateGraphicalContent(ref, current, end);

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

Future<List<Node>> runStarAsync(WidgetRef ref, RunningStyle style) async {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  Set<int> visited = {start};
  PriorityQueue queue = PriorityQueue([Node(start, 0, 'Initial Value')]);

  while (!queue.isEmpty &&
      DateTime.now().difference(startTime).inSeconds < timeLimit) {
    Node current = queue.removeFirst();
    updateGraphicalContent(ref, current, end);

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
    await Future.delayed(Duration(milliseconds: searchSpeed));
  }

  return [];
}
