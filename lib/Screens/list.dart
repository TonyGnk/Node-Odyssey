import 'package:flutter/material.dart';
import '../UI/screen/screen.dart';
import 'Welcome Page/basic_screen.dart';

RoutedScreen homePage(BuildContext context) => RoutedScreen(
      mainChild: const HomePageClass(),
      label: 'Home',
      icon: Icons.home_outlined,
      filledIcon: Icons.home,
    );
