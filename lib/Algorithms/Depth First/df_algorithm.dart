import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';

Future<List<Node>?> runDepth(WidgetRef ref) async {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  List<List<Node>> stack = [];
  Set<int> visited = {};

  stack.add([Node(start, 0, 'Initial Value')]);
  visited.add(start);

  while (stack.isNotEmpty) {
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
      }
      counter++;
    }
    await Future.delayed(Duration(milliseconds: searchSpeed));
  }

  return null;
}
