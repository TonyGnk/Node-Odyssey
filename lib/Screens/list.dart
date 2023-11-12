import 'package:flutter/material.dart';
import '../UI/screen/routed_screen.dart';
import 'Breadth First Page/breadth_first_alg_page.dart';
import 'Home Page/home_page.dart';

// The home page for the app. This is the first page the user sees.
RoutedScreen homePage(BuildContext context) => const RoutedScreen(
      mainChild: Home(),
      label: 'Home',
      icon: Icons.home_outlined,
      filledIcon: Icons.home,
    );

// The Breadth First Algorithm page.
RoutedScreen breadthFirstAlgPage(BuildContext context) => const RoutedScreen(
      mainChild: TestAlg(),
      label: 'Breadth First Algorithm',
      icon: Icons.radar_outlined,
      filledIcon: Icons.radar,
    );
