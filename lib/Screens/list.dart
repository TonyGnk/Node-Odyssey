import 'package:flutter/material.dart';
import '../UI/screen/screen.dart';
import 'Breadth First Page/breadth_first_alg_page.dart';
import 'Home Page/home_page.dart';

// The home page for the app. This is the first page the user sees.
RoutedScreen homePage(BuildContext context) => RoutedScreen(
      mainChild: const Home(),
      label: 'Home',
      icon: Icons.home_outlined,
      filledIcon: Icons.home,
    );

RoutedScreen breadthFirstAlgPage(BuildContext context) => RoutedScreen(
      mainChild: const BreadthFirstAlg(),
      label: 'Home',
      icon: Icons.home_outlined,
      filledIcon: Icons.home,
    );
