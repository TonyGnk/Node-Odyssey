import 'dart:async';
import 'dart:collection';

import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';

List<Node>? runBreadthTerminal() {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};

  queue.add([Node(start, 0, 'Initial Value')]);
  visited.add(start);

  Timer? timer;
  timer = Timer(Duration(seconds: timeLimit), () {
    queue.clear();
    timer?.cancel();
  });

  while (queue.isNotEmpty) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    if (current.value == end) {
      timer.cancel();
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

  timer.cancel();
  return null;
}
