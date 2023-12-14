import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/constants.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

void bsfGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  goTo(ref, destination);
}

void bsfReturn(WidgetRef ref) {
  currentAlgorithm = AlgorithmType.best;

  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.bestFirstAlg;
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.buttons;

  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(leftOpacityProvider.notifier).state = isReturn ? 1 : 0;
  updateAppBarLabel(ref, 'Best First Algorithm', isReturn);
  ref.read(appBarLabel.notifier).state = isReturn ? 'Best First Algorithm' : '';
}

final leftOpacityProvider = StateProvider<double>((ref) => 1);
animatedLeftColumn(Widget child) => Consumer(builder: (context, ref, _) {
      final opacity = ref.watch(leftOpacityProvider);
      return AnimatedOpacity(
        opacity: opacity,
        duration: basicDuration,
        child: child,
      );
    });
