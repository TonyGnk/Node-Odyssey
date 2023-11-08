import '../UI/screen/screen.dart';
import '../UI/screen/stab/stab.dart';
import 'package:flutter/material.dart';
import 'button_side.dart';
import 'terminal_side.dart';

basicScreen(BuildContext context) => RoutedScreen(
      mainChild: Row(
        children: [
          Expanded(child: terminalSide(context)),
          Expanded(
            child: buttonsSide(context),
          )
        ],
      ),
      label: 'Basic',
      appBar: Stab(true),
      filledIcon: Icons.calculate,
      icon: Icons.calculate_outlined,
    );

//Left Widget with name terminalSide


//Right Widget with name buttonsSide
