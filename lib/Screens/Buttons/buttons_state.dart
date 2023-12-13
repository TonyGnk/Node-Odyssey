import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/Public Search Bar/Search Call/submit_function.dart';
import '../../Services & Providers/constants.dart';
import '../../Services & Providers/public_left_column.dart';
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
  ref.read(appBarCurrentScreen.notifier).state =
      ScreenDestination.algorithmsGUI;
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.home;
  updateAppBarBackButton(ref, true);

  clearGUI(ref);
  clearSaved(ref);
  ref.read(runOnceProvider.notifier).state = false;
  updateAppBarItems(ref, true);
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
