import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Tree Widgets/providers_tree.dart';
import '../../Services/Tree Widgets/tree_helpler.dart';
import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/six_calculations.dart';
import 'bst_step_helper.dart';

ListQueue<List<Node>> queueBsf = ListQueue();
Set<int> visitedBsf = {};
List<List<int?>> treeListBsf = [
  [null, null, null, null, null, null],
  [null, null, null, null, null, null],
  [null, null, null, null, null, null],
  [null, null, null, null, null, null],
  [null, null, null, null, null, null],
  [null, null, null, null, null, null],
];
List<int?> treeListSmallBsf = [null, null, null, null, null, null];
List<Node> currentPathBsf = [];
Node currentBsf = Node(0, 0, '');
bool foundedBsf = false;

List<Node>? runBestFirstStep(WidgetRef ref) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  treeListBsf = [
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
  ];
  treeListSmallBsf = [null, null, null, null, null, null];
  queueBsf = ListQueue();
  visitedBsf = {};
  clearLeafs(ref);
  foundedBsf = false;

  queueBsf.add([Node(start, 0, 'Initial Value')]);
  visitedBsf.add(start);

  for (CalculationType type in CalculationType.values) {
    if (enabledOperations[type]!) {
      int newValue = getNewValue(start, type);
      if (isAllowed(newValue, start, type)) {
        if (!visitedBsf.contains(newValue)) {
          treeListSmallBsf[getPosition(type)] = newValue;
        }
      }
    }
  }
  setKingLeafs(treeListSmallBsf, ref);

  currentPathBsf = queueBsf.removeFirst();
  currentBsf = currentPathBsf.last;

  ref.read(throneProvider.notifier).state = currentBsf.value;
  updateGraphicalContent(ref, currentBsf, end, visitedBsf.length);

  if (currentBsf.value == end) {
    return currentPathBsf;
  }

  for (int i = 0; i < treeListSmallBsf.length; i++) {
    if (treeListSmallBsf[i] != null) {
      if (treeListSmallBsf[i] == end) {
        Node rightNode = getNewNode(
          currentBsf.value,
          currentBsf.cost,
          treeListSmallBsf[i] ?? 0,
          positionToType(i),
        );
        List<Node> newPath = List.from(currentPathBsf)..add(rightNode);
        queueBsf.add(newPath);
        return newPath;
      }
    }
  }

  for (int i = 0; i < treeListSmallBsf.length; i++) {
    if (treeListSmallBsf[i] == null) {
      treeListBsf[i] = [null, null, null, null, null, null];
    } else {
      List<int?> temp = [null, null, null, null, null, null];
      for (CalculationType type in CalculationType.values) {
        if (enabledOperations[type]!) {
          int newValue = getNewValue(treeListSmallBsf[i], type);
          if (isAllowed(newValue, treeListSmallBsf[i], type)) {
            if (!visitedBsf.contains(newValue)) {
              temp[getPosition(type)] = newValue;
            }
          }
        }
      }
      treeListBsf[i] = temp;
    }
  }
  setLeafs(treeListBsf, ref);

  Map map = findSmallest(treeListBsf, end);
  rightNodePosition = map['minListIndex'];
  rightNodeValue = treeListSmallBsf[map['minListIndex']] ?? 0;

  return null;
}
