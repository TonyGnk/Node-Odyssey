import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Services/providers_bf.dart';

Widget trackingListBF() => Consumer(builder: (context, ref, _) {
      final text = ref.watch(trackingTextBF);
      final trackingTiles = ref.watch(trackingContainer);
      // ignore: unused_local_variable
      final tr1 = ref.watch(trackUpdater);

      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        ),
        height: 600,
        //width: MediaQuery.of(context).size.width * 0.6,
        child: ListView(
          reverse: true,
          children: [
            //show the tracking text inverted with for
            for (int i = trackingTiles.length - 1; i >= 0; i--)
              trackingTiles[i].build(context),
            // tr6.build(context),
            // tr5.build(context),
            // tr4.build(context),
            // tr3.build(context),
            // tr2.build(context),
            // tr1.build(context),
          ],
        ),

        //child: ListView(children: [SelectableText(text)]),
      );
    });
