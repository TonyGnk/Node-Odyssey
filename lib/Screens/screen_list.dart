import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../UI/Routed Screen/app_bar.dart';
import '../UI/Routed Screen/routed_screen.dart';
import 'Breadth First Page/breadth_first_page.dart';
import 'Home Page/home_page.dart';

final screensProvider = StateProvider<List<RoutedScreen>>(
  (ref) => [
    homeScreen(),
    breadthFirstAlgScreen(),
  ],
);

// The home page for the app. This is the first page the user sees.
RoutedScreen homeScreen() => const RoutedScreen(
      mainChild: Home(),
      label: 'Αρχική',
      labelRoute: '/Home',
      //Add a stat icon
      icon: Icons.auto_awesome_outlined,
      filledIcon: Icons.auto_awesome,
      appBar: AdaptAppBar(
        showBackButton: false,
        filled: false,
        showInfoIcon: true,
        showThemeIcon: true,
      ),
    );

final resultPanelList = StateProvider<List<Container>>(
  (ref) => [],
);

// The Breadth First Algorithm page.
RoutedScreen breadthFirstAlgScreen() => RoutedScreen(
      mainChild: BreadthFirstAlg(),
      label: 'Αλγόριθμος Πρώτα σε Βάθος ',
      labelRoute: 'BreadthFirstAlgorithm',
      icon: Icons.radar_outlined,
      filledIcon: Icons.radar,
      appBar: const AdaptAppBar(
        filled: false,
        label: 'Αλγόριθμος Πρώτα σε Βάθος',
        showThemeIcon: true,
        showInfoIcon: true,
      ),
    );
