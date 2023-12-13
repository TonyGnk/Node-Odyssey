// ignore_for_file: unused_import

import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Arc/Tree Widgets/providers_tree.dart';
import '../../Arc/Tree Widgets/tree_helpler.dart';
import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/Search Call/submit_function.dart';
import '../../Services/node.dart';
import '../../Services/six_calculations.dart';
import 'bst_algorithm.dart';
import 'async_bfs_2.dart';

//Provider for ListQueue<List<Node>> queue = ListQueue();
final queueProvider = StateProvider<ListQueue<List<Node>>>(
  (ref) => ListQueue(),
);
//Provider for Set<int> visited = {};
final visitedProvider = StateProvider<Set<int>>(
  (ref) => {},
);
//Provider treeList
final treeListProvider = StateProvider<List<List<int?>>>((ref) => [
      [null, null, null, null, null, null],
      [null, null, null, null, null, null],
      [null, null, null, null, null, null],
      [null, null, null, null, null, null],
      [null, null, null, null, null, null],
      [null, null, null, null, null, null],
    ]);

final treeListSmallProvider = StateProvider<List<int?>>(
  (ref) => [null, null, null, null, null, null],
);

//Provider for currentPath
final currentPathProvider = StateProvider<List<Node>>((ref) => []);

//Provider for current
final currentProvider = StateProvider<Node>((ref) => Node(0, 0, ''));

final isFoundProvider = StateProvider<bool>((ref) => false);

List<Node>? runBSFAsync(WidgetRef ref, RunningRequest request) {
  int start = request.startValue;
  int end = request.targetValue;
  Map<CalculationType, bool> enabledOperations = request.enabledOperations;

  ref.read(queueProvider.notifier).state = ListQueue();
  //ListQueue<List<Node>> queue = ListQueue();
  ref.read(visitedProvider.notifier).state = {};
  //Set<int> visited = {};
  clearLeafs(ref);

  ref.read(isFoundProvider.notifier).state = false;

  ref.read(queueProvider.notifier).state.add([Node(start, 0, 'Αρχική Τιμή')]);
  //queue.add([Node(start, 0, 'Αρχική Τιμή')]);
  ref.read(visitedProvider.notifier).state.add(start);
  //visited.add(start);

  ref.read(treeListProvider.notifier).state = [
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
  ];
  //List<List<int?>> treeList = initializeTreeList66();

  ref.read(treeListSmallProvider.notifier).state = [
    null,
    null,
    null,
    null,
    null,
    null
  ];
  //List<int?> treeListSmall = [null, null, null, null, null, null];

  for (CalculationType type in CalculationType.values) {
    if (enabledOperations[type]!) {
      int newValue = getNewValue(start, type);
      if (isAllowed(newValue, start, type)) {
        if (!ref.read(visitedProvider.notifier).state.contains(newValue)) {
          ref.read(treeListSmallProvider.notifier).state[getPosition(type)] =
              newValue;
        }
      }
    }
  }

  setKingLeafs(ref.read(treeListSmallProvider.notifier).state, ref);

  ref.read(currentPathProvider.notifier).state =
      ref.read(queueProvider.notifier).state.removeFirst();
  //List<Node> currentPath = ref.read(queueProvider.notifier).state.removeFirst();
  ref.read(currentProvider.notifier).state =
      ref.read(currentPathProvider.notifier).state.last;
  //Node current = currentPath.last;

  ref.read(throneProvider.notifier).state =
      ref.read(currentProvider.notifier).state.value;
  updateChartAndTrackingPanel(
      ref, ref.read(currentProvider.notifier).state, end);

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
      }
    }
  }

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

  return null;
}
