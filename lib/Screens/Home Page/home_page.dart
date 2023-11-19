import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services & Providers/welcome_dialog.dart';
import 'button_side.dart';
import 'terminal_side.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    unawaited(checkFirstRun().catchError((error) {
      // Handle any errors here.
      log('An error occurred: $error');
    }));
  }

  Future<void> checkFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('firstRun') ?? true;
    if (isFirstRun) {
      Future.delayed(Duration.zero, () {
        showAlert(context, false);
      });
      await prefs.setBool('firstRun', false);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
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
