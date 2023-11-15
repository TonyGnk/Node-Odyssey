import 'package:flutter/material.dart';
import '../Services/navigator_fun.dart';
import 'app_bar_icon.dart';

Widget infoIcon(BuildContext context, bool enable) => enable
    ? AppBarIcon(
        tooltip: 'Πληροφορίες Εφαρμογής',
        onPressed: () async {
          navigateToScreen(context, '/about');
        },
        icon: Icon(Icons.info_outlined,
            color: Theme.of(context).colorScheme.onBackground),
      )
    : const SizedBox();
