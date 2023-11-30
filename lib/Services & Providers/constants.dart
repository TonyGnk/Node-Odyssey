import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Algorithms/Breadth First/start_calculation.dart';

const double cornerSize = 16;

enum AlgorithmType { bf, df, bestf, astar }

startAlgorithm(WidgetRef ref, AlgorithmType type) {
  if (type == AlgorithmType.bf) {
    startCalR(ref);
  }
}
