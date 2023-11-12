import 'package:flutter/material.dart';
import '../../Services & Providers/welcome_dialog.dart';
import 'button_side.dart';
import 'terminal_side.dart';

class HomePageClass extends StatefulWidget {
  /// Μια κλάση που ενώνει τα κομμάτια της αρχικής οθόνης [terminalSide] και [ButtonsSide]
  const HomePageClass({super.key});

  @override
  State<HomePageClass> createState() => _HomePageClassState();
}

class _HomePageClassState extends State<HomePageClass> {
  bool isFirstRun = true;

  @override
  Widget build(BuildContext context) {
    isFirstRun
        ? Future.delayed(Duration.zero, () {
            showAlert(context, false);
            isFirstRun = false;
          })
        : null;
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: terminalSide(context)),
          const SizedBox(width: 25),
          const Expanded(child: ButtonsSide()),
        ],
      ),
    );
  }
}
