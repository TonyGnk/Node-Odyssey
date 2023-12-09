import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/screen_list.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../Routed Screen/info_icon.dart';

void aboutGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  destination == ScreenDestination.home
      ? updateAppBarBackButton(ref, false)
      : updateAppBarBackButton(ref, true);

  goTo(ref, destination);
}

void aboutReturn(WidgetRef ref) {
  ref.read(appBarPreviousScreen.notifier).state =
      ref.read(appBarCurrentScreen.notifier).state;
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.about;

  updateAppBarBackButton(ref, true);
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateAppBarLabel(ref, 'About App', isReturn);
  updateAppBarInfoButton(ref, !isReturn);
}
