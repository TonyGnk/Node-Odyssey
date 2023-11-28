import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'app_bar_icon.dart';

Widget windowsIcon(BuildContext context, bool enable, label) => enable
    ? AppBarIcon(
        tooltip: label,
        onPressed: () async {
          findOnPressed(label);
        },
        icon: findIcon(label),
      )
    : const SizedBox();

Future<void> findOnPressed(label) async {
  switch (label) {
    case 'Μεγιστοποίηση':
      windowManager.maximize();
    case 'Ελαχιστοποίηση':
      windowManager.minimize();
    case 'Κλείσιμο':
      windowManager.close();
    default:
  }
}

//Function get icons
Icon findIcon(label) {
  switch (label) {
    case 'Μεγιστοποίηση':
      return const Icon(Icons.crop_square_outlined);
    case 'Ελαχιστοποίηση':
      return const Icon(Icons.remove_outlined);
    case 'Κλείσιμο':
      return const Icon(Icons.close);
    default:
      return const Icon(Icons.close);
  }
}
