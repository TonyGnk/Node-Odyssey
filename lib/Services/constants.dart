import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Algorithms/Astar/algorithm_astar.dart';
import '../Algorithms/Astar/star_terminal.dart';
import '../Algorithms/Best First/async_bfs.dart';
import '../Algorithms/Best First/async_bfs_2.dart';
import '../Algorithms/Best First/bst_algorithm.dart';
import '../Algorithms/Best First/bst_terminal.dart';
import '../Algorithms/Breadth First/bf_step.dart';
import '../Algorithms/Breadth First/bf_terminal.dart';
import '../Algorithms/Breadth First/bf_algorithm.dart';
import '../Algorithms/Depth First/df_algorithm.dart';
import '../Algorithms/Depth First/df_step.dart';
import '../Algorithms/Depth First/df_terminal.dart';
import 'Public Search Bar/Search Call/call_helper.dart';
import 'six_calculations.dart';

const double cornerSize = 16;

enum AlgorithmType { breadth, depth, best, astar }

List<Node>? startAlgorithmTerminal(AlgorithmType type) {
  if (type == AlgorithmType.breadth) {
    return runBreadthTerminal();
  } else if (type == AlgorithmType.depth) {
    return runDepthTerminal();
  } else if (type == AlgorithmType.best) {
    return runBestTerminal();
  } else if (type == AlgorithmType.astar) {
    return runAStarTerminal();
  } else {
    return null;
  }
}

Future<List<Node>?> startAlgorithm(WidgetRef ref) async {
  if (currentAlgorithm == AlgorithmType.breadth) {
    return runBreadth(ref);
  } else if (currentAlgorithm == AlgorithmType.depth) {
    return runDepth(ref);
  } else if (currentAlgorithm == AlgorithmType.best) {
    return runBest(ref);
  } else if (currentAlgorithm == AlgorithmType.astar) {
    return runAStarGui(ref);
  } else {
    return null;
  }
}

List<Node>? startAlgorithmFirstStep(WidgetRef ref) {
  if (currentAlgorithm == AlgorithmType.breadth) {
    return runBreadthFirstStep(ref);
  } else if (currentAlgorithm == AlgorithmType.depth) {
    return runDepthFirstStep(ref);
  } else if (currentAlgorithm == AlgorithmType.best) {
    return runBSFAsync(ref);
  } else {
    return null;
  }
}

List<Node>? startAlgorithmStep(WidgetRef ref) {
  if (currentAlgorithm == AlgorithmType.breadth) {
    return runBreadthStep(ref);
  } else if (currentAlgorithm == AlgorithmType.depth) {
    return runDepthStep(ref);
  } else if (currentAlgorithm == AlgorithmType.best) {
    return runBSFAsyncStep(ref);
  } else {
    return null;
  }
}

List<Node>? startAlgorithmToEnd(WidgetRef ref) {
  if (currentAlgorithm == AlgorithmType.breadth) {
    return runBreadthToEnd(ref);
  } else if (currentAlgorithm == AlgorithmType.depth) {
    return runDepthToEnd(ref);
  } else {
    return null;
  }
}

const Duration basicDuration = Duration(milliseconds: 200);
Duration basicDuration1 = Duration(
  milliseconds: basicDuration.inMilliseconds + 100,
);
Duration basicDuration2 = Duration(
  milliseconds: basicDuration.inMilliseconds + 200,
);
Duration basicDuration3 = Duration(
  milliseconds: basicDuration.inMilliseconds + 300,
);
Duration basicDuration4 = Duration(
  milliseconds: basicDuration.inMilliseconds + 400,
);
Duration basicDuration5 = Duration(
  milliseconds: basicDuration.inMilliseconds + 500,
);

centerAppBarText(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 27,
        fontFamily: 'Play',
      ),
    );
