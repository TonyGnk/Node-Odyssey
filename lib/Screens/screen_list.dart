// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../UI/Adaptive Templates/body_with_appbar.dart';
import '../UI/Routed Screen/app_bar.dart';
import '../UI/Routed Screen/routed_screen.dart';
import 'Breadth First Page/main_bf.dart';
import 'Buttons/button_state.dart';
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
}

getCurrentScreen(ScreenDestination currentScreen) {
  switch (currentScreen) {
    case ScreenDestination.home:
      return home();
    case ScreenDestination.terminal:
      return terminalSide();
    case ScreenDestination.algorithmsGUI:
      return const AlgorithmsGUIBody();
    case ScreenDestination.breadthFirstAlg:
      return bodyBf();
    case ScreenDestination.depthFirstAlg:
      return bodyDf();
    default:
      return home();
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
