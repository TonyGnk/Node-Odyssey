import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services & Providers/welcome_dialog.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';
import 'button_side.dart';
import 'modern_button.dart';
import 'terminal_side.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => bodyWithAppBarGlass(
          context: context,
          appBar: appBarBf(context),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ref.watch(isTerminalProvider)
                ? terminalSide(context)
                : const Body(),
          ),
          isBlackFirst: true,
          ref: ref,
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
    // unawaited(checkFirstRun().catchError((error) {
    //   // Handle any errors here.
    //   log('An error occurred: $error');
    // }));
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
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => Container(
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: AnimatedOpacity(
                  opacity: ref.watch(opacityProvider),
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 3, child: SizedBox()),
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'AdventoPro',
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Text(
                        'Algorithms Visualizer',
                        style: TextStyle(
                            fontSize: 32,
                            color: Color.fromRGBO(32, 102, 224, 0.9),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const Expanded(flex: 3, child: SizedBox()),
                      const Text('Select the mode you want to use:'),
                      const SizedBox(height: 16),
                      Row(children: [
                        TheGloriousButton(
                          label: 'Terminal',
                          icon: Icons.terminal,
                          onTap: () async => onPressed(ref),
                        ),
                        const SizedBox(width: 10),
                        TheGloriousButton(
                          label: 'GUI',
                          icon: Icons.desktop_windows_outlined,
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Scaffold(
                                  body: AlgorithmsGUI(),
                                ),
                              ),
                            );
                          },
                        ),
                      ]),
                      const Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

//terminalSide(context)
//ButtonsSide

//function onPressed
void onPressed(WidgetRef ref) {
  ref.read(hideSmoothProvider.notifier).state = true;
  ref.read(durationProvider.notifier).state = const Duration(milliseconds: 200);
  ref.read(opacityProvider.notifier).state = 0;
  //delay 200ms
  Future.delayed(const Duration(milliseconds: 300), () {
    ref.read(isTerminalProvider.notifier).state = true;
  });
}

//provider for opacity
final opacityProvider = StateProvider<double>((ref) => 1);

//provider for boolean
final isTerminalProvider = StateProvider<bool>((ref) => false);
