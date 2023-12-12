import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../constants.dart';
import '../public_left_column.dart';
import '../six_calculations.dart';
import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../tracking_container.dart';
import 'closed_search.dart';
import 'main_search_bf.dart';
import 'sliders_and_options_bf.dart';

onButtonPressed(WidgetRef ref, AlgorithmType type) async {
  //Clear Tracking Panel, Result Panel and Chart
  clearGUI(ref);

  //Collect all the data from the UI
  //ref.watch(runningRequestProvider.notifier).state = saveRequest(ref);
  RunningRequest request = saveRequest(ref);

  //Start the selected algorithm
  ref.read(runOnceProvider.notifier).state = true;
  ref.read(isOnTrackingProvider.notifier).state = false;
  ref.read(isAlgorithmEndProvider.notifier).state = false; //Started
  List<Node>? solution = await startAlgorithm(ref, type, request);
  ref.read(isAlgorithmEndProvider.notifier).state = true; //Finished

  //Add the solution to the Result Panel
  if (solution != null) {
    addResultPanelList(ref, solution);
  }

  //Reset the inputs
  resetControllers();
}

saveRequest(WidgetRef ref) => RunningRequest(
      startValue: int.parse(inputController.text),
      targetValue: int.parse(targetController.text),
      speed: setSpeedFromSlider(ref.watch(speedSliderProviderBf)),
      enabledOperations: {
        CalculationType.addition: ref.watch(checkPlusOneProvider),
        CalculationType.subtraction: ref.watch(checkMinusOneProvider),
        CalculationType.multiplication: ref.watch(checkDoubleProvider),
        CalculationType.division: ref.watch(checkHalfProvider),
        CalculationType.exponential: ref.watch(checkRootProvider),
        CalculationType.square: ref.watch(checkSquareProvider),
      },
    );

clearGUI(WidgetRef ref) {
  //Clear Chart
  ref.read(chartColumnsProvider.notifier).state.clear();
  //Clear Result Panel
  ref.read(resListProvider.notifier).state.clear();
  //Clear Tracking Panel
  ref.read(trackingListProvider.notifier).state.clear();
}

updateChartAndTrackingPanel(WidgetRef ref, Node node, int end) {
  ref.watch(trackingListProvider).addTile(node.value, node.operation, ref);
  addTrackingContainer(ref, node.value, end);
}
