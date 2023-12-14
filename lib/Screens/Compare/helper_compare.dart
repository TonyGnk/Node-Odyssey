import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_compare.dart';
import '../../Services/constants.dart';
import '../../Services/public_left_column.dart';

compareItem(BuildContext context, AlgorithmType type) => templateContainer(
      context,
      SizedBox(
        child: colCompareItem(type),
      ),
    );

colCompareItem(AlgorithmType type) => Column(
      children: [
        Text(findName(type)),
        Expanded(child: itemContent(type)),
      ],
    );

itemContent(AlgorithmType type) =>
    Consumer(builder: (context, WidgetRef ref, __) {
      final isBreadthRuns = ref.watch(isBreadthCompareRuns);
      final isDepthRuns = ref.watch(isDepthCompareRuns);
      final isBestRuns = ref.watch(isBestCompareRuns);
      final isAStarRuns = ref.watch(isAStarCompareRuns);
      final bfSolution = ref.watch(breadthSolution);
      final dfSolution = ref.watch(depthSolution);
      final bsfSolution = ref.watch(bestSolution);
      final asSolution = ref.watch(aStarSolution);
      return youAreRunning(
        type,
        isBreadthRuns,
        isDepthRuns,
        isBestRuns,
        isAStarRuns,
      )
          ? progressIndicatorScreen(context)
          : watchYourSolution(
                    type,
                    bsfSolution,
                    dfSolution,
                    bfSolution,
                    asSolution,
                  ).count !=
                  ''
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      watchYourSolution(
                        type,
                        bsfSolution,
                        dfSolution,
                        bfSolution,
                        asSolution,
                      ).cost,
                    ),
                    Icon(
                      Icons.bolt_outlined,
                    ),
                  ],
                )
              : const SizedBox();
    });

youAreRunning(
  AlgorithmType type,
  bool isBreadthRuns,
  bool isDepthRuns,
  bool isBestRuns,
  bool isAStarRuns,
) {
  switch (type) {
    case AlgorithmType.breadth:
      return isBreadthRuns;
    case AlgorithmType.depth:
      return isDepthRuns;
    case AlgorithmType.best:
      return isBestRuns;
    case AlgorithmType.astar:
      return isAStarRuns;
  }
}

CompareSolution watchYourSolution(
  AlgorithmType type,
  CompareSolution bfSolution,
  CompareSolution dfSolution,
  CompareSolution bsfSolution,
  CompareSolution asSolution,
) {
  switch (type) {
    case AlgorithmType.breadth:
      return bfSolution;
    case AlgorithmType.depth:
      return dfSolution;
    case AlgorithmType.best:
      return bsfSolution;
    case AlgorithmType.astar:
      return asSolution;
  }
}

progressIndicatorScreen(BuildContext context) => const Center(
      child: CircularProgressIndicator(),
    );

findName(AlgorithmType type) {
  switch (type) {
    case AlgorithmType.breadth:
      return 'Breadth First Search';
    case AlgorithmType.depth:
      return 'Depth First Search';
    case AlgorithmType.best:
      return 'Best First Search';
    case AlgorithmType.astar:
      return 'A* Search';
  }
}
