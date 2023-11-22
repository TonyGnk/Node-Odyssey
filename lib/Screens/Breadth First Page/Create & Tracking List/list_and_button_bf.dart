import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Algorithms/Breadth First/start_calculation.dart';
import '../../../Algorithms/Breadth First/providers_bf.dart';
import '../../../Services & Providers/tracking_container.dart';
import '../Archive BF/list_provider.dart';
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
  Widget build(BuildContext context) => trackingListBf();
}

Widget trackingListBf() => Consumer(
      builder: (context, ref, _) {
        final trackingList = ref.watch(trackingListProvider);
        final tr1 = ref.watch(trackUpdater); // ignore: unused_local_variable
        return Column(
          children: [
            Expanded(
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    onPressed: () {
                      ref.watch(isCreatingProvider.notifier).state = true;
                    },
                    child: const Icon(Icons.auto_awesome_outlined),
                  ),
                  body: trackingList.build(context)),
            ),
            buttonArea(context),
          ],
        );
      },
    );
