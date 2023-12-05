import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../screen_list.dart';

final opacityHomeState = StateProvider<double>((ref) => 1);

homeGo(WidgetRef ref, ScreenDestination goTo) {
  updateAppBarItems(ref, false);

  //Change Screen
  Future.delayed(basicDuration, () {
    ref.read(currentScreenProvider.notifier).state = goTo;
  });
}

homeReturn(WidgetRef ref) {
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(opacityHomeState.notifier).state = isReturn ? 1 : 0;
}

//EXTRA
animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacityHomeState),
        duration: basicDuration,
        child: child,
      ),
    );
