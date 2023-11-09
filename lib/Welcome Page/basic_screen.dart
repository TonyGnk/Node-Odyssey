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
        mainChild: const SecondBasicScreen(),
        label: 'Basic',
        appBar: Stab(true),
        filledIcon: Icons.calculate,
        icon: Icons.calculate_outlined,
      );
}

class SecondBasicScreen extends StatelessWidget {
  const SecondBasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context, false));
    return Row(
      children: [
        Expanded(flex: 2, child: terminalSide(context)),
        const Expanded(
          child: ButtonsSide(),
        )
      ],
    );
  }
}
