import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services & Providers/Public Search Bar/submit_function.dart';
import '../../Services & Providers/node.dart';
import '../../Services & Providers/six_calculations.dart';

Future<List<Node>?> runDFGui(WidgetRef ref) async {
  RunningRequest request = ref.read(runningRequestProvider.notifier).state;
  int start = request.startValue;
  int end = request.targetValue;
  Map<CalculationType, bool> enabledOperations = request.enabledOperations;

  List<List<Node>> stack = [];
  Set<int> visited = {};

  stack.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  while (stack.isNotEmpty) {
    int counter = 0;
    await Future.delayed(Duration(milliseconds: 3));

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
            print(type.toString() + ': ' + newValue.toString());
            Node newNode = getNewNode(
              current.value,
              current.cost,
              newValue,
              type,
            );
            List<Node> newPath = List.from(currentPath)
              ..add(
                  newNode); // Αυτή η εντολή δημιουργεί ένα νέο λίστα με τα στοιχεία της currentPath και προσθέτει στο τέλος της τον newNode
            //stack.add(newPath);
            //stack.insert(0, newPath);

            //Add in stack at the last position
            //stack.add(newPath);
            //Add in stack at the preLast position
            stack.insert(stack.length - counter, newPath);

            //visited.add(newNode.value);
          }
        }
      }
      counter++;
    }

    //print all nodes of stack
    for (List<Node> path in stack) {
      print('Node Number: ' + stack.indexOf(path).toString());
      for (Node node in path) {
        print('Path: ' + node.value.toString());
      }
    }
  }

  return null;
}
