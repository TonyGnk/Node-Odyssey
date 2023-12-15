import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Algorithms/Astar/astar_algorithm.dart';
import '../Algorithms/Astar/astar_steps.dart';
import '../Algorithms/Best First/bst_instant.dart';
import '../Algorithms/Best First/bst_step.dart';
import '../Algorithms/Best First/bst_step_helper.dart';
import '../Algorithms/Best First/bst_algorithm.dart';
import '../Algorithms/Best First/bst_terminal.dart';
import '../Algorithms/Best First/bst_to_end.dart';
import '../Algorithms/Breadth First/bf_instant.dart';
import '../Algorithms/Breadth First/bf_step.dart';
import '../Algorithms/Breadth First/bf_terminal.dart';
import '../Algorithms/Breadth First/bf_algorithm.dart';
import '../Algorithms/Depth First/df_algorithm.dart';
import '../Algorithms/Depth First/df_instant.dart';
import '../Algorithms/Depth First/df_step.dart';
import '../Algorithms/Depth First/df_terminal.dart';
import 'Public Search Bar/Search Call/call_helper.dart';
import 'six_calculations.dart';

const double cornerSize = 16;

enum AlgorithmType { breadth, depth, best, astar }

List<Node>? startAlgorithmTerminal(WidgetRef ref) {
  if (currentAlgorithm == AlgorithmType.breadth) {
    return runBreadthTerminal();
  } else if (currentAlgorithm == AlgorithmType.depth) {
    return runDepthTerminal();
  } else if (currentAlgorithm == AlgorithmType.best) {
    return runBestTerminal();
  } else if (currentAlgorithm == AlgorithmType.astar) {
    return runStar(ref, RunningStyle.terminal);
  } else {
    return null;
  }
}

List<Node>? startAlgorithmInstant(WidgetRef ref) {
  if (currentAlgorithm == AlgorithmType.breadth) {
    return runBreadthInstant(ref);
  } else if (currentAlgorithm == AlgorithmType.depth) {
    return runDepthInstant(ref);
  } else if (currentAlgorithm == AlgorithmType.best) {
    return runBestInstant(ref);
  } else if (currentAlgorithm == AlgorithmType.astar) {
    return runStar(ref, RunningStyle.instant);
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
    return runStarAsync(ref, RunningStyle.normal);
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
    return runBestFirstStep(ref);
  } else if (currentAlgorithm == AlgorithmType.astar) {
    return runStarFirstStep(ref, RunningStyle.step);
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
    return runBestStep(ref);
  } else if (currentAlgorithm == AlgorithmType.astar) {
    return runStarStep(ref, RunningStyle.step);
  } else {
    return null;
  }
}

List<Node>? startAlgorithmToEnd(WidgetRef ref) {
  if (currentAlgorithm == AlgorithmType.breadth) {
    return runBreadthToEnd(ref);
  } else if (currentAlgorithm == AlgorithmType.depth) {
    return runDepthToEnd(ref);
  } else if (currentAlgorithm == AlgorithmType.best) {
    return runBestToEnd(ref);
  } else if (currentAlgorithm == AlgorithmType.astar) {
    return runStarToEnd(ref, RunningStyle.step);
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
