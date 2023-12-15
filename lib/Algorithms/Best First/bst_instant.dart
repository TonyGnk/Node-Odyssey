import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/Tree Widgets/tree_helpler.dart';
import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/six_calculations.dart';
import 'bst_algorithm.dart';

List<Node>? runBestInstant(WidgetRef ref) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);

  DateTime startTime = DateTime.now();
  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};
  List<List<int?>> treeList = [
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
  ];
  List<int?> treeListSmall = [null, null, null, null, null, null];
  bool founded = false;

  queue.add([Node(start, 0, 'Initial Value')]);
  visited.add(start);

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

  while (queue.isNotEmpty) {
    if (DateTime.now().difference(startTime).inSeconds >= timeLimit) {
      queue.clear();
      updateGraphicalContent(ref, Node(0, 0, 'Time Out'), end);
      break;
    }

    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    setKingLeafs(treeListSmall, ref);
    updateGraphicalContent(ref, current, end);

    //Check For Solution itself
    if (current.value == end) {
      return currentPath;
    }

    //Check For Solution in First Children
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

    //Open the Grand Children
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
    Map map = findSmallest(treeList, end);
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
  }

  return null;
}