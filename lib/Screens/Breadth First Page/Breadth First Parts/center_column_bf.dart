import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Services/List Panel/list_provider.dart';
import '../result_panel.dart';

Widget centerColumnBf(BuildContext context) => Column(
      children: [
        Expanded(
          flex: 8,
          child: containerZ(context),
        ),
        Expanded(flex: 3, child: resultPanel(context)),
      ],
    );

Widget containerZ(BuildContext context) => Consumer(builder: (context, ref, _) {
      final outercontroller = ScrollController();
      final innercontroller = ScrollController();

      final boxList = ref.watch(trackingBox);
      // ignore: unused_local_variable
      final resultPanelListUpdater = ref.watch(trackUpdater);
      return Listener(
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
      // Container(
      //   child: ListView(
      //     reverse: false,
      //     scrollDirection: Axis.horizontal,
      //     children: [
      //       for (int i = 0; i < boxList.length; i++) boxList[i].build(context),
      //     ],
      //   ),
      // );
    });
