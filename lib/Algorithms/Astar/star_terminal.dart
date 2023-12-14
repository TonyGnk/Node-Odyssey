import 'dart:collection';

import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/six_calculations.dart';

List<Node>? runAStarTerminal() {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};
  List<Node> compare = [];

  queue.add([Node(start, 0, 'Initial Value')]);
  visited.add(start);

  while (queue.isNotEmpty) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    if (current.value == end) {
      return currentPath;
    }

    for (CalculationType type in CalculationType.values) {
      //If the operation is enabled
      if (enabledOperations[type]!) {
        int newValue = getNewValue(current.value, type);
        // If the new value is allowed from the rules
        if (isAllowed(newValue, current.value, type)) {
          // If the new value is not visited
          if (!visited.contains(newValue)) {
            Node newNode = getNewNode(
              current.value,
              current.cost,
              newValue,
              type,
            );
            newNode.setDistance(end);
            compare.add(newNode);
          }
        }
      }
    }

    int? minIndex;
    int? minValue;
    for (Node node in compare) {
      int value = node.cost + 2 * node.distance;

      if (minValue == null || value < minValue) {
        minValue = value;
        minIndex = compare.indexOf(node);
      }
    }

    if (minIndex != null) {
      List<Node> newPath = List.from(currentPath)..add(compare[minIndex]);
      queue.add(newPath);
      visited.add(compare[minIndex].value);
      compare.removeAt(minIndex);
    }
  }

  return null;
}
