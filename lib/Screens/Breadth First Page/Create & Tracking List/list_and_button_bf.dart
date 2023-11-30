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
            const SizedBox(height: 5),
            miniAppBar(context),
            const SizedBox(height: 5),
            Expanded(child: trackingList.build(context)),
          ],
        );
      },
    );

Widget miniAppBar(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final startValue = ref
            .read(runningRequestProvider.notifier)
            .state
            .startValue
            .toString();
        final targetValue = ref
            .read(runningRequestProvider.notifier)
            .state
            .targetValue
            .toString();
        return Row(
          children: [
            const SizedBox(width: 8),
            Expanded(child: Text('Αναζήτηση από $startValue σε $targetValue')),
            const SizedBox(width: 8),
          ],
        );
      },
    );
