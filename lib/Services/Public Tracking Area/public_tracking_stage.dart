import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Public Search Bar/closed_search.dart';
import '../public_left_column.dart';
import '../tracking_container.dart';

Widget trackingStage() => Consumer(
      builder: (context, ref, _) {
        final trackingList = ref.watch(trackingListProvider);
        // ignore: unused_local_variable
        final updater = ref.watch(trackUpdater);
        final isAlgorithmEnd = ref.watch(isAlgorithmEndProvider);
        return Column(
          children: [
            const SizedBox(height: 3),
            isAlgorithmEnd
                ? trackingAppBarRevised(ref, isAlgorithmEnd)
                : trackingAppBar(),
            const SizedBox(height: 3),
            Expanded(child: trackingList.build(context)),
          ],
        );
      },
    );

Widget trackingAppBar() => Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: headerText(
            'Search from ${inputController.text} to ${targetController.text}',
          ),
        ),
      ],
    );

Widget trackingAppBarRevised(WidgetRef ref, bool isAlgorithmEnd) => Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: headerText('Node Log'),
        ),
        const SizedBox(width: 2),
        isAlgorithmEnd
            ? IconButton(
                onPressed: () =>
                    ref.read(isOnTrackingProvider.notifier).state = false,
                icon: const Icon(Icons.checklist_rtl_outlined))
            : const SizedBox(),
        isAlgorithmEnd
            ? IconButton(
                onPressed: () =>
                    ref.read(runOnceProvider.notifier).state = false,
                icon: const Icon(Icons.close),
              )
            : const SizedBox(),
      ],
    );
