import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services & Providers/Public Search Bar/Search Call/submit_function.dart';
import '../../Services & Providers/six_calculations.dart';

Future<List<Node>?> runDFGui(WidgetRef ref, RunningRequest request) async {
  int start = request.startValue;
  int end = request.targetValue;
  int speed = request.speed;
  Map<CalculationType, bool> enabledOperations = request.enabledOperations;

  List<List<Node>> stack = [];
  Set<int> visited = {};

  stack.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  while (stack.isNotEmpty) {
    await Future.delayed(Duration(milliseconds: speed));
    int counter = 0;

    List<Node> currentPath = stack.removeLast();
    Node current = currentPath.last;

    updateChartAndTrackingPanel(ref, current, end);

    if (current.value == end) {
      return currentPath;
    }

    // Calculate all the possible
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
            List<Node> newPath = List.from(currentPath)..add(newNode);
            stack.insert(stack.length - counter, newPath);
            if (counter == 0) {
              visited.add(newNode.value);
            }
          }
        }
      }
      counter++;
    }
  }

  return null;
}

List<Node>? runDFGuiTerminal(RunningRequest request) {
  int start = request.startValue;
  int end = request.targetValue;

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
        if (!visited.contains(newValue)) {
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
