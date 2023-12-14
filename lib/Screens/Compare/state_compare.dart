import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

void compareGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  goTo(ref, destination);
}

void compareReturn(WidgetRef ref) {
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.buttons;
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.compare;

  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
//  updateAppBarLabel(ref, 'Best First Algorithm', isReturn);
}
