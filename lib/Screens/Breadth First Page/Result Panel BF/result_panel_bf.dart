import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Archive BF/result_providers.dart';
import 'results_appbar_bf.dart';

Widget resultPanel(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final stringResult = ref.watch(resultPanelList);
      final resList = ref.watch(resListProvider);

      return Column(
        children: [
          const SizedBox(height: 3),
          resultsAppBar(context),
          const SizedBox(height: 3),
          Expanded(
            child: resList.build(
              context,
            ),
          ),
        ],
      );
    });
