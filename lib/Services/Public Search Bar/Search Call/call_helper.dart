import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  ref.read(trackingListProvider.notifier).state.clear();
  //Clear Tree
  clearLeafs(ref);
}

clearGUICompare(WidgetRef ref) {
  ref.read(breadthSolution.notifier).state = CompareSolution();
  ref.read(depthSolution.notifier).state = CompareSolution();
  ref.read(bestSolution.notifier).state = CompareSolution();
  ref.read(aStarSolution.notifier).state = CompareSolution();
}

updateChartAndTrackingPanel(WidgetRef ref, Node node, int end) {
  ref.watch(trackingListProvider).addTile(node.value, node.operation, ref);
  addTrackingContainer(ref, node.value, end);
  ref.read(throneProvider.notifier).state = node.value;
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