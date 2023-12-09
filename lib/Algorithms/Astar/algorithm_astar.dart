import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services & Providers/Public Search Bar/submit_function.dart';
import '../../Services & Providers/six_calculations.dart';

Future<List<Node>?> runAStarGui(WidgetRef ref, RunningRequest request) async {
  int start = request.startValue;
  int end = request.targetValue;
  Map<CalculationType, bool> enabledOperations = request.enabledOperations;

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};
  List<Node> compare = [];

  queue.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  while (queue.isNotEmpty) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    updateChartAndTrackingPanel(ref, current, end);

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

    //await Future.delayed(const Duration(milliseconds: 2500));
  }

  return null;
}

findSmallest(List<List<int?>> treeList, List<int?> treeListSmall, int target) {
  int? minValue;
  int? minListIndex;
  int? minValueIndex;

  for (int i = 0; i < treeList.length; i++) {
    for (int j = 0; j < treeList[i].length; j++) {
      if (treeList[i][j] != null) {
        int temp = (target - treeList[i][j]!).abs();
        if (minValue == null || temp < minValue) {
          minValue = temp;
          minListIndex = i;
          minValueIndex = j;
        }
      }
    }
  }

  return {
    'minListIndex': minListIndex,
    'minValueIndex': minValueIndex,
  };
}

//switch (type) if addition then 0 if subtraction then 1 etc
getPosition(type) {
  switch (type) {
    case CalculationType.addition:
      return 0;
    case CalculationType.subtraction:
      return 1;
    case CalculationType.multiplication:
      return 2;
    case CalculationType.division:
      return 3;
    case CalculationType.exponential:
      return 4;
    case CalculationType.square:
      return 5;
  }
}

List<Node>? runAStarTerminal(RunningRequest request) {
  int start = request.startValue;
  int end = request.targetValue;

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};

  queue.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  while (queue.isNotEmpty) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    if (current.value == end) {
      return currentPath;
    }

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
