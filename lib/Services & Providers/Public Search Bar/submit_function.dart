import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Algorithms/Breadth First/providers_bf.dart';
import '../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../constants.dart';
import '../six_calculations.dart';
import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../tracking_container.dart';
import 'closed_search.dart';
import 'main_search_bf.dart';
import 'sliders_and_options_bf.dart';

onButtonPressed(WidgetRef ref, AlgorithmType type) {
  //Clear Tracking Panel, Result Panel and Chart
  clearGUI(ref);
  ref.read(isAlgorithmEndProviderBf.notifier).state = false;

  //Collect all the data from the UI
  ref.watch(bfRunningProvider.notifier).state = running(ref);

  //Start the selected algorithm
  startAlgorithm(ref, type);

  ref.watch(isCreatingProvider.notifier).state = false;
  ref.watch(bfRunningProviderUpdater.notifier).state =
      !ref.watch(bfRunningProviderUpdater);

  resetControllers();
}

running(WidgetRef ref) => BfRunning(
      startValue: int.parse(inputControllerBf.text),
      targetValue: int.parse(targetControllerBf.text),
      speed: setSpeedFromSlider(ref.watch(speedSliderProviderBf)),
      enableCalculationMap: {
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
