import 'package:flutter/material.dart';
import '../UI/routed_screen.dart';
import 'Breadth First Page/breadth_first_page.dart';
import 'Home Page/home_page.dart';

// The home page for the app. This is the first page the user sees.
RoutedScreen homeScreen() => const RoutedScreen(
      mainChild: Home(),
      label: 'Αρχική',
      labelRoute: '/Home',
      icon: Icons.home_outlined,
      filledIcon: Icons.home,
    );

// The Breadth First Algorithm page.
RoutedScreen breadthFirstAlgScreen() => const RoutedScreen(
      mainChild: BreadthFirstAlg(),
      label: 'Αλγόριθμος Πρώτα σε Βάθος',
      labelRoute: '/BreadthFirstAlgorithm',
      icon: Icons.radar_outlined,
      filledIcon: Icons.radar,
    );
