import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../../../Services & Providers/tracking_container.dart';
import '../Archive BF/list_provider.dart';

Widget containerZ(BuildContext context) => Consumer(builder: (context, ref, _) {
      final isCreating = ref.watch(isCreatingProvider);
      final bfRunning = ref.read(bfRunningProvider.notifier).state;
      final bfRunningUpdater = ref.watch(bfRunningProviderUpdater);
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
