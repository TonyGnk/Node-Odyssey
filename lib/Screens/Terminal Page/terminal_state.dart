import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';
import 'terminal_providers.dart';

final opacityTerminalState = StateProvider<double>((ref) => 1);

terminalGo(WidgetRef ref, ScreenDestination goTo) {
  updateAppBarItems(ref, false);

  //Change Screen
  Future.delayed(basicDuration, () {
    ref.read(currentScreenProvider.notifier).state = goTo;
  });
}

terminalReturn(WidgetRef ref) {
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.terminal;
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.home;

  //Set Functioning stuff
  myFocusNode.requestFocus();

  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  //Update Animations
  ref.read(opacityTerminalState.notifier).state = isReturn ? 1 : 0;

  //Update AppBarItems
  ref.read(appBarIsEnableBackButtonProvider.notifier).state =
      isReturn ? true : false;
  ref.read(appBarCustomIcon1.notifier).state = isReturn
      ? IconButton(
          onPressed: () {
            ref.read(terminalContentProvider.notifier).state = windowsText;
            myFocusNode.requestFocus();
          },
          icon: const Icon(Icons.restart_alt_outlined),
        )
      : null;
}

//EXTRA
animatedColumn(Widget child) => Consumer(builder: (context, ref, _) {
      final opacity = ref.watch(opacityTerminalState);
      return AnimatedOpacity(
        opacity: opacity,
        duration: basicDuration,
        child: child,
      );
    });
