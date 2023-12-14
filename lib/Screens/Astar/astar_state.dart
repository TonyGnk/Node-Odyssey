import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/constants.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../Best First Search/bsf_state.dart';
import '../screen_list.dart';

void asfGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  goTo(ref, destination);
}

void asfReturn(WidgetRef ref) {
  currentAlgorithm = AlgorithmType.astar;

  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.aStarAlg;
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.buttons;

  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(leftOpacityProvider.notifier).state = isReturn ? 1 : 0;
  updateAppBarLabel(ref, 'A*', isReturn);
}
