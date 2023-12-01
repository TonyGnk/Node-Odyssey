import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../UI/Adaptive Templates/body_with_appbar.dart';
import 'ArchHP/button_side.dart';
import 'ArchHP/modern_button.dart';

home() => Consumer(
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
              child: rightColumn(),
            ),
          ],
        ),
      ),
    );

rightColumn() => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
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
    );

//function onPressed
void onPressed(WidgetRef ref) {
  ref.read(hideSmoothProvider.notifier).state = true;
  ref.read(durationProvider.notifier).state = const Duration(milliseconds: 100);
  ref.read(opacityProvider.notifier).state = 0;
  //delay 200ms
  Future.delayed(const Duration(milliseconds: 600), () {
    ref.read(isTerminalProvider.notifier).state = true;
    ref.read(showBackButtonProvider.notifier).state = true;
  });
}

void onPressedRev(WidgetRef ref) {
  ref.read(isTerminalProvider.notifier).state = false;
  ref.read(showBackButtonProvider.notifier).state = false;

  //delay 200ms
  Future.delayed(const Duration(milliseconds: 600), () {
    ref.read(hideSmoothProvider.notifier).state = false;
    //ref.read(durationProvider.notifier).state = const Duration(seconds: 5);
    ref.read(opacityProvider.notifier).state = 1;
  });
  Future.delayed(const Duration(milliseconds: 700), () {
    ref.read(durationProvider.notifier).state = const Duration(seconds: 5);
  });
}

//provider for opacity
final opacityProvider = StateProvider<double>((ref) => 1);

//provider for boolean
final isTerminalProvider = StateProvider<bool>((ref) => false);

//provider for boolean
final showBackButtonProvider = StateProvider<bool>((ref) => false);


// class _BodyState extends State<Body> {
//   @override
//   void initState() {
//     super.initState();
//     unawaited(checkFirstRun().catchError((error) {
//       // Handle any errors here.
//       //log('An error occurred: $error');
//     }));
//   }

//   Future<void> checkFirstRun() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isFirstRun = true; //prefs.getBool('firstRun') ?? true;
//     if (isFirstRun) {
//       Future.delayed(Duration.zero, () {
//         showAlert(context, true);
//       });
//       await prefs.setBool('firstRun', false);
//     }
//   }
// }