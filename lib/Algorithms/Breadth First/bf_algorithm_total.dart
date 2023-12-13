import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/Public Search Bar/check_box_search.dart';
import '../../Services & Providers/Public Search Bar/closed_search.dart';
import '../../Services & Providers/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services & Providers/Public Search Bar/submit_function.dart';
import '../../Services & Providers/six_calculations.dart';

Future<List<Node>?> runBreadthTotal(WidgetRef ref) async {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};

  queue.add([Node(start, 0, 'Initial Value')]);
  visited.add(start);

  while (queue.isNotEmpty) {
    await Future.delayed(Duration(milliseconds: searchSpeed));

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
