import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'UI/Adaptive Root/adaptive_root.dart';
import 'Welcome Page/al1.dart';
import 'Welcome Page/basic_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  //print(savedThemeMode);
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatefulWidget {
  const MyApp({
    required this.savedThemeMode,
    super.key,
  });

  final AdaptiveThemeMode? savedThemeMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //init state

  @override
  Widget build(BuildContext context) => AdaptiveRoot(
        savedThemeMode: widget.savedThemeMode,
        appTitle: 'Algorithms',
        debugShowFloatingThemeButton: true,
        screens: [
          Algo1().build(context),
          //const BasicScreen().build(context),
        ],
      );
}
