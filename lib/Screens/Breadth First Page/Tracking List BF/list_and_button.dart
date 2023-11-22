import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Breadth First/start_calculation.dart';
import '../../../Services & Providers/constants.dart';
import '../Services/List Panel/list_provider.dart';

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
    startCalR(widget.ref);
  }

  @override
  Widget build(BuildContext context) => trackingListConsumerBF();
}

// This is the left container displaying the tracking tiles.
Widget trackingListConsumerBF() => Consumer(
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
                    //mini: true,
                    //isExtended: true,
                    //label: Text('Νέα Αναζήτηση'),
                    child: const Icon(Icons.auto_awesome_outlined),
                  ),
                  body: trackingList.build(context)),
            ),
            //buttonArea(context),
          ],
        );
      },
    );

//Button Area
Widget buttonArea(BuildContext context) => Consumer(
    builder: (context, ref, _) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornerSize - 1),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: repeatButton(context, ref)),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    ref.watch(isCreatingProvider.notifier).state = true;
                  },
                  child: const Text(
                    'Νέα Αναζήτηση',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));

TextButton repeatButton(BuildContext context, WidgetRef ref) => TextButton(
      onPressed: () {
        //add delay 1ms
        startCalR(ref);
      },
      child: const Text(
        'Επανάληψη',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
