import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Breadth First/bf_step.dart';
import '../../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../../constants.dart';
import '../../public_left_column.dart';
import '../../six_calculations.dart';
import '../../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../check_box_search.dart';
import '../closed_search.dart';
import '../main_search.dart';
import 'call_helper.dart';

onButtonPressedFirst(WidgetRef ref) {
  //Clear Tracking Panel, Result Panel and Chart
  clearGUI(ref);

  ref.read(stepModeProvider.notifier).state = true;

  RunningRequest request = saveRequest(ref); //To delete
  //TODO: Να διαγραφεί η παραπάνω γραμμή

  //Start the selected algorithm
  prepareProvidersForTracking(ref);

  //Initialize the algorithm
  queueBf = ListQueue();
  visitedBf = {};

  closeTheExtraOptions(ref);

  ref.read(isAlgorithmEndProvider.notifier).state = false;
  List<Node>? solution = startAlgorithmFirstStep(ref, request);

  //Add the solution to the Result Panel
  if (solution != null) {
    ref.read(isAlgorithmEndProvider.notifier).state = true;
    ref.read(stepModeProvider.notifier).state = false;
    addResultPanelList(ref, solution);
    saveInputsForResults(ref, solution.length, solution.last.cost);
    resetControllers();
  }
}

onButtonPressedStep(WidgetRef ref, bool toEnd) {
  RunningRequest request = saveRequest(ref); //To delete

  List<Node>? solution;
  solution = toEnd
      ? startAlgorithmToEnd(ref, request)
      : startAlgorithmStep(ref, request);

  //Add the solution to the Result Panel
  if (solution != null) {
    ref.read(isAlgorithmEndProvider.notifier).state = true;
    ref.read(stepModeProvider.notifier).state = false;
    addResultPanelList(ref, solution);
    closeTheExtraOptions(ref);
    saveInputsForResults(ref, solution.length, solution.last.cost);
    resetControllers();
  }
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

cancelStep(WidgetRef ref) {
  clearGUI(ref);

  ref.read(stepModeProvider.notifier).state = false;

  ref.read(runOnceProvider.notifier).state = false;

  ref.read(makeContainerTallerProvider.notifier).state = true;
  ref.read(showTheExtraOptionsProvider.notifier).state = true;

  ref.read(isAlgorithmEndProvider.notifier).state = true;
}
