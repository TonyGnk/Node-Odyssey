import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../UI/Routed Screen/routed_screen.dart';
import 'Breadth First Page/main_bf.dart';
import 'Depth First Page/main_df.dart';
import 'Home Page/button_side.dart';
import 'Home Page/home_page.dart';

final screensProvider = StateProvider<List<RoutedScreen>>(
  (ref) => [
    homeScreen(),
  ],
);

final destinationsProvider = StateProvider<List<RoutedScreen>>(
  (ref) => [
    breadthFirstAlgScreen(),
    algorithmsGUIScreen(),
    depthFirstAlgScreen(),
  ],
);

// The home page for the app. This is the first page the user sees.
RoutedScreen homeScreen() => const RoutedScreen(
      mainChild: Home(),
      label: 'Αρχική',
      labelRoute: '/Home',
      //Add a stat icon
      icon: Icons.auto_awesome_outlined,
    );

final resultPanelList = StateProvider<List<Container>>(
  (ref) => [],
);

// The Breadth First Algorithm page.
RoutedScreen breadthFirstAlgScreen() => const RoutedScreen(
      mainChild: BreadthFirstAlg(),
      label: 'Αλγόριθμος Πρώτα σε Πλάτος ',
      labelRoute: 'BreadthFirstAlgorithm',
      icon: Icons.radar_outlined,
      filledIcon: Icons.radar,
    );

//The GUI page of all algorithms
RoutedScreen algorithmsGUIScreen() => const RoutedScreen(
      mainChild: AlgorithmsGUI(),
      label: 'Όλοι οι Αλγόριθμοι',
      labelRoute: 'AllAlgorithms',
      icon: Icons.desktop_windows_outlined,
      filledIcon: Icons.desktop_windows,
    );

// The Depth First Algorithm page.
RoutedScreen depthFirstAlgScreen() => const RoutedScreen(
      mainChild: DepthFirstAlg(),
      label: 'Αλγόριθμος Πρώτα σε Βάθος ',
      labelRoute: 'DepthFirstAlgorithm',
      icon: Icons.radar_outlined,
      filledIcon: Icons.radar,
    );
