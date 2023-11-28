import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services & Providers/welcome_dialog.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';
import 'button_side.dart';
import 'terminal_side.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

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
  Widget build(BuildContext context) => SizedBox(
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
          ),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox(), // terminalSide(context),
              ),
              Column(
                children: [
                  const Expanded(child: SizedBox()),
                  theRow(context),
                  const SizedBox(height: 10),
                  theRow(context)
                ],
              ),
            ],
          ),
        ),
      );
}

//terminalSide(context)
//ButtonsSide

theRow(BuildContext context) => Row(children: [
      theGloriousButton(context),
      const SizedBox(width: 10),
      theGloriousButton(context),
    ]);

theGloriousButton(BuildContext context) => GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          // push breadthFirstAlgScreen(),
          MaterialPageRoute(
            builder: (context) => Scaffold(
              body: breadthFirstAlgScreen(),
            ),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                width: 340 * MediaQuery.of(context).size.width / 1380,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 2.5),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: theColumn(context),
                ),
              ),
            ),
          )
        ],
      ),
    );

Widget theColumn(BuildContext context) => const Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 4),
            Icon(
              Icons.radar_outlined,
              size: 30,
            ),
          ],
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Best First Search',
            style: TextStyle(fontSize: 23),
          ),
        ]),
      ],
    );
