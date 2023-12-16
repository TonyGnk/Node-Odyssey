// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Astar/astar_algorithm.dart';
import '../../../Algorithms/Best First/bst_algorithm.dart';
import '../../../Algorithms/Best First/bst_terminal.dart';
import '../../../Algorithms/Breadth First/bf_algorithm.dart';
import '../../../Algorithms/Breadth First/bf_terminal.dart';
import '../../../Algorithms/Depth First/df_algorithm.dart';
import '../../../Algorithms/Depth First/df_terminal.dart';
import '../../../Screens/Compare/helper_compare.dart';
import '../../six_calculations.dart';
import 'call_helper.dart';

onButtonCompare(WidgetRef ref) async {
  //Clear Previous Compare
  clearGUICompare(ref);

  List<Node>? solution;

  //Compare the Breadth
  if (ref.read(enableBreadthCompare.notifier).state) {
    ref.read(isBreadthCompareRuns.notifier).state = true;
    await Future.delayed(const Duration(milliseconds: 400));
    solution = runBreadth(ref, RunningStyle.terminal);
    ref.read(isBreadthCompareRuns.notifier).state = false;
    if (solution.isNotEmpty) {
      ref.read(breadthSolution.notifier).state = CompareSolution(
          solution.last.cost.toString(), solution.length.toString());
      print(
          'Solution of Breadth: Cost:${solution.last.cost} Count:${solution.length}');
    }
  }

  //Compare the Depth
  if (ref.read(enableDepthCompare.notifier).state) {
    ref.read(isDepthCompareRuns.notifier).state = true;
    await Future.delayed(const Duration(milliseconds: 400));
    solution = runDepth(ref, RunningStyle.terminal);
    ref.read(isDepthCompareRuns.notifier).state = false;
    if (solution.isNotEmpty) {
      ref.read(depthSolution.notifier).state = CompareSolution(
          solution.last.cost.toString(), solution.length.toString());
      print(
          'Solution of Depth: Cost:${solution.last.cost} Count:${solution.length}');
    }
  }

  //Compare the Best
  if (ref.read(enableBestCompare.notifier).state) {
    ref.read(isBestCompareRuns.notifier).state = true;
    await Future.delayed(const Duration(milliseconds: 400));
    solution = runBest(ref, RunningStyle.terminal);
    ref.read(isBestCompareRuns.notifier).state = false;
    if (solution.isNotEmpty) {
      ref.read(bestSolution.notifier).state = CompareSolution(
          solution.last.cost.toString(), solution.length.toString());
      print(
          'Solution of Best: Cost:${solution.last.cost} Count:${solution.length}');
    }
  }

  //Compare the Astar
  if (ref.read(enableAStarCompare.notifier).state) {
    ref.read(isAStarCompareRuns.notifier).state = true;
    await Future.delayed(const Duration(milliseconds: 400));
    solution = runStar(ref, RunningStyle.terminal);
    ref.read(isAStarCompareRuns.notifier).state = false;
    if (solution.isNotEmpty) {
      ref.read(aStarSolution.notifier).state = CompareSolution(
          solution.last.cost.toString(), solution.length.toString());
      print(
          'Solution of AStar: Cost:${solution.last.cost} Count:${solution.length}');
    }
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
