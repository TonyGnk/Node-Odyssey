import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../../../Services & Providers/tracking_container.dart';
import '../Archive BF/list_provider.dart';

final outercontroller = ScrollController();
final innercontroller = ScrollController();

Widget containerZ(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final boxList = ref.watch(chartColumnsProvider);
        // ignore: unused_local_variable
        final resultPanelListUpdater = ref.watch(trackUpdater);
        return chartContainer(
          context,
          Row(
            children: [
              chartLabelsColumn(context),
              Expanded(child: chartLister(boxList)),
            ],
          ),
        );
      },
    );

Widget chartContainer(BuildContext context, Widget child) => Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(cornerSize),
          ),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          )),
      clipBehavior: Clip.antiAlias,
      child: child,
    );

Widget chartLister(List<Column> boxList) => Listener(
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
    );

Widget chartLabelsColumn(BuildContext context) => SizedBox(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //opposite loop
          for (int i = 4; i >= 0; i--)
            SizedBox(
              child: Center(
                child: Text(
                  '${10 * pow(10, i)}',
                ),
              ),
            ),
        ],
      ),
    );
