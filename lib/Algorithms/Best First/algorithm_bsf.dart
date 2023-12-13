import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Arc/Tree Widgets/providers_tree.dart';
import '../../Arc/Tree Widgets/tree_helpler.dart';
import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services & Providers/Public Search Bar/Search Call/call_helper.dart';
import '../../Services & Providers/six_calculations.dart';

Future<List<Node>?> runBSFGui(WidgetRef ref, RunningRequest request) async {
  int start = request.startValue;
  int end = request.targetValue;
  Map<CalculationType, bool> enabledOperations = request.enabledOperations;

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};
  clearLeafs(ref);

  queue.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  List<List<int?>> treeList = [
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
  ];

  List<int?> treeListSmall = [null, null, null, null, null, null];
  for (CalculationType type in CalculationType.values) {
    if (enabledOperations[type]!) {
      int newValue = getNewValue(start, type);
      if (isAllowed(newValue, start, type)) {
        if (!visited.contains(newValue)) {
          treeListSmall[getPosition(type)] = newValue;
        }
      }
    }
  }
  bool founded = false;
  while (queue.isNotEmpty) {
    setKingLeafs(treeListSmall, ref);
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    ref.read(throneProvider.notifier).state = current.value;
    updateChartAndTrackingPanel(ref, current, end);

    if (current.value == end) {
      return currentPath;
    }

    for (int i = 0; i < treeListSmall.length; i++) {
      if (treeListSmall[i] != null) {
        if (treeListSmall[i] == end) {
          Node rightNode = getNewNode(
            current.value,
            current.cost,
            treeListSmall[i] ?? 0,
            positionToType(i),
          );
          List<Node> newPath = List.from(currentPath)..add(rightNode);
          queue.add(newPath);
          founded = true;
        }
      }
    }
    if (founded) continue;

    for (int i = 0; i < treeListSmall.length; i++) {
      if (treeListSmall[i] == null) {
        treeList[i] = [null, null, null, null, null, null];
      } else {
        List<int?> temp = [null, null, null, null, null, null];
        for (CalculationType type in CalculationType.values) {
          if (enabledOperations[type]!) {
            int newValue = getNewValue(treeListSmall[i], type);
            if (isAllowed(newValue, treeListSmall[i], type)) {
              if (!visited.contains(newValue)) {
                temp[getPosition(type)] = newValue;
              }
            }
          }
        }
        treeList[i] = temp;
      }
    }
    setLeafs(treeList, ref);
    Map map = findSmallest(treeList, treeListSmall, end);
    int rightNodePosition = map['minListIndex'];
    int rightNodeValue = treeListSmall[map['minListIndex']] ?? 0;

    Node rightNode = getNewNode(
      current.value,
      current.cost,
      rightNodeValue,
      positionToType(rightNodePosition),
    );
    List<Node> newPath = List.from(currentPath)..add(rightNode);
    queue.add(newPath);
    visited.add(rightNode.value);

    //Update the list small. Store the list of the smallest value in a variable
    treeListSmall = treeList[rightNodePosition];
    treeList = [
      [null, null, null, null, null, null],
      [null, null, null, null, null, null],
      [null, null, null, null, null, null],
      [null, null, null, null, null, null],
      [null, null, null, null, null, null],
      [null, null, null, null, null, null],
    ];
    await Future.delayed(const Duration(milliseconds: 500));
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

List<Node>? runBSFTerminal(RunningRequest request) {
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
