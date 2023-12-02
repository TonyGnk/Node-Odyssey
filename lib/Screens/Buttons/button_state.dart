import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

void buttonGo(WidgetRef ref, ScreenDestination goTo) {
  //Hide with Animations

  //Disable the Screen
  Future.delayed(basicDuration, () {
    callReturnOfScreen(ref, goTo);
  });
}

void buttonReturn(WidgetRef ref) {
  //Enable the Screen
  ref.read(currentScreenProvider.notifier).state =
      ScreenDestination.algorithmsGUI;

  //Set AppBarItems
  ref.read(appBarIsEnableBackButtonProvider.notifier).state = true;
  ref.read(appBarCurrentScreen.notifier).state =
      ScreenDestination.algorithmsGUI;
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.home;

  //Show with Animations
}
