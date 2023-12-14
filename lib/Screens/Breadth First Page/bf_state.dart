import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/constants.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../Best First Search/bsf_state.dart';
import '../screen_list.dart';

void bfGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  goTo(ref, destination);
}

void bfReturn(WidgetRef ref) {
  currentAlgorithm = AlgorithmType.breadth;
  ref.read(appBarCurrentScreen.notifier).state =
      ScreenDestination.breadthFirstAlg;
  ref.read(appBarPreviousScreen.notifier).state =
      ScreenDestination.algorithmsGUI;

  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(leftOpacityProvider.notifier).state = isReturn ? 1 : 0;
  updateAppBarLabel(ref, 'Breadth First Search', isReturn);
}
