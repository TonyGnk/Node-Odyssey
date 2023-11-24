import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Algorithms/Breadth First/start_calculation.dart';
import '../../../Algorithms/Breadth First/providers_bf.dart';
import '../../../Services & Providers/tracking_container.dart';
import 'tracking_buttons.dart';
import '../main_bf.dart';

Widget trackingListAndButton(BuildContext context) => Consumer(
    builder: (context, ref, _) => containerWithStyleBF(
          Theme.of(context).shadowColor.withOpacity(1),
          Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          trackingStage(context),
        ));

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

// class trackingStage extends StatefulWidget {
//   const trackingStage({required this.ref, super.key});

//   final WidgetRef ref;

//   @override
//   State<trackingStage> createState() => _TrackingListState();
// }

// class _TrackingListState extends State<trackingStage> {
//   @override
//   void initState() {
//     super.initState();
//     bool isFinished = widget.ref.read(isAlgorithmEndProviderBf.notifier).state;
//     isFinished ? null : startCalR(widget.ref);
//   }

//   @override
//   Widget build(BuildContext context) => Consumer(
//         builder: (context, ref, _) {
//           final trackingList = ref.watch(trackingListProvider);
//           // ignore: unused_local_variable
//           final updater = ref.watch(trackUpdater);
//           return Column(
//             children: [
//               miniAppBar(context),
//               Expanded(child: trackingList.build(context)),
//               //pauseResumeAreaBf(context),
//             ],
//           );
//         },
//       );
// }
