// ignore_for_file: prefer_const_literals_to_create_immutables,

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';
import 'Services/List Panel/result_providers.dart';
import 'algorithm_bf.dart';
import 'center_column_bf.dart';
import 'left_column_bf.dart';
import 'right_column_bf.dart';

class BreadthFirstAlg extends StatelessWidget {
  const BreadthFirstAlg({super.key});

  @override
  Widget build(BuildContext context) => bodyWithAppBar(
        appBar: appBar(context),
        body: body(context),
      );

  Widget appBar(BuildContext context) => const AdaptAppBar(
        filled: false,
        label: 'Αλγόριθμος Πρώτα σε Βάθος',
        showThemeIcon: true,
        showInfoIcon: true,
      );

  Widget body(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: c1(context),
          ),
          Expanded(
            flex: 14,
            child: c2(context),
          ),
          Expanded(
            flex: 3,
            child: c3(context),
          ),
        ],
      );
}
