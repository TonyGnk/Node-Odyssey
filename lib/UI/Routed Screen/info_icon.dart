import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Services2/navigator_fun.dart';
import 'app_bar.dart';

Widget infoIcon(BuildContext context, WidgetRef ref, bool enable) => enable
    ? appBarIcon(
        Icon(Icons.info_outlined,
            color: Theme.of(context).colorScheme.onBackground),
        () async {
          navigateToScreen(context, '/about');
        },
        'Πληροφορίες Εφαρμογής',
      )
    : const SizedBox();
