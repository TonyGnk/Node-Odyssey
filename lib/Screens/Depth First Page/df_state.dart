import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

void dfGo(WidgetRef ref, ScreenDestination goTo) {
  //Hide with Animations

  //Disable the Screen
  Future.delayed(basicDuration, () {
    callReturnOfScreen(ref, goTo);
  });
}

void dfReturn(WidgetRef ref) {
  //Enable the Screen
  ref.read(currentScreenProvider.notifier).state =
      ScreenDestination.breadthFirstAlg;

  //Set AppBarItems
  ref.read(appBarIsEnableBackButtonProvider.notifier).state = true;
  ref.read(appBarCurrentScreen.notifier).state =
      ScreenDestination.breadthFirstAlg;
  ref.read(appBarPreviousScreen.notifier).state =
      ScreenDestination.algorithmsGUI;
  ref.read(appBarLabel.notifier).state = 'Depth First Search';

  //Show with Animations
}
