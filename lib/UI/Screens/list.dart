import 'package:flutter/material.dart';
import '../Routed Screen/app_bar.dart';
import '../Routed Screen/routed_screen.dart';
import 'about_page.dart';

// The home page for the app. This is the first page the user sees.
RoutedScreen aboutScreen() => const RoutedScreen(
      mainChild: AboutScreen(),
      label: 'Αρχική',
      labelRoute: '/Home',
      icon: Icons.home_outlined,
      filledIcon: Icons.home,
      appBar: AdaptAppBar(
        filled: false,
      ),
    );
