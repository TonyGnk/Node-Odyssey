import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../public_left_column.dart';

Widget resultPanel() => Consumer(builder: (context, ref, _) {
      // ignore: unused_local_variable
      final stringResult = ref.watch(resultPanelList);
      final resList = ref.watch(resListProvider);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3),
          resultsAppBar(ref),
          const SizedBox(height: 3),
          Expanded(
            child: resList.build(context),
          ),
        ],
      );
    });

Widget resultsAppBar(WidgetRef ref) => Row(
      children: [
        const SizedBox(width: 8),
        Expanded(child: headerText('Results')),
        const SizedBox(width: 2),
        IconButton(
          onPressed: () => ref.read(isOnTrackingProvider.notifier).state = true,
          icon: const Icon(Icons.insights_outlined),
        ),
        IconButton(
          onPressed: () => ref.read(runOnceProvider.notifier).state = false,
          icon: const Icon(Icons.close),
        ),
      ],
    );
