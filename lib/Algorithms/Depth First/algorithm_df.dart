class Node {
  Node(this.value, this.cost, this.operation);

  int value;
  int cost;
  String operation;
}

void StartSearching(int start, int target) {
  List<Node> stack = [];
  stack.add(Node(start, 0, ''));

  while (stack.isNotEmpty) {
    Node current = stack.removeLast();

    if (current.value == target) {
      print('Found a path: ${current.operation}');
      return;
    }

    if (current.value < target) {
      stack.add(
          Node(current.value + 1, current.cost + 1, '${current.operation}+1 '));
      stack.add(
          Node(current.value * 2, current.cost + 1, '${current.operation}*2 '));
    }
  }

  print('No path found');
}
