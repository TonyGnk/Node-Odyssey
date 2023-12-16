import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_compare.dart';
import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/main_search.dart';
import '../../Services/constants.dart';
import '../../Services/public_left_column.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

final opacityButtonState = StateProvider<double>((ref) => 1);

void buttonGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  destination == ScreenDestination.home
      ? updateAppBarBackButton(ref, false)
      : updateAppBarBackButton(ref, true);

  goTo(ref, destination);
}

void buttonReturn(WidgetRef ref) {
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.buttons;
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.home;
  updateAppBarBackButton(ref, true);

  clearGUI(ref);
  clearSaved(ref);
  closeTheExtraOptions(ref);
  ref.read(stepModeProvider.notifier).state = false;
  resetControllers(ref);
  ref.read(runOnceProvider.notifier).state = false;
  updateAppBarItems(ref, true);
  resetCompareResults(ref);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(opacityButtonState.notifier).state = isReturn ? 1 : 0;
}

//EXTRA
animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacityButtonState),
        duration: basicDuration,
        child: child,
      ),
    );

resetCompareResults(WidgetRef ref) {
  ref.read(breadthSolution.notifier).state = CompareSolution();
  ref.read(depthSolution.notifier).state = CompareSolution();
  ref.read(bestSolution.notifier).state = CompareSolution();
  ref.read(aStarSolution.notifier).state = CompareSolution();
}
