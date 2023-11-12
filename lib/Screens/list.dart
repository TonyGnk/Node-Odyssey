import 'package:flutter/material.dart';
import '../UI/screen/screen.dart';
import '../UI/screen/stab/stab.dart';
import 'Welcome Page/basic_screen.dart';

RoutedScreen homePage(BuildContext context) => RoutedScreen(
      mainChild: SecondBasicScreen(),
      label: 'Basic',
      appBar: Stab(true),
      filledIcon: Icons.calculate,
      icon: Icons.calculate_outlined,
    );
