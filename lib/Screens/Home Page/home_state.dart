import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

void homeGo(WidgetRef ref, ScreenDestination goTo) {
  //Hide with Animations
  ref.read(opacityHomeState.notifier).state = 0;

  //Disable the Screen
  Future.delayed(basicDuration, () {
    callReturnOfScreen(ref, goTo);
  });
}

void homeReturn(WidgetRef ref) {
  //Enable the Screen
  ref.read(currentScreenProvider.notifier).state = ScreenDestination.home;

  //Set AppBarItems
  ref.read(appBarIsEnableBackButtonProvider.notifier).state = false;

  //Show with Animations

  //For Glass Only
  Future.delayed(basicDuration, () {
    ref.read(hideSmoothProvider.notifier).state = false;
    ref.read(opacityHomeState.notifier).state = 1;
  });
  Future.delayed(const Duration(milliseconds: 700), () {
    ref.read(durationProvider.notifier).state = const Duration(seconds: 5);
  });
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacityHomeState),
        duration: basicDuration,
        child: child,
      ),
    );

final opacityHomeState = StateProvider<double>((ref) => 1);

//To Remove
forGlassOnlyGo(WidgetRef ref) {
  ref.read(hideSmoothProvider.notifier).state = true;
  ref.read(durationProvider.notifier).state = const Duration(milliseconds: 100);
}
