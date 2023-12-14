// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Best First/bst_terminal.dart';
import '../../../Algorithms/Breadth First/bf_terminal.dart';
import '../../../Algorithms/Depth First/df_terminal.dart';
import '../../six_calculations.dart';
import 'call_helper.dart';

onButtonCompare(WidgetRef ref) async {
  //Clear Previous Compare
  clearGUICompare(ref);

  List<Node>? solution;

  //Compare the Breadth
  ref.read(isBreadthCompareRuns.notifier).state = true;
  await Future.delayed(const Duration(milliseconds: 400));
  solution = runBreadthTerminal();
  ref.read(isBreadthCompareRuns.notifier).state = false;
  if (solution != null) {
    ref.read(breadthSolution.notifier).state = CompareSolution(
        solution.last.cost.toString(), solution.length.toString());
    print(
        'Solution of Breadth: Cost:${solution.last.cost} Count:${solution.length}');
  }

  //Compare the Depth

  ref.read(isDepthCompareRuns.notifier).state = true;
  await Future.delayed(const Duration(milliseconds: 400));
  solution = runDepthTerminal();
  ref.read(isDepthCompareRuns.notifier).state = false;
  if (solution != null) {
    ref.read(depthSolution.notifier).state = CompareSolution(
        solution.last.cost.toString(), solution.length.toString());
    print(
        'Solution of Depth: Cost:${solution.last.cost} Count:${solution.length}');
  }

  //Compare the Best
  ref.read(isBestCompareRuns.notifier).state = true;
  await Future.delayed(const Duration(milliseconds: 400));
  solution = runBestTerminal();
  ref.read(isBestCompareRuns.notifier).state = false;
  if (solution != null) {
    ref.read(bestSolution.notifier).state = CompareSolution(
        solution.last.cost.toString(), solution.length.toString());
    print(
        'Solution of Best: Cost:${solution.last.cost} Count:${solution.length}');
  }
}

final isBreadthCompareRuns = StateProvider<bool>((ref) => false);
final isDepthCompareRuns = StateProvider<bool>((ref) => false);
final isBestCompareRuns = StateProvider<bool>((ref) => false);
final isAStarCompareRuns = StateProvider<bool>((ref) => false);

final breadthSolution = StateProvider<CompareSolution>(
  (ref) => CompareSolution(),
);

final depthSolution = StateProvider<CompareSolution>(
  (ref) => CompareSolution(),
);

final bestSolution = StateProvider<CompareSolution>(
  (ref) => CompareSolution(),
);

final aStarSolution = StateProvider<CompareSolution>(
  (ref) => CompareSolution(),
);

class CompareSolution {
  CompareSolution([this.cost = '', this.count = '']);
  final String cost;
  final String count;
}
