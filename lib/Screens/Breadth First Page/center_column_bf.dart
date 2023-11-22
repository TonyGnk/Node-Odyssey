import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import 'Services/List Panel/list_provider.dart';
import 'Services/List Panel/result_providers.dart';
import 'Result Panel BF/result_box_bf.dart';

Widget centerColumnBf(BuildContext context) =>
    Consumer(builder: (_, WidgetRef ref, __) {
      final isCreating = ref.watch(isCreatingProvider);
      final bfRunning = ref.read(bfRunningProvider.notifier).state;
      final bfRunningUpdater = ref.watch(bfRunningProviderUpdater);
      //final startValue = bfRunning.getStartValue;
      return Column(
        children: [
          Expanded(
            child: containerZ(context),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: resultPanel(
              context,
            ),
          ),
          // Text('Start: ${bfRunning.startValue}'),
          // Text('Target: ${bfRunning.targetValue}'),
          // Text('Speed: ${bfRunning.speed} ms'),
          // IconButton(
          //   onPressed: () => ref.read(isCreatingProvider.notifier).state =
          //       ref.watch(isCreatingProvider) ? false : true,
          //   icon: const Icon(Icons.refresh),
          // ),
        ],
      );
    });

Widget containerZ(BuildContext context) => Consumer(builder: (context, ref, _) {
      final outercontroller = ScrollController();
      final innercontroller = ScrollController();

      final boxList = ref.watch(trackingBox);
      // ignore: unused_local_variable
      final resultPanelListUpdater = ref.watch(trackUpdater);
      return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(cornerSize),
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            )),
        clipBehavior: Clip.antiAlias,
        child: Listener(
          onPointerSignal: (event) {
            if (event is PointerScrollEvent) {
              final offset = event.scrollDelta.dy / 2;
              innercontroller.jumpTo(innercontroller.offset + offset);
              outercontroller.jumpTo(outercontroller.offset - offset);
            }
          },
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            controller: innercontroller,
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (int i = 0; i < boxList.length; i++) boxList[i],
            ]),
          ),
        ),
      );
    });

Widget resultPanel(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final stringResult = ref.watch(resultPanelList);
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(cornerSize),
          ),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
        ),
        child: listView(context, stringResult),
      );
    });

ListView listView(BuildContext context, List<ResultBoxBf> trackingTiles) =>
    ListView(
      reverse: false,
      children: [
        for (int i = 0; i < trackingTiles.length; i++)
          trackingTiles[i].build(context),
      ],
    );
