import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../screen_list.dart';

void homeGo(WidgetRef ref, ScreenDestination goTo) {
  ref.read(opacityProvider.notifier).state = 0;
  Future.delayed(const Duration(milliseconds: 600), () {
    ref.read(isTerminalProvider.notifier).state = true;
    ref.read(showBackButtonProvider.notifier).state = true;

    //Terminal Back
    ref.read(currentScreenProvider.notifier).state = goTo;
  });
}

void homeReturn(WidgetRef ref) {
  ref.read(currentScreenProvider.notifier).state = ScreenDestination.home;

  ref.read(isTerminalProvider.notifier).state = false;
  ref.read(showBackButtonProvider.notifier).state = false;

  //delay 200ms
  Future.delayed(const Duration(milliseconds: 600), () {
    ref.read(hideSmoothProvider.notifier).state = false;
    //ref.read(durationProvider.notifier).state = const Duration(seconds: 5);
    ref.read(opacityProvider.notifier).state = 1;
  });
  Future.delayed(const Duration(milliseconds: 700), () {
    ref.read(durationProvider.notifier).state = const Duration(seconds: 5);
  });
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacityProvider),
        duration: basicDuration,
        child: child,
      ),
    );

//provider for opacity
final opacityProvider = StateProvider<double>((ref) => 1);

//provider for boolean
final isTerminalProvider = StateProvider<bool>((ref) => false);

//provider for boolean
final showBackButtonProvider = StateProvider<bool>((ref) => false);

forGlassOnlyGo(WidgetRef ref) {
  ref.read(hideSmoothProvider.notifier).state = true;
  ref.read(durationProvider.notifier).state = const Duration(milliseconds: 100);
}
