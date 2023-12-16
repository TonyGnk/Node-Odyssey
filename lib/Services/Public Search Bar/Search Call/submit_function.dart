import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../../constants.dart';
import '../../public_left_column.dart';
import '../../six_calculations.dart';
import '../main_search.dart';
import '../sliders_and_options_bf.dart';
import 'call_helper.dart';

onButtonPressed(WidgetRef ref) async {
  await Future.delayed(const Duration(milliseconds: 300));

  //Clear Tracking Panel, Result Panel and Chart
  clearGUI(ref);

  List<Node>? solution;

  //Start the selected algorithm
  prepareProvidersForTracking(ref);
  ref.read(isAlgorithmEndProvider.notifier).state = false;
  if (searchSpeed == 0) {
    solution = startAlgorithm(ref, RunningStyle.instant);
  } else {
    solution = await startSearchAsync(ref, RunningStyle.normal);
  }
  ref.read(isAlgorithmEndProvider.notifier).state = true;

  //

  //Add the solution to the Result Panel
  if (solution.isNotEmpty) {
    addResultPanelList(ref, solution);
    saveInputsForResults(ref, solution.length, solution.last.cost);
  } else {
    addResultPanelList(ref, [Node(0, 0, 'Time Out')]);
    saveInputsForResults(ref, 1, 0);
  }

  //Reset the inputs
  resetControllers(ref);
}
