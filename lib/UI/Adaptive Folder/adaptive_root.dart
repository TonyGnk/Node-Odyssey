// ignore_for_file: discarded_futures

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'root_config.dart';
import '../Theme Services/ui_change.dart';
import '../Themes/material_theme_data.dart';

class AdaptiveRoot extends StatefulWidget {
  const AdaptiveRoot({
    required this.appTitle,
    this.savedThemeMode,
    super.key,
    this.debugShowFloatingThemeButton = false,
  });

  /// The title of the app in recent apps, tittle bar, etc
  final String appTitle;

  final AdaptiveThemeMode? savedThemeMode;

  /// Show a floating button for light/dark and system theme. Defaults to false.
  final bool debugShowFloatingThemeButton;

  @override
  State<AdaptiveRoot> createState() => _AdaptiveRootState();
}

class _AdaptiveRootState extends State<AdaptiveRoot> {
  TotalTheme? theme;

  @override
  void initState() {
    super.initState();
    setUiTheme();
  }

  Future<void> setUiTheme() async {
    final theme = await getUITheme();
    setState(() {
      this.theme = theme;
    });
  }

  @override
  Widget build(BuildContext context) => theme != null
      ? rootConfig(
          context,
          theme!,
          widget.savedThemeMode,
          widget.appTitle,
          widget.debugShowFloatingThemeButton,
        )
      : circularProgressScreen();
}

Widget circularProgressScreen() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Loading Theme...'),
            ],
          ),
        ),
      ),
    );

// const Spacer(),
// const Text(
//   'Current Theme Mode',
//   style: TextStyle(
//     fontSize: 20,
//   ),
// ),
// Text(
//   AdaptiveTheme.of(context).mode.modeName.toUpperCase(),
//   style: const TextStyle(
//     fontSize: 24,
//     fontWeight: FontWeight.bold,
//   ),
// ),
//const Spacer(),
// ElevatedButton(
//   onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(),
//   child: const Text('Toggle Theme Mode'),
// ),
// const SizedBox(height: 8),
// ElevatedButton(
//   onPressed: () => AdaptiveTheme.of(context).setDark(),
//   child: const Text('Set Dark'),
// ),
// const SizedBox(height: 8),
// ElevatedButton(
//   onPressed: () => AdaptiveTheme.of(context).setLight(),
//   child: const Text('set Light'),
// ),
// const SizedBox(height: 8),
// ElevatedButton(
//     onPressed: () => AdaptiveTheme.of(context).setSystem(),
//     child: const Text('Set System Default'),
//     style: ButtonStyle(
//       backgroundColor: MaterialStateProperty.all(
//           Theme.of(context).colorScheme.onPrimary),
//     )),
// const SizedBox(height: 8),
// ElevatedButton(
//   onPressed: () => AdaptiveTheme.of(context).setTheme(
//     light: ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,
//       primarySwatch: Colors.pink,
//     ),
//     dark: ThemeData(
//       useMaterial3: false,
//       brightness: Brightness.dark,
//       primarySwatch: Colors.pink,
//     ),
//   ),
//   child: const Text('Set Custom Theme'),
// ),
// const SizedBox(height: 8),
// ElevatedButton(
//   onPressed: () => AdaptiveTheme.of(context).reset(),
//   child: const Text('Reset to Default Themes'),
// ),
//const Spacer(flex: 2),
