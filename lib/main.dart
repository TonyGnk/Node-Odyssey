import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'UI/screen/screen.dart';
import 'UI/screen/stab/stab.dart';
import 'UI/Adaptive Root/adaptive_root.dart';
import 'basic_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  //print(savedThemeMode);
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.savedThemeMode,
    super.key,
  });

  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) => AdaptiveRoot(
        savedThemeMode: savedThemeMode,
        appTitle: 'Algorithms',
        debugShowFloatingThemeButton: true,
        screens: [
          basicScreen(context),
        ],
      );
}
