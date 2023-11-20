import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Services/List Panel/list_provider.dart';
import '../Services/tracking_tiles.dart';
//          color: Theme.of(context).shadowColor.withOpacity(0.2),

Widget c1(BuildContext context) => Column(
      children: [
        Expanded(
          flex: 4,
          child: trackingListBF(),
        ),
        const Divider(),
        Expanded(
          flex: 2,
          child: times(),
        ),
      ],
    );

Widget times() => const Center(
      child: Text('Κάτι για τους Χρόνους Εκτέλεσης...'),
    );

Widget trackingListBF() => Consumer(builder: (context, ref, _) {
      final trackingTiles = ref.watch(trackingContainer);
      final tr1 = ref.watch(trackUpdater); // ignore: unused_local_variable
      return listView(
        context,
        trackingTiles,
      );
    });

ListView listView(BuildContext context, List<TrackingTiles> trackingTiles) =>
    ListView(
      reverse: true,
      children: [
        for (int i = trackingTiles.length - 1; i >= 0; i--)
          trackingTiles[i].build(context),
      ],
    );
