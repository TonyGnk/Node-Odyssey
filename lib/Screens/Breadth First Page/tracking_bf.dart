import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Services/providers_bf.dart';
import 'Services/tracking_tiles.dart';

Widget trackingListBF() => Consumer(builder: (context, ref, _) {
      final trackingTiles = ref.watch(trackingContainer);
      final tr1 = ref.watch(trackUpdater); // ignore: unused_local_variable
//TODO: change from Container to ListView
      return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          ),
          height: MediaQuery.of(context).size.height - 86,
          child: Container(child: listView(context, trackingTiles)));
    });

ListView listView(BuildContext context, List<TrackingTiles> trackingTiles) =>
    ListView(
      reverse: true,
      children: [
        for (int i = trackingTiles.length - 1; i >= 0; i--)
          trackingTiles[i].build(context),
      ],
    );
