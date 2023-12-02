import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../Home Page/home_state.dart';
import '../screen_list.dart';

void terminalGo(WidgetRef ref, ScreenDestination goTo) {
  //Hide with Animations

  //Disable the Screen
  Future.delayed(basicDuration, () {
    screenReturn(ref, goTo);
  });
}

void terminalReturn(WidgetRef ref) {
  //Enable the Screen
  ref.read(currentScreenProvider.notifier).state = ScreenDestination.terminal;

  //Set AppBarItems
  ref.read(appBarIsEnableBackButtonProvider.notifier).state = true;
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.terminal;
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.home;

  //Show with Animations
  ref.read(showBackButtonProvider.notifier).state = true;
  Future.delayed(const Duration(milliseconds: 600), () {});
}
