import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Services & Providers/constants.dart';
import '../UI/Adaptive Folder/synthesizer.dart';
import '../UI/Screens/About/about_main.dart';
import '../UI/Screens/About/about_state.dart';
import '../UI/Screens/settings.dart';
import '../UI/Screens/settings_state.dart';
import 'Astar/astar_state.dart';
import 'Astar/main_astar.dart';
import 'Best First Search/bsf_state.dart';
import 'Best First Search/main_bsf.dart';
import 'Breadth First Page/bf_state.dart';
import 'Breadth First Page/main_bf.dart';
import 'Buttons/button_state.dart';
import 'Depth First Page/df_state.dart';
import 'Depth First Page/main_df.dart';
import 'Buttons/button_main.dart';
import 'Home/home_state.dart';
import 'Terminal Page/terminal_side.dart';
import 'Home/home_main.dart';
import 'Terminal Page/terminal_state.dart';

enum ScreenDestination {
  home,
  terminal,
  breadthFirstAlg,
  algorithmsGUI,
  depthFirstAlg,
  bestFirstAlg,
  aStarAlg,
  settings,
  about,
}

//Create the go function with ref and a destination. Reads switch appBarCurrentScreen if is ScreenDestination.terminal call terminalGo etc.
go(WidgetRef ref, ScreenDestination destination) {
  final currentScreen = ref.read(currentScreenProvider.notifier).state;
  switch (currentScreen) {
    case ScreenDestination.home:
      homeGo(ref, destination);
    case ScreenDestination.terminal:
      terminalGo(ref, destination);
    case ScreenDestination.algorithmsGUI:
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
    case ScreenDestination.algorithmsGUI:
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
    default:
      return const Home();
  }
}

//Maybe useless
callReturnOfScreen(WidgetRef ref, ScreenDestination goTo) {
  switch (goTo) {
    case ScreenDestination.home:
      homeReturn(ref);
    case ScreenDestination.terminal:
      terminalReturn(ref);
    case ScreenDestination.algorithmsGUI:
      buttonReturn(ref);
    case ScreenDestination.breadthFirstAlg:
      bfReturn(ref);
    case ScreenDestination.depthFirstAlg:
      dfReturn(ref);
    case ScreenDestination.bestFirstAlg:
      bsfReturn(ref);
    case ScreenDestination.aStarAlg:
      asfReturn(ref);
    default:
      homeReturn(ref);
  }
}
