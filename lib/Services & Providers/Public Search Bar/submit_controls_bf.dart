import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Algorithms/Breadth First/providers_bf.dart';
import '../../Algorithms/Breadth First/start_calculation.dart';
import '../six_calculations.dart';
import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import 'closed_search.dart';
import 'main_search_bf.dart';
import 'sliders_and_options_bf.dart';

void onButtonPressed(WidgetRef ref) {
  clearTrackingBox(ref);
  ref.read(isAlgorithmEndProviderBf.notifier).state = false;
  final speedSlider = ref.watch(speedSliderProviderBf);

  ref.watch(bfRunningProvider.notifier).state = BfRunning(
    startValue: int.parse(inputControllerBf.text),
    targetValue: int.parse(targetControllerBf.text),
    speed: setSpeedFromSlider(speedSlider),
    enableCalculationMap: {
      CalculationType.addition: ref.watch(checkPlusOneProvider),
      CalculationType.subtraction: ref.watch(checkMinusOneProvider),
      CalculationType.multiplication: ref.watch(checkDoubleProvider),
      CalculationType.division: ref.watch(checkHalfProvider),
      CalculationType.exponential: ref.watch(checkRootProvider),
      CalculationType.square: ref.watch(checkSquareProvider),
    },
  );
  startCalR(ref);
  ref.watch(isCreatingProvider.notifier).state = false;
  ref.watch(bfRunningProviderUpdater.notifier).state =
      !ref.watch(bfRunningProviderUpdater);

  //Reset the Input Fields
  inputControllerBf.clear();
  targetControllerBf.clear();
}
