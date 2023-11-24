import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../Archive BF/result_providers.dart';
import 'result_box_bf.dart';
import 'results_appbar_bf.dart';

Widget resultPanel(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final stringResult = ref.watch(resultPanelList);
      final resList = ref.watch(resListProvider);

      return Column(
        children: [
          resultsAppBar(context),
          Expanded(
            child: resList.build(
              context,
            ),
          ),
        ],
      );
    });
