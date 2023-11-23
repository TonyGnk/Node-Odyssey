import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Algorithms/Breadth First/start_calculation.dart';
import '../../../Algorithms/Breadth First/providers_bf.dart';
import '../../../Services & Providers/tracking_container.dart';
import 'tracking_buttons.dart';

class TrackingStage extends StatefulWidget {
  const TrackingStage({required this.ref, super.key});

  final WidgetRef ref;

  @override
  State<TrackingStage> createState() => _TrackingListState();
}

class _TrackingListState extends State<TrackingStage> {
  @override
  void initState() {
    super.initState();
    bool isFinished = widget.ref.read(isAlgorithmEndProviderBf.notifier).state;
    isFinished ? null : startCalR(widget.ref);
  }

  @override
  Widget build(BuildContext context) => Consumer(
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
}
