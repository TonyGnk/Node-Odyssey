import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

void bfGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  goTo(ref, destination);
}

void bfReturn(WidgetRef ref) {
  ref.read(appBarCurrentScreen.notifier).state =
      ScreenDestination.breadthFirstAlg;
  ref.read(appBarPreviousScreen.notifier).state =
      ScreenDestination.algorithmsGUI;

  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(appBarLabel.notifier).state = isReturn ? 'Breadth First Search' : '';
}
