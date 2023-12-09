import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

void dfGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);

  goTo(ref, destination);
}

void dfReturn(WidgetRef ref) {
  ref.read(appBarCurrentScreen.notifier).state =
      ScreenDestination.depthFirstAlg;
  ref.read(appBarPreviousScreen.notifier).state =
      ScreenDestination.algorithmsGUI;

  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateAppBarLabel(ref, 'Depth First Search', isReturn);
}
