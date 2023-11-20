import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Services/List Panel/list_provider.dart';
import '../Services/List Panel/result_providers.dart';
import '../result_box_bf.dart';

Widget centerColumnBf(BuildContext context) => Column(
      children: [
        Expanded(
          child: containerZ(context),
        ),
        SizedBox(
          height: 222,
          child: resultPanel(
            context,
          ),
        ),
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
    });

Widget resultPanel(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final stringResult = ref.watch(resultPanelList);
      //final resultPanelListUpdater = ref.watch(resultPanelListUpdater);
      return Container(
          //height: 300,
          //height: MediaQuery.of(context).size.height - 86,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                //bottomRight: Radius.circular(cornerSize),
                //bottomLeft: Radius.circular(cornerSize),
                //topLeft: Radius.circular(cornerSize),
                //topRight: Radius.circular(cornerSize),
                ),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            border: Border(
              top: BorderSide(
                  width: 1.0,
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.1)),
              bottom: BorderSide(
                width: 1.0,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              left: BorderSide(
                  width: 1.0,
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.1)),
              right: BorderSide(
                width: 1.0,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
            ),
          ),
          child: listView(context, stringResult));
    });

ListView listView(BuildContext context, List<ResultBoxBf> trackingTiles) =>
    ListView(
      reverse: true,
      children: [
        for (int i = trackingTiles.length - 1; i >= 0; i--)
          trackingTiles[i].build(context),
      ],
    );
