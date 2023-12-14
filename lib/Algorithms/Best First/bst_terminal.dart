import 'dart:collection';

import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/six_calculations.dart';

List<Node>? runBestTerminal() {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};

  queue.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  while (queue.isNotEmpty) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    if (current.value == end) return currentPath;

    List<Node> calculationList = [];
    for (CalculationType type in CalculationType.values) {
      int newValue = getNewValue(current.value, type);
      if (isAllowed(newValue, current.value, type)) {
        if (!visited.contains(newValue)) {
          calculationList.add(
            getNewNode(current.value, current.cost, newValue, type),
          );
        }
      }
    }
  }

  return null;
}
