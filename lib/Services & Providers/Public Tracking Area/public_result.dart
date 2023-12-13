import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../public_left_column.dart';

Widget resultPanel() => Consumer(builder: (context, ref, _) {
      // ignore: unused_local_variable
      final stringResult = ref.watch(resultPanelList);
      final resList = ref.watch(resListProvider);
      final previousInput = ref.watch(savedInputProvider);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3),
          resultsAppBar(ref, previousInput),
          const SizedBox(height: 3),
          Expanded(
            child: resList.build(context),
          ),
        ],
      );
    });

Widget resultsAppBar(WidgetRef ref, String previousInput) => Row(
      children: [
        const SizedBox(width: 8),
        headerText('Results  '),
        costText(previousInput),
        const Expanded(child: SizedBox()),
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

costText(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: 'Play',
      ),
    );

commandsText(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontFamily: 'Play',
      ),
    );

final savedInputProvider = StateProvider<String>((ref) => '');
final resultCountProvider = StateProvider<int>((ref) => 0);
final resultCostProvider = StateProvider<int>((ref) => 0);
