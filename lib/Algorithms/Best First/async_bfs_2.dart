import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Arc/Tree Widgets/providers_tree.dart';
import '../../Arc/Tree Widgets/tree_helpler.dart';
import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services & Providers/Public Search Bar/submit_function.dart';
import '../../Services & Providers/node.dart';
import '../../Services & Providers/six_calculations.dart';
import 'algorithm_bsf.dart';
import 'async_bfs.dart';

List<Node>? runBSFAsyncStep(WidgetRef ref, RunningRequest request) {
  int end = request.targetValue;
  Map<CalculationType, bool> enabledOperations = request.enabledOperations;

  Map map = findSmallest(ref.read(treeListProvider.notifier).state,
      ref.read(treeListSmallProvider.notifier).state, end);
  int rightNodePosition = map['minListIndex'];
  int rightNodeValue =
      ref.read(treeListSmallProvider.notifier).state[map['minListIndex']] ?? 0;

  Node rightNode = getNewNode(
    ref.read(currentProvider.notifier).state.value,
    ref.read(currentProvider.notifier).state.cost,
    rightNodeValue,
    positionToType(rightNodePosition),
  );
  List<Node> newPath = List.from(ref.read(currentPathProvider.notifier).state)
    ..add(rightNode);
  ref.read(queueProvider.notifier).state.add(newPath);
  ref.read(visitedProvider.notifier).state.add(rightNode.value);

  ref.read(treeListSmallProvider.notifier).state =
      ref.read(treeListProvider.notifier).state[rightNodePosition];
  ref.read(treeListProvider.notifier).state = [
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
  ];

  //
  ref.read(currentPathProvider.notifier).state =
      ref.read(queueProvider.notifier).state.removeFirst();
  ref.read(currentProvider.notifier).state =
      ref.read(currentPathProvider.notifier).state.last;

  ref.read(throneProvider.notifier).state =
      ref.read(currentProvider.notifier).state.value;
  updateChartAndTrackingPanel(
      ref, ref.read(currentProvider.notifier).state, end);
  //setKingLeafs(ref.read(treeListSmallProvider.notifier).state, ref);

  //
  print(ref.read(currentProvider.notifier).state.value == end);
  if (ref.read(currentProvider.notifier).state.value == end) {
    return ref.read(currentPathProvider.notifier).state;
  }

  for (int i = 0;
      i < ref.read(treeListSmallProvider.notifier).state.length;
      i++) {
    if (ref.read(treeListSmallProvider.notifier).state[i] != null) {
      if (ref.read(treeListSmallProvider.notifier).state[i] == end) {
        Node rightNode = getNewNode(
          ref.read(currentProvider.notifier).state.value,
          ref.read(currentProvider.notifier).state.cost,
          ref.read(treeListSmallProvider.notifier).state[i] ?? 0,
          positionToType(i),
        );
        List<Node> newPath =
            List.from(ref.read(currentPathProvider.notifier).state)
              ..add(rightNode);
        ref.read(queueProvider.notifier).state.add(newPath);
        ref.read(isFoundProvider.notifier).state = true;
      }
    }
  }
  if (ref.read(isFoundProvider.notifier).state) return null;

  //

  for (int i = 0;
      i < ref.read(treeListSmallProvider.notifier).state.length;
      i++) {
    if (ref.read(treeListSmallProvider.notifier).state[i] == null) {
      ref.read(treeListProvider.notifier).state[i] = [
        null,
        null,
        null,
        null,
        null,
        null
      ];
    } else {
      List<int?> temp = [null, null, null, null, null, null];
      for (CalculationType type in CalculationType.values) {
        if (enabledOperations[type]!) {
          int newValue = getNewValue(
              ref.read(treeListSmallProvider.notifier).state[i], type);
          if (isAllowed(newValue,
              ref.read(treeListSmallProvider.notifier).state[i], type)) {
            if (!ref.read(visitedProvider.notifier).state.contains(newValue)) {
              temp[getPosition(type)] = newValue;
            }
          }
        }
      }
      ref.read(treeListProvider.notifier).state[i] = temp;
    }
  }
  setLeafs(ref.read(treeListProvider.notifier).state, ref);

  //
  return null;
}
