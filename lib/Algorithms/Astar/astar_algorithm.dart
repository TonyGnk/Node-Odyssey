import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';
import 'astar_helper.dart';

List<Node> runStar() {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  Set<int> visited = {start};
  PriorityQueue queue = PriorityQueue([Node(start, 0, 'Initial Value')]);

  while (!queue.isEmpty) {
    if (DateTime.now().difference(startTime).inSeconds >= timeLimit) {
      queue.clear();

      break;
    }

    Node current = queue.removeFirst();

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
