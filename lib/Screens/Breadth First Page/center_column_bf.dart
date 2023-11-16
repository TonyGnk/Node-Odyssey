import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Services/List Panel/list_provider.dart';
import 'result_panel.dart';

Widget c2(BuildContext context) => Column(
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
      final resultPanelListUpdater = ref.watch(trackUpdater);
      List<String> categorieslist = [
        'Category 1',
        'Category 2',
        'Category 3',
        'Category 4',
        'Category 5',
        'Category 6',
        'Category 7',
        'Category 8',
        'Category 9',
        'Category 10',
        'Category 11',
        'Category 12',
        'Category 13',
        'Category 14',
        'Category 15',
        'Category 16',
        'Category 17',
        'Category 18',
      ];
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
          child: Container(
            child: Row(children: [
              for (int i = 0; i < boxList.length; i++) boxList[i],
            ]),
          ),
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
