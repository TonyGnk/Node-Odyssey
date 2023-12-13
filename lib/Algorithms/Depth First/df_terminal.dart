import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';

List<Node>? runDepthTerminal() {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  List<List<Node>> stack = [];
  Set<int> visited = {};

  stack.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  while (stack.isNotEmpty) {
    int counter = 0;

    List<Node> currentPath = stack.removeLast();
    Node current = currentPath.last;

    if (current.value == end) {
      return currentPath;
    }

    // Calculate all the possible
    for (CalculationType type in CalculationType.values) {
      int newValue = getNewValue(current.value, type);
      // If the new value is allowed from the rules
      if (isAllowed(newValue, current.value, type)) {
        // If the new value is not visited
        if (!visited.contains(newValue) || avoidVisitedIsDisable) {
          Node newNode = getNewNode(
            current.value,
            current.cost,
            newValue,
            type,
          );
          List<Node> newPath = List.from(currentPath)..add(newNode);
          stack.insert(stack.length - counter, newPath);
          if (counter == 0) {
            visited.add(newNode.value);
          }
        }
      }
      counter++;
    }
  }

  return null;
}
