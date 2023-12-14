import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Tree Widgets/providers_tree.dart';
import '../../Services/Tree Widgets/tree_helpler.dart';
import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/six_calculations.dart';
import 'bst_algorithm.dart';
import 'bst_step.dart';

List<Node>? runBSFAsyncStep(WidgetRef ref) {
  int end = int.parse(targetController.text);

  Map map = findSmallest(treeListBsf, treeListSmallBsf, end);
  int rightNodePosition = map['minListIndex'];
  int rightNodeValue = treeListSmallBsf[map['minListIndex']] ?? 0;

  Node rightNode = getNewNode(
    currentBsf.value,
    currentBsf.cost,
    rightNodeValue,
    positionToType(rightNodePosition),
  );
  List<Node> newPath = List.from(currentPathBsf)..add(rightNode);
  queueBsf.add(newPath);
  visitedBsf.add(rightNode.value);

  treeListSmallBsf = treeListBsf[rightNodePosition];
  treeListBsf = [
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
  ];

  //
  currentPathBsf = queueBsf.removeFirst();
  currentBsf = currentPathBsf.last;

  ref.read(throneProvider.notifier).state = currentBsf.value;
  updateChartAndTrackingPanel(ref, currentBsf, end);
  setKingLeafs(treeListSmallBsf, ref);

  //
  print(currentBsf.value == end);
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
        isFound = true;
      }
    }
  }
  if (isFound) return null;

  //

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

  //
  return null;
}
