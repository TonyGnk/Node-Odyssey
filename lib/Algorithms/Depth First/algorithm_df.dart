import '../../Services & Providers/node.dart';

int barrier = 1000;

void StartSearching(int start, int target) {
  List<Node> stack = [];
  Set<int> visited = Set();
  stack.add(Node(start, 0, ''));
  visited.add(start);

  while (stack.isNotEmpty) {
    Node current = stack.removeLast();
    print('Current node: ${current.value}');

    if (current.value == target) {
      print('Found a path: ${current.operation}');
      return;
    }
    if (current.value * 2 < barrier && !visited.contains(current.value * 2)) {
      stack.add(
          Node(current.value * 2, current.cost + 1, '${current.operation}*2 '));
      visited.add(current.value * 2);
    }
    if (current.value + 1 < barrier && !visited.contains(current.value + 1)) {
      stack.add(
          Node(current.value + 1, current.cost + 1, '${current.operation}+1 '));
      visited.add(current.value + 1);
    }
  }

  print('No path found');
}
