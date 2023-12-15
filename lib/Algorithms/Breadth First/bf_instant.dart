import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';

List<Node>? runBreadthInstant(WidgetRef ref) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};

  queue.add([Node(start, 0, 'Initial Value')]);
  visited.add(start);
  DateTime startTime = DateTime.now();

  while (queue.isNotEmpty) {
    if (DateTime.now().difference(startTime).inSeconds >= timeLimit) {
      queue.clear();
      updateGraphicalContent(ref, Node(0, 0, 'Time Out'), end);
      break;
    }

    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    if (current.value == end) return currentPath;

    updateGraphicalContent(ref, current, end);

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

  return null;
}
