import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Screens/Breadth First Page/Chart BF/chart_bf.dart';
import '../../Public Tracking Area/public_tracking_stage.dart';
import '../../Tree Widgets/providers_tree.dart';
import '../../Tree Widgets/tree_helpler.dart';
import '../../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../../Public Tracking Area/public_result.dart';
import '../../constants.dart';
import '../../public_left_column.dart';
import '../../six_calculations.dart';
import '../../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../tracking_container.dart';
import '../closed_search.dart';
import '../main_search.dart';
import 'call_compare.dart';

AlgorithmType currentAlgorithm = AlgorithmType.breadth;

clearGUI(WidgetRef ref) {
  //Clear Chart
  ref.read(chartColumnsProvider.notifier).state.clear();
  //Clear Result Panel
  ref.read(resListProvider.notifier).state.clear();
  //Clear Tracking Panel
  ref.read(trackingProvider.notifier).state.clear();
  //Clear Tree
  ref.read(targetProvider.notifier).state = 0;
  ref.read(resultPanelList.notifier).state.clear();
  clearLeafs(ref);
  addTrackingContainerRolling(ref);
}

clearGUICompare(WidgetRef ref) {
  ref.read(breadthSolution.notifier).state = CompareSolution();
  ref.read(depthSolution.notifier).state = CompareSolution();
  ref.read(bestSolution.notifier).state = CompareSolution();
  ref.read(aStarSolution.notifier).state = CompareSolution();
}

updateGraphicalContent(WidgetRef ref, Node node, int end, int visited) {
  ref.read(targetProvider.notifier).state = end;
  ref.watch(trackingProvider).addTile(node.value, node.operation, ref);
  addTrackingContainer(ref, node.value);
  ref.read(throneProvider.notifier).state = node.value;
  ref.read(visitedLength.notifier).state = visited;
}

updateTracking(WidgetRef ref, RunningStyle style, [Node? current]) {
  if (current == null) ref.watch(trackingProvider).addTile(0, 'Time Out', ref);

  if (style != RunningStyle.terminal && current != null) {
    ref
        .read(trackingProvider.notifier)
        .state
        .addTile(current.value, current.operation, ref);
    addTrackingContainer(ref, current.value);
    // if (currentAlgorithm == AlgorithmType.astar) {
    //   starTree(ref, current);
    // }
  }
}

prepareProvidersForTracking(WidgetRef ref) {
  ref.read(runOnceProvider.notifier).state = true;
  ref.read(isOnTrackingProvider.notifier).state = false;
}

saveInputsForResults(WidgetRef ref, int count, int cost) {
  ref.read(savedInputProvider.notifier).state =
      '${inputController.text} 🡢 ${targetController.text}';
  ref.read(resultCountProvider.notifier).state = count;
  ref.read(resultCostProvider.notifier).state = cost;
}

clearSaved(WidgetRef ref) {
  ref.read(savedInputProvider.notifier).state = '';
  ref.read(resultCountProvider.notifier).state = 0;
  ref.read(resultCostProvider.notifier).state = 0;
}

closeTheExtraOptions(ref) {
  ref.read(makeContainerTallerProvider.notifier).state = false;
  ref.read(showTheExtraOptionsProvider.notifier).state = false;
}
