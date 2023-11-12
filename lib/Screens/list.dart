import 'package:flutter/material.dart';
import '../UI/screen/screen.dart';
import '../UI/screen/stab/stab.dart';
import 'Breadth First Page/breadth_first_alg_page.dart';
import 'Home Page/home_page.dart';

// The home page for the app. This is the first page the user sees.
RoutedScreen homePage(BuildContext context) => RoutedScreen(
      mainChild: const Home(),
      label: 'Home',
      icon: Icons.home_outlined,
      filledIcon: Icons.home,
    );

// The Breadth First Algorithm page.
RoutedScreen breadthFirstAlgPage(BuildContext context) => RoutedScreen(
      mainChild: const TestAlg(),
      label: 'Breadth First Algorithm',
      icon: Icons.radar_outlined,
      filledIcon: Icons.radar,
      appBar: Stab(
        appBar: AppBar(
          title: const Text('Δοκιμή'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
