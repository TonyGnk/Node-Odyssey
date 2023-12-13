import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Algorithms/Astar/algorithm_astar.dart';
import '../Algorithms/Best First/algorithm_bsf.dart';
import '../Algorithms/Breadth First/bf_algorithm_step.dart';
import '../Algorithms/Breadth First/bf_algorithm_terminal.dart';
import '../Algorithms/Breadth First/bf_algorithm.dart';
import '../Algorithms/Depth First/algorithm_df.dart';
import '../Screens/Breadth First Page/Archive BF/list_provider.dart';
import 'Public Search Bar/Search Call/call_helper.dart';
import 'six_calculations.dart';

const double cornerSize = 16;

enum AlgorithmType { bf, df, bestf, astar }

List<Node>? startAlgorithmTerminal(
    WidgetRef ref, AlgorithmType type, RunningRequest request) {
  if (type == AlgorithmType.bf) {
    return runBreadthTerminal(request);
  } else if (type == AlgorithmType.df) {
    return runDFGuiTerminal(request);
  } else if (type == AlgorithmType.bestf) {
    return runBSFTerminal(request);
  } else {
    return null;
  }
}

Future<List<Node>?> startAlgorithm(
    WidgetRef ref, RunningRequest request) async {
  if (currentAlgorithm == AlgorithmType.bf) {
    return runBreadthTotal(ref);
  } else if (currentAlgorithm == AlgorithmType.df) {
    return runDFGui(ref, request);
  } else if (currentAlgorithm == AlgorithmType.bestf) {
    return runBSFGui(ref, request);
  } else if (currentAlgorithm == AlgorithmType.astar) {
    return runAStarGui(ref, request);
  } else {
    return null;
  }
}

List<Node>? startAlgorithmFirstStep(WidgetRef ref, RunningRequest request) {
  if (currentAlgorithm == AlgorithmType.bf) {
    return runBreadthFirstStep(ref);
  } else {
    return null;
  }
}

List<Node>? startAlgorithmStep(WidgetRef ref, RunningRequest request) {
  if (currentAlgorithm == AlgorithmType.bf) {
    return runBreadthStep(ref);
  } else {
    return null;
  }
}

List<Node>? startAlgorithmToEnd(WidgetRef ref, RunningRequest request) {
  if (currentAlgorithm == AlgorithmType.bf) {
    return runBreadthToEnd(ref);
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
