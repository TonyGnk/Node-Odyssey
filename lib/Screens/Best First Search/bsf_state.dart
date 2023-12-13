import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/Public Search Bar/Search Call/call_helper.dart';
import '../../Services & Providers/constants.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

void bsfGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  goTo(ref, destination);
}

void bsfReturn(WidgetRef ref) {
  currentAlgorithm = AlgorithmType.bestf;

  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.bestFirstAlg;
  ref.read(appBarPreviousScreen.notifier).state =
      ScreenDestination.algorithmsGUI;

  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateAppBarLabel(ref, 'Best First Algorithm', isReturn);
  ref.read(appBarLabel.notifier).state = isReturn ? 'Best First Algorithm' : '';
}
