import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Tree Widgets/providers_tree.dart';
import '../../Services/Tree Widgets/tree_helpler.dart';
import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/six_calculations.dart';
import 'bst_step.dart';

int rightNodePosition = 0;
int rightNodeValue = 0;

List<Node>? runBestStep(WidgetRef ref) {
  int end = int.parse(targetController.text);

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
  setKingLeafs(treeListSmallBsf, ref);
  treeListBsf = [
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
  ];
  currentPathBsf = queueBsf.removeFirst();
  currentBsf = currentPathBsf.last;
  if (currentBsf.value == end) return currentPathBsf;

  ref.read(throneProvider.notifier).state = currentBsf.value;
  updateGraphicalContent(ref, currentBsf, end, visitedBsf.length);
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
        foundedBsf = true;
      }
    }
  }
  if (foundedBsf) return null;

  //Open the Grand Children
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

findSmallest(List<List<int?>> treeList, int target) {
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
        if (temp < minValue) {
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
