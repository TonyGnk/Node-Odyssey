import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/tracking_container.dart';
import '../Archive BF/list_provider.dart';

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
                width: 20, height: 20, child: CircularProgressIndicator()),
          ),
          const SizedBox(width: 8),
        ],
      );
    });
