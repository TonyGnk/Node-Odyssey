import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:window_manager/window_manager.dart';

import 'UI/Adaptive Folder/adaptive_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!UniversalPlatform.isWeb) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      fullScreen: false,
      title: 'Algorithms',
      size: Size(1080, 770),
      center: false,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      windowButtonVisibility: false,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(
    ProviderScope(
      child: buildApp(savedThemeMode: savedThemeMode),
      //MyApp(savedThemeMode: savedThemeMode),
    ),
  );
}

AdaptiveRoot buildApp({AdaptiveThemeMode? savedThemeMode}) => AdaptiveRoot(
      savedThemeMode: savedThemeMode,
      appTitle: 'Algorithms',
      debugShowFloatingThemeButton: false,
    );
