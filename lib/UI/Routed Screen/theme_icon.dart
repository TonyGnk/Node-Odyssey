import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'app_bar_icon.dart';

Widget themeIcon(BuildContext context, bool enable) {
  String mode = AdaptiveTheme.of(context).mode.toString();
  return enable
      ? AppBarIcon(
          tooltip: mode == 'AdaptiveThemeMode.dark'
              ? 'Είσαι dark. Αλλαγή σε σύστημα θέμα'
              : mode == 'AdaptiveThemeMode.system'
                  ? 'Είσαι σύστημα. Αλλαγή σε φωτεινό θέμα'
                  : 'Είσαι φωτεινός. Αλλαγή σε σκοτεινό θέμα.',
          isSelected: mode == 'AdaptiveThemeMode.dark' ||
              mode == 'AdaptiveThemeMode.system',
          onPressed: () {
            AdaptiveTheme.of(context).toggleThemeMode();
            AdaptiveTheme.of(context).updateState();
          },
          icon: Icon(Icons.wb_sunny_outlined,
              color: Theme.of(context).colorScheme.onBackground),
          selectedIcon: mode == 'AdaptiveThemeMode.dark'
              ? Icon(Icons.dark_mode_outlined,
                  color: Theme.of(context).colorScheme.onBackground)
              : Icon(Icons.contrast_outlined,
                  color: Theme.of(context).colorScheme.onBackground),
        )
      : const SizedBox();
}
