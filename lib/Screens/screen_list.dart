import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Services/constants.dart';
import '../UI/Adaptive Folder/synthesizer.dart';
import '../UI/Screens/About/about_main.dart';
import '../UI/Screens/About/about_state.dart';
import '../UI/Screens/settings.dart';
import '../UI/Screens/settings_state.dart';
import 'Astar/astar_state.dart';
import 'Astar/main_astar.dart';
import 'Best First Search/bsf_state.dart';
import 'Best First Search/bsf_main.dart';
import 'Breadth First Page/state_breadth.dart';
import 'Breadth First Page/main_breadth.dart';
import 'Buttons/buttons_main.dart';
import 'Buttons/state_button.dart';
import 'Compare/main_compare.dart';
import 'Compare/state_compare.dart';
import 'Depth First Page/state_df.dart';
import 'Depth First Page/main_df.dart';
import 'Home/home_state.dart';
import 'Terminal Page/main_terminal.dart';
import 'Home/home_main.dart';
import 'Terminal Page/state_terminal.dart';

enum ScreenDestination {
  home,
  terminal,
  breadthFirstAlg,
  buttons,
  depthFirstAlg,
  bestFirstAlg,
  aStarAlg,
  settings,
  about,
  compare,
}

//Create the go function with ref and a destination. Reads switch appBarCurrentScreen if is ScreenDestination.terminal call terminalGo etc.
go(WidgetRef ref, ScreenDestination destination) {
  final currentScreen = ref.read(currentScreenProvider.notifier).state;
  switch (currentScreen) {
    case ScreenDestination.home:
      homeGo(ref, destination);
    case ScreenDestination.terminal:
      terminalGo(ref, destination);
    case ScreenDestination.buttons:
      buttonGo(ref, destination);
    case ScreenDestination.breadthFirstAlg:
      bfGo(ref, destination);
    case ScreenDestination.depthFirstAlg:
      dfGo(ref, destination);
    case ScreenDestination.bestFirstAlg:
      bsfGo(ref, destination);
    case ScreenDestination.aStarAlg:
      asfGo(ref, destination);
    case ScreenDestination.about:
      aboutGo(ref, destination);
    case ScreenDestination.settings:
      settingsGo(ref, destination);
    case ScreenDestination.compare:
      compareGo(ref, destination);
    default:
      homeGo(ref, destination);
  }
}

goTo(WidgetRef ref, ScreenDestination destination) async {
  Future.delayed(basicDuration, () {
    ref.read(currentScreenProvider.notifier).state = destination;
  });
}

getCurrentScreen(ScreenDestination currentScreen) {
  switch (currentScreen) {
    case ScreenDestination.home:
      return const Home();
    case ScreenDestination.terminal:
      return const TerminalSide();
    case ScreenDestination.buttons:
      return const AlgorithmsGUIBody();
    case ScreenDestination.breadthFirstAlg:
      return const BreadthFirstAlg();
    case ScreenDestination.depthFirstAlg:
      return const BodyDf();
    case ScreenDestination.bestFirstAlg:
      return const BestFirstAlg();
    case ScreenDestination.aStarAlg:
      return const AStarAlg();
    case ScreenDestination.settings:
      return const Settings();
    case ScreenDestination.about:
      return const AboutScreen();
    case ScreenDestination.compare:
      return const Compare();
    default:
      return const Home();
  }
}
