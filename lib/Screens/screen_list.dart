import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Services & Providers/constants.dart';
import '../UI/Adaptive Folder/synthesizer.dart';
import 'Best First Search/bsf_state.dart';
import 'Best First Search/main_bsf.dart';
import 'Breadth First Page/bf_state.dart';
import 'Breadth First Page/main_bf.dart';
import 'Buttons/button_state.dart';
import 'Depth First Page/df_state.dart';
import 'Depth First Page/main_df.dart';
import 'Buttons/button_side.dart';
import 'Home Page/home_state.dart';
import 'Terminal Page/terminal_side.dart';
import 'Home Page/main_home.dart';
import 'Terminal Page/terminal_state.dart';

enum ScreenDestination {
  home,
  terminal,
  breadthFirstAlg,
  algorithmsGUI,
  depthFirstAlg,
  bestFirstAlg,
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
    default:
      return const Home();
  }
}

backButtonReturn(WidgetRef ref, ScreenDestination? currentScreen,
    ScreenDestination? targetScreen) {
  if (currentScreen == null || targetScreen == null) {
    return;
  }
  switch (currentScreen) {
    case ScreenDestination.home:
      null;
    case ScreenDestination.terminal:
      terminalGo(ref, targetScreen);
    case ScreenDestination.algorithmsGUI:
      buttonGo(ref, targetScreen);
    case ScreenDestination.breadthFirstAlg:
      bfGo(ref, targetScreen);
    case ScreenDestination.depthFirstAlg:
      dfGo(ref, targetScreen);
    case ScreenDestination.bestFirstAlg:
      bsfGo(ref, targetScreen);
    default:
      null;
  }
}

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
    default:
      homeReturn(ref);
  }
}



// // The home page for the app. This is the first page the user sees.
// RoutedScreen homeScreen() => RoutedScreen(
//       mainChild: home(),
//       label: 'Αρχική',
//       labelRoute: '/Home',
//       //Add a stat icon
//       icon: Icons.auto_awesome_outlined,
//     );

// // The Breadth First Algorithm page.
// RoutedScreen breadthFirstAlgScreen() => const RoutedScreen(
//       mainChild: BreadthFirstAlg(),
//       label: 'Αλγόριθμος Πρώτα σε Πλάτος ',
//       labelRoute: 'BreadthFirstAlgorithm',
//       icon: Icons.radar_outlined,
//       filledIcon: Icons.radar,
//     );

// //The GUI page of all algorithms
// RoutedScreen algorithmsGUIScreen() => const RoutedScreen(
//       mainChild: AlgorithmsGUI(),
//       label: 'Όλοι οι Αλγόριθμοι',
//       labelRoute: 'AllAlgorithms',
//       icon: Icons.desktop_windows_outlined,
//       filledIcon: Icons.desktop_windows,
//     );

// // The Depth First Algorithm page.
// RoutedScreen depthFirstAlgScreen() => const RoutedScreen(
//       mainChild: DepthFirstAlg(),
//       label: 'Αλγόριθμος Πρώτα σε Βάθος ',
//       labelRoute: 'DepthFirstAlgorithm',
//       icon: Icons.radar_outlined,
//       filledIcon: Icons.radar,
//     );
