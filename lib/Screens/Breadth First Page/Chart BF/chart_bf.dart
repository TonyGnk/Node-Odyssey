// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services/Tree Widgets/container_tree.dart';
import '../../../Services/constants.dart';
import '../../../Services/tracking_container.dart';
import '../../Best First Search/bsf_state.dart';
import '../Archive BF/list_provider.dart';

final outercontroller = ScrollController();
final innercontroller = ScrollController();

Widget containerZ() => Consumer(
      builder: (context, ref, _) {
        final boxList = ref.watch(chartColumnsProvider);
        // ignore: unused_local_variable
        final resultPanelListUpdater = ref.watch(trackUpdater);
        return animatedLeftColumn(
          chartContainer(
            context,
            Row(
              children: [
                chartLabelsColumn(context),
                Expanded(child: chartLister(boxList)),
              ],
            ),
          ),
        );
      },
    );

Widget chartContainer(BuildContext context, Widget child) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        ),
      ),
      padding: const EdgeInsets.all(2),
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
      width: 50,
      child: Column(
        children: [
          Expanded(flex: 13, child: const SizedBox()),
          Text('10^8'),
          Expanded(flex: 11, child: const SizedBox()),
          Text('10^7'),
          Expanded(flex: 12, child: const SizedBox()),
          Text('10^6'),
          Expanded(flex: 10, child: const SizedBox()),
          Text('10^5'),
          Expanded(flex: 11, child: const SizedBox()),
          Text('10^4'),
          Expanded(flex: 11, child: const SizedBox()),
          Text('10^3'),
          Expanded(flex: 12, child: const SizedBox()),
          Text('10^2'),
          Expanded(flex: 10, child: const SizedBox()),
          Text('10^1'),
          Expanded(flex: 7, child: const SizedBox()),
          Text('10^0'),
          Expanded(flex: 3, child: const SizedBox()),
        ],
      ),
    );
