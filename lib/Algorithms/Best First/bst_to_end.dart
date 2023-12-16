import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/Tree Widgets/tree_helpler.dart';
import '../../Services/six_calculations.dart';
import 'bst_step.dart';
import 'bst_step_helper.dart';

List<Node>? runBestToEnd(WidgetRef ref) {
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

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

  while (queueBsf.isNotEmpty) {
    if (DateTime.now().difference(startTime).inSeconds >= timeLimit) {
      queueBsf.clear();
      updateGraphicalContent(ref, Node(0, 0, 'Time Out'), end);
      break;
    }

    List<Node> currentPath = queueBsf.removeFirst();
    Node current = currentPath.last;

    setKingLeafs(treeListSmallBsf, ref);
    updateGraphicalContent(ref, current, end);

    //Check For Solution itself
    if (current.value == end) {
      return currentPath;
    }

    //Check For Solution in First Children
    for (int i = 0; i < treeListSmallBsf.length; i++) {
      if (treeListSmallBsf[i] != null) {
        if (treeListSmallBsf[i] == end) {
          Node rightNode = getNewNode(
            current.value,
            current.cost,
            treeListSmallBsf[i] ?? 0,
            positionToType(i),
          );
          List<Node> newPath = List.from(currentPath)..add(rightNode);
          queueBsf.add(newPath);
          foundedBsf = true;
        }
      }
    }
    if (foundedBsf) continue;

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
    int rightNodePosition = map['minListIndex'];
    int rightNodeValue = treeListSmallBsf[map['minListIndex']] ?? 0;

    Node rightNode = getNewNode(
      current.value,
      current.cost,
      rightNodeValue,
      positionToType(rightNodePosition),
    );
    List<Node> newPath = List.from(currentPath)..add(rightNode);
    queueBsf.add(newPath);
    visitedBsf.add(rightNode.value);

    //Update the list small. Store the list of the smallest value in a variable
    treeListSmallBsf = treeListBsf[rightNodePosition];
    treeListBsf = [
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
