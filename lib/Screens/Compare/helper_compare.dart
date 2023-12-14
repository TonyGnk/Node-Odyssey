import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_compare.dart';
import '../../Services/constants.dart';
import '../../Services/public_left_column.dart';

compareItem(BuildContext context, AlgorithmType type) => templateContainer(
      context,
      SizedBox(
        width: 570,
        height: 60,
        child: colCompareItem(type),
      ),
    );

colCompareItem(AlgorithmType type) => Row(
      children: [
        const SizedBox(width: 10),
        compareText(findName(type)),
        const Expanded(child: SizedBox()),
        SizedBox(
          width: 200,
          child: itemContent(type),
        ),
        const SizedBox(width: 10),
        returnCorrectSwitch(type),
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
      String count = watchYourSolution(
        type,
        bfSolution,
        dfSolution,
        bsfSolution,
        asSolution,
      ).count;
      String cost = watchYourSolution(
        type,
        bfSolution,
        dfSolution,
        bsfSolution,
        asSolution,
      ).cost;
      return Container(
        height: 44,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(cornerSize - 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: youAreRunning(
          type,
          isBreadthRuns,
          isDepthRuns,
          isBestRuns,
          isAStarRuns,
        )
            ? progressIndicatorScreen(context)
            : count != ''
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      compareText(count),
                      const Icon(
                        Icons.bar_chart_outlined,
                        size: 34,
                      ),
                      const SizedBox(width: 20),
                      compareText(cost),
                      const Icon(
                        Icons.bolt_outlined,
                        color: Colors.orange,
                        size: 34,
                      ),
                    ],
                  )
                : const SizedBox(),
      );
    });

compareText(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontFamily: 'Play',
      ),
    );

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

final enableBreadthCompare = StateProvider<bool>((ref) => true);
final enableDepthCompare = StateProvider<bool>((ref) => true);
final enableBestCompare = StateProvider<bool>((ref) => true);
final enableAStarCompare = StateProvider<bool>((ref) => true);

returnCorrectSwitch(AlgorithmType type) {
  switch (type) {
    case AlgorithmType.breadth:
      return breadthCompare;
    case AlgorithmType.depth:
      return depthCompare;
    case AlgorithmType.best:
      return bestCompare;
    case AlgorithmType.astar:
      return aStarCompare;
  }
}

//Breadth
final breadthCompare = Consumer(
  builder: (context, ref, _) {
    final enableBreadth = ref.watch(enableBreadthCompare);
    return Switch(
      value: enableBreadth,
      onChanged: (newValue) {
        ref.read(enableBreadthCompare.notifier).state = newValue;
      },
    );
  },
);

//Depth
final depthCompare = Consumer(
  builder: (context, ref, _) {
    final enableDepth = ref.watch(enableDepthCompare);
    return Switch(
      value: enableDepth,
      onChanged: (newValue) {
        ref.read(enableDepthCompare.notifier).state = newValue;
      },
    );
  },
);

//Best
final bestCompare = Consumer(
  builder: (context, ref, _) {
    final enableBest = ref.watch(enableBestCompare);
    return Switch(
      value: enableBest,
      onChanged: (newValue) {
        ref.read(enableBestCompare.notifier).state = newValue;
      },
    );
  },
);

//A*
final aStarCompare = Consumer(
  builder: (context, ref, _) {
    final enableAStar = ref.watch(enableAStarCompare);
    return Switch(
      value: enableAStar,
      onChanged: (newValue) {
        ref.read(enableAStarCompare.notifier).state = newValue;
      },
    );
  },
);
