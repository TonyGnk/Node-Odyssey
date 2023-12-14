import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../../constants.dart';
import '../../public_left_column.dart';
import '../../six_calculations.dart';
import '../../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../check_box_search.dart';
import '../closed_search.dart';
import '../main_search.dart';
import 'call_helper.dart';

onButtonCompare(WidgetRef ref) async {
  //Clear Tracking Panel, Result Panel and Chart
  clearGUI(ref);

  //Collect all the data from the UI
  //ref.watch(runningRequestProvider.notifier).state = saveRequest(ref);
  RunningRequest request = saveRequest(ref);

  //Start the selected algorithm
  prepareProvidersForTracking(ref);
  ref.read(isAlgorithmEndProvider.notifier).state = false;
  List<Node>? solution = await startAlgorithm(ref, request);
  ref.read(isAlgorithmEndProvider.notifier).state = true;

  //Add the solution to the Result Panel
  if (solution != null) addResultPanelList(ref, solution);

  //Reset the inputs
  saveInputsForResults(ref, solution!.length, solution.last.cost);
  resetControllers();
}

saveRequest(WidgetRef ref) => RunningRequest(
      //
      startValue: int.parse(inputController.text),
      targetValue: int.parse(targetController.text),
      speed: 2,
      enabledOperations: {
        CalculationType.addition: ref.watch(checkPlusOneProvider),
        CalculationType.subtraction: ref.watch(checkMinusOneProvider),
        CalculationType.multiplication: ref.watch(checkDoubleProvider),
        CalculationType.division: ref.watch(checkHalfProvider),
        CalculationType.exponential: ref.watch(checkRootProvider),
        CalculationType.square: ref.watch(checkSquareProvider),
      },
    );
