import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

final opacityHomeState = StateProvider<double>((ref) => 1);

homeGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);

  goTo(ref, destination);
}

homeReturn(WidgetRef ref) {
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(opacityHomeState.notifier).state = isReturn ? 1 : 0;
  ref.read(appBarIsEnableBackButtonProvider.notifier).state = false;
}

//EXTRA
animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacityHomeState),
        duration: basicDuration,
        child: child,
      ),
    );
