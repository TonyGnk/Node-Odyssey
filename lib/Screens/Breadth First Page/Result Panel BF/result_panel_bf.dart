import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../Archive BF/result_providers.dart';
import 'result_box_bf.dart';

Widget resultPanel(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final stringResult = ref.watch(resultPanelList);
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(cornerSize),
          ),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
        ),
        child: listView(context, stringResult),
      );
    });

ListView listView(BuildContext context, List<ResultBoxBf> trackingTiles) =>
    ListView(
      reverse: false,
      children: [
        for (int i = 0; i < trackingTiles.length; i++)
          trackingTiles[i].build(context),
      ],
    );
