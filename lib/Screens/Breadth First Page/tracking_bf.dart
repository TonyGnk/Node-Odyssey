import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Services/providers_bf.dart';

Widget trackingListBF() => Consumer(builder: (context, ref, _) {
      final text = ref.watch(trackingTextBF);
      final trackingTiles = ref.watch(trackingContainer);
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        ),
        height: 600,
        //width: MediaQuery.of(context).size.width * 0.6,
        child: ListView(
          children: [
            for (int i = 0; i < trackingTiles!.length; i++)
              trackingTiles[i].build(context)
          ],
        ),

        //child: ListView(children: [SelectableText(text)]),
      );
    });
