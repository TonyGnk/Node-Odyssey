import 'dart:collection';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';

Future<List<Node>?> runBreadth(WidgetRef ref) async {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};

  queue.add([Node(start, 0, 'Initial Value')]);
  visited.add(start);

  Timer? timer;
  timer = Timer(Duration(seconds: timeLimit), () {
    queue.clear();
    updateGraphicalContent(ref, Node(0, 0, 'Time Out'), end);
    timer?.cancel();
  });

  while (queue.isNotEmpty) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    updateGraphicalContent(ref, current, end);

    if (current.value == end) {
      timer.cancel();
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
    await Future.delayed(Duration(milliseconds: searchSpeed));
  }

  timer.cancel();
  return null;
}
