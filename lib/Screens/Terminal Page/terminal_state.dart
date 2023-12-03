import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../Home Page/home_state.dart';
import '../screen_list.dart';
import 'terminal_helper.dart';

void terminalGo(WidgetRef ref, ScreenDestination goTo) {
  //Hide with Animations
  ref.read(opacityTerminalState.notifier).state = 1;

  //Disable the Screen
  Future.delayed(basicDuration, () {
    callReturnOfScreen(ref, goTo);
  });
}

void terminalReturn(WidgetRef ref) {
  //Enable the Screen
  ref.read(currentScreenProvider.notifier).state = ScreenDestination.terminal;

  //Set AppBarItems
  ref.read(appBarIsEnableBackButtonProvider.notifier).state = true;
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.terminal;
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.home;

  //Set Functioning stuff
  myFocusNode.requestFocus();
  Future.delayed(basicDuration, () {});

  //Show with Animations

  Future.delayed(basicDuration5, () {
    ref.read(opacityTerminalState.notifier).state = 1;
  });
}

class animatedColumn extends ConsumerWidget {
  const animatedColumn(this.child, {super.key});

  final Column child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opacity = ref.watch(opacityTerminalState);
    return AnimatedOpacity(
      opacity: opacity,
      duration: basicDuration,
      child: child,
    );
  }
}

final opacityTerminalState = StateProvider<double>((ref) => 1);


// animatedColumn(Widget child) => Consumer(builder: (context, ref, _) {
//       final opacity = ref.watch(opacityTerminalState);
//       return AnimatedOpacity(
//         opacity: opacity,
//         duration: basicDuration,
//         child: child,
//       );
//     });
