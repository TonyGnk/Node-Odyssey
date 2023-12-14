import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/constants.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';
import 'terminal_providers.dart';

final opacityTerminalState = StateProvider<double>((ref) => 1);

terminalGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  destination == ScreenDestination.home
      ? updateAppBarBackButton(ref, false)
      : updateAppBarBackButton(ref, true);

  goTo(ref, destination);
}

terminalReturn(WidgetRef ref) {
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.terminal;
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.home;
  updateAppBarBackButton(ref, true);

  //Set Functioning stuff
  myFocusNode.requestFocus();

  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(opacityTerminalState.notifier).state = isReturn ? 1 : 0;
  updateAppBarCustomIcon1(ref, restartTerminalButton(ref), isReturn);
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

restartTerminalButton(WidgetRef ref) =>
    appBarIcon(const Icon(Icons.restart_alt_outlined), () {
      ref.read(terminalContentProvider.notifier).state = windowsText;
      myFocusNode.requestFocus();
    }, 'Reset Terminal');
