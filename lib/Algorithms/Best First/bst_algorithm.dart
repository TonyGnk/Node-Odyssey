import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/Tree Widgets/tree_helpler.dart';
import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/six_calculations.dart';
import 'bst_step_helper.dart';

List<Node> runBest(WidgetRef ref, RunningStyle style) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  ListQueue<List<Node>> queue = ListQueue();
  List<List<int?>> treeList = List.filled(6, List<int?>.filled(6, null));
  List<int?> treeListSmall = List.filled(6, null);
  bool founded = false;

  queue.add([Node(start, 0, 'Initial Value')]);
  Set<int> visited = {start};

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

  while (queue.isNotEmpty &&
      DateTime.now().difference(startTime).inSeconds < timeLimit) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    setKingLeafs(treeListSmall, ref);
    updateGraphicalContent(ref, current, end);

    if (current.value == end) return currentPath;

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

    treeListSmall = treeList[rightNodePosition];
    treeList = List.filled(6, List<int?>.filled(6, null));
  }

  return [];
}
