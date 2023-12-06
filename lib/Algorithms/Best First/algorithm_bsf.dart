// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable, prefer_expression_function_bodies

import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services & Providers/Public Search Bar/submit_function.dart';
import '../../Services & Providers/node.dart';
import '../../Services & Providers/six_calculations.dart';

class HeuristicResult {
  HeuristicResult(this.node, this.abs);
  late Node? node;
  late int abs;
}

Future<List<Node>?> runBSFGui(WidgetRef ref, RunningRequest request) async {
  int start = request.startValue;
  int end = request.targetValue;
  int speed = request.speed;
  Map<CalculationType, bool> enabledOperations = request.enabledOperations;

  ListQueue<List<Node>> queue = ListQueue();
  Set<int> visited = {};

  queue.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  while (queue.isNotEmpty) {
    await Future.delayed(Duration(seconds: speed));

    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    updateChartAndTrackingPanel(ref, current, end);

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

    //Call a function with given properties the list and target value
    HeuristicResult result = heuristic(calculationList, end);
    //Call a function with given properties the list and target value
    HeuristicResult resultSquare = heuristicSquare(calculationList, end);

    //Check which is smaller, the heuristic or heuristicSquare and do:
    if (result.abs < resultSquare.abs) {
      List<Node> newPath = List.from(currentPath)..add(result.node!);
      queue.add(newPath);
      visited.add(result.node!.value);
    } else {
      List<Node> newPath = List.from(currentPath)..add(resultSquare.node!);
      queue.add(newPath);
      visited.add(resultSquare.node!.value);
    }
  }

  return null;
}

HeuristicResult heuristic(List<Node> list, int target) {
  int min = 100000;
  int temp;
  Node? minNode;
  for (int i = 0; i < list.length; i++) {
    temp = (list[i].value - target).abs();
    if (temp < min) {
      min = temp;
      minNode = list[i];
    }
  }
  return HeuristicResult(minNode, min);
}

HeuristicResult heuristicSquare(List<Node> list, int target) {
  int min = 100000;
  int temp;
  Node? minNode;
  // Get the square of list[i].value and compare it with target
  for (int i = 0; i < list.length; i++) {
    temp = (list[i].value * list[i].value - target).abs();
    if (temp < min) {
      min = temp;
      minNode = list[i];
    }
  }
  return HeuristicResult(minNode, min);
}
