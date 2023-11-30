import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Algorithms/Breadth First/algorithm_bf.dart';
import '../Algorithms/Depth First/algorithm_df.dart';
import 'node.dart';

const double cornerSize = 16;

enum AlgorithmType { bf, df, bestf, astar }

Future<List<Node>?> startAlgorithm(WidgetRef ref, AlgorithmType type) async {
  if (type == AlgorithmType.bf) {
    return runBFGui(ref);
  } else if (type == AlgorithmType.df) {
    return runDFGui(ref);
  } else if (type == AlgorithmType.bestf) {
    return runBFGui(ref);
  } else if (type == AlgorithmType.astar) {
    return runBFGui(ref);
  } else {
    return null;
  }
}
