import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Services & Providers/constants.dart';
import '../Services/List Panel/list_provider.dart';
import '../Services/tracking_tiles.dart';
//          color: Theme.of(context).shadowColor.withOpacity(0.2),

Widget c1(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 30,
            child: trackingListBF(),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 15,
            child: times(
              context,
            ),
          ),
        ],
      ),
    );

Widget trackingListBF() => Consumer(builder: (context, ref, _) {
      final trackingTiles = ref.watch(trackingContainer);
      final tr1 = ref.watch(trackUpdater); // ignore: unused_local_variable
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize),
          color: Theme.of(context).shadowColor.withOpacity(0.2),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
        child: listView(
          context,
          trackingTiles,
        ),
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

Widget times(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
      child: Center(
        child: Text(
          'Κάτι για τους Χρόνους Εκτέλεσης...',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ),
    );
