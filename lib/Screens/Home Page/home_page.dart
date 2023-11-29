import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services & Providers/welcome_dialog.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';
import 'modern_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => bodyWithAppBar(
        context: context,
        appBar: appBarBf(context),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Body(),
        ),
      );
}

// Αυτή είναι η γραμμή τίτλου της οθόνης
// Περιλαμβάνει το όνομα του αλγορίθμου και τα εικονίδια θέματος και πληροφοριών
Widget appBarBf(BuildContext context) => AdaptAppBar(
      filled: false,
      label: '',
      showThemeIcon: true,
      showBackButton: false,
      brightness: Theme.of(context).brightness,
      backgroundColor: Colors.transparent,
    );

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
        child: const Row(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'AdventoPro',
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Algorithms Visualizer',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                  //select λειτουργία Τερματικό ή γραφική διεπαφή
                  Expanded(flex: 1, child: SizedBox()),
                  Text('Select the mode you want to use:'),
                  Expanded(flex: 1, child: SizedBox()),
                ],
              ),
            ),
          ],
        ),
      );
}

//terminalSide(context)
//ButtonsSide

theRow(BuildContext context) => const Row(children: [
      theGloriousButton(label: 'Best First Search'),
      SizedBox(width: 10),
      theGloriousButton(label: 'A* Search'),
    ]);
