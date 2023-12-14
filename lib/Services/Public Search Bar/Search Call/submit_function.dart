import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../../constants.dart';
import '../../public_left_column.dart';
import '../../six_calculations.dart';
import '../main_search.dart';
import 'call_helper.dart';

onButtonPressed(WidgetRef ref) async {
  //Clear Tracking Panel, Result Panel and Chart
  clearGUI(ref);

  //Start the selected algorithm
  prepareProvidersForTracking(ref);
  ref.read(isAlgorithmEndProvider.notifier).state = false;
  List<Node>? solution = await startAlgorithm(ref);
  ref.read(isAlgorithmEndProvider.notifier).state = true;

  //Add the solution to the Result Panel
  if (solution != null) addResultPanelList(ref, solution);

  //Reset the inputs
  saveInputsForResults(ref, solution!.length, solution.last.cost);
  resetControllers();
}
