import 'package:flutter/material.dart';
import '../UI/screen/routed_screen.dart';
import 'Breadth First Page/breadth_first_page.dart';
import 'Home Page/home_page.dart';

// The home page for the app. This is the first page the user sees.
RoutedScreen homeScreen(BuildContext context) => const RoutedScreen(
      mainChild: Home(),
      label: 'Home',
      icon: Icons.home_outlined,
      filledIcon: Icons.home,
    );

// The Breadth First Algorithm page.
RoutedScreen breadthFirstAlgScreen(BuildContext context) => const RoutedScreen(
      mainChild: BreadthFirstAlg(),
      label: 'Breadth First Algorithm',
      icon: Icons.radar_outlined,
      filledIcon: Icons.radar,
    );
