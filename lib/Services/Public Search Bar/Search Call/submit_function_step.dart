import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Breadth First/bf_step.dart';
import '../../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../../constants.dart';
import '../../public_left_column.dart';
import '../../six_calculations.dart';
import '../closed_search.dart';
import '../main_search.dart';
import 'call_helper.dart';

onButtonPressedFirst(WidgetRef ref) {
  //Clear Tracking Panel, Result Panel and Chart
  clearGUI(ref);

  ref.read(stepModeProvider.notifier).state = true;

  //Start the selected algorithm
  prepareProvidersForTracking(ref);

  //Initialize the algorithm
  queueBf = ListQueue();
  visitedBf = {};

  closeTheExtraOptions(ref);

  ref.read(isAlgorithmEndProvider.notifier).state = false;
  List<Node>? solution = startAlgorithmFirstStep(ref);

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
  List<Node>? solution;
  solution = toEnd ? startAlgorithmToEnd(ref) : startAlgorithmStep(ref);

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

cancelStep(WidgetRef ref) {
  clearGUI(ref);

  ref.read(stepModeProvider.notifier).state = false;

  ref.read(runOnceProvider.notifier).state = false;

  ref.read(makeContainerTallerProvider.notifier).state = true;
  ref.read(showTheExtraOptionsProvider.notifier).state = true;

  ref.read(isAlgorithmEndProvider.notifier).state = true;
}
