import 'dart:collection';

import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/six_calculations.dart';

List<Node>? runBreadthTerminal() {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};

  queue.add([Node(start, 0, 'Initial Value')]);
  visited.add(start);

  while (queue.isNotEmpty) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    if (current.value == end) currentPath;

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
