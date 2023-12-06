import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

void bsfGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  goTo(ref, destination);
}

void bsfReturn(WidgetRef ref) {
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.bestFirstAlg;
  ref.read(appBarPreviousScreen.notifier).state =
      ScreenDestination.algorithmsGUI;

  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(appBarLabel.notifier).state = isReturn ? 'Best First Algorithm' : '';
}
