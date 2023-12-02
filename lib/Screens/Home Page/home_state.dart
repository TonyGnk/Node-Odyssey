import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

void homeGo(WidgetRef ref, ScreenDestination goTo) {
  //Hide with Animations
  ref.read(animatedOpacityProvider.notifier).state = 0;

  //Disable the Screen
  Future.delayed(basicDuration, () {
    screenReturn(ref, goTo);
  });
}

void homeReturn(WidgetRef ref) {
  //Enable the Screen
  ref.read(currentScreenProvider.notifier).state = ScreenDestination.home;

  //Set AppBarItems
  ref.read(appBarIsEnableBackButtonProvider.notifier).state = false;

  //Show with Animations
  ref.read(showBackButtonProvider.notifier).state = false;

  //For Glass Only
  Future.delayed(const Duration(milliseconds: 600), () {
    ref.read(hideSmoothProvider.notifier).state = false;
    ref.read(animatedOpacityProvider.notifier).state = 1;
  });
  Future.delayed(const Duration(milliseconds: 700), () {
    ref.read(durationProvider.notifier).state = const Duration(seconds: 5);
  });
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(animatedOpacityProvider),
        duration: basicDuration,
        child: child,
      ),
    );

final animatedOpacityProvider = StateProvider<double>((ref) => 1);
final showBackButtonProvider = StateProvider<bool>((ref) => false);

//To Remove
forGlassOnlyGo(WidgetRef ref) {
  ref.read(hideSmoothProvider.notifier).state = true;
  ref.read(durationProvider.notifier).state = const Duration(milliseconds: 100);
}
