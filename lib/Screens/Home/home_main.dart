import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screen_list.dart';
import 'modern_button.dart';
import 'home_state.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _TerminalSideState();
}

class _TerminalSideState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      homeReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Row(
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
      );
}

rightColumn() => animatedColumn(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 3, child: SizedBox()),
          welcomeToText(),
          titleText(),
          const Expanded(flex: 3, child: SizedBox()),
          const Text('Select the mode you want to use:'),
          const SizedBox(height: 16),
          rowOfButtons(),
          const Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );

welcomeToText() => const Text(
      'Welcome to',
      style: TextStyle(
        fontSize: 30,
        fontFamily: 'Play',
      ),
      textAlign: TextAlign.left,
    );

titleText() => const Text(
      'Node Odyssey',
      style: TextStyle(
          fontSize: 33,
          color: Color.fromRGBO(32, 102, 224, 0.9),
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    );

rowOfButtons() => Consumer(
      builder: (context, ref, _) => Row(
        children: [
          TheGloriousButton(
            label: 'Terminal',
            icon: Icons.terminal,
            onTap: () => homeGo(ref, ScreenDestination.terminal),
          ),
          const SizedBox(width: 10),
          TheGloriousButton(
            label: 'GUI',
            icon: Icons.desktop_windows_outlined,
            onTap: () => homeGo(ref, ScreenDestination.algorithmsGUI),
          ),
        ],
      ),
    );

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