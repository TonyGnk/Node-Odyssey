import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Breadth First/providers_bf.dart';
import '../../../Services & Providers/tracking_container.dart';
import '../Archive BF/list_provider.dart';
import '../Result Panel BF/result_panel_bf.dart';
import '../main_bf.dart';

Widget trackingListAndButton(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final isAlgorithmEnd = ref.watch(isAlgorithmEndProviderBf);
      return containerWithStyleBF(
        Theme.of(context).shadowColor.withOpacity(1),
        Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        isAlgorithmEnd ? resultPanel(context) : trackingStage(context),
      );
    });

Widget trackingStage(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final trackingList = ref.watch(trackingListProvider);
        // ignore: unused_local_variable
        final updater = ref.watch(trackUpdater);
        return Column(
          children: [
            miniAppBar(context),
            Expanded(child: trackingList.build(context)),
            //pauseResumeAreaBf(context),
          ],
        );
      },
    );

Widget miniAppBar(BuildContext context) => Consumer(builder: (context, ref, _) {
      final startValue =
          ref.read(bfRunningProvider.notifier).state.startValue.toString();
      final targetValue =
          ref.read(bfRunningProvider.notifier).state.targetValue.toString();
      return Row(
        children: [
          const SizedBox(width: 8),
          Expanded(child: Text('Αναζήτηση από $startValue σε $targetValue')),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  value: 0.7,
                )),
          ),
          const SizedBox(width: 8),
        ],
      );
    });
