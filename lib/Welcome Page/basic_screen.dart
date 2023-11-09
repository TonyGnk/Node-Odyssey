// ignore_for_file: must_be_immutable

import 'dart:async';
import '../../UI/screen/screen.dart';
import '../../UI/screen/stab/stab.dart';
import 'package:flutter/material.dart';
import 'Services/welcome_dialog.dart';
import 'button_side.dart';
import 'terminal_side.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  RoutedScreen build(BuildContext context) => RoutedScreen(
        mainChild: SecondBasicScreen(),
        label: 'Basic',
        appBar: Stab(true),
        filledIcon: Icons.calculate,
        icon: Icons.calculate_outlined,
      );
}

class SecondBasicScreen extends StatelessWidget {
  SecondBasicScreen({super.key});

  bool z = true;

  @override
  Widget build(BuildContext context) {
    z
        ? Future.delayed(Duration.zero, () {
            showAlert(context, true);
            z = false;
          })
        : null;
    return Row(
      children: [
        Expanded(flex: 2, child: terminalSide(context)),
        const Expanded(child: ButtonsSide()),
      ],
    );
  }
}
