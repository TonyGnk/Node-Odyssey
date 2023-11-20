import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../Services/List Panel/list_provider.dart';
import '../Services/tracking_tiles.dart';

// This a the left column of the Breadth First Algorithm page.
Widget leftColumnBf(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 30,
            child: trackingListConsumerBf(),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 15,
            child: algorithmTimeDisplay(
              context,
            ),
          ),
        ],
      ),
    );

// This is the left container displaying the tracking tiles.
Widget trackingListConsumerBf() => Consumer(builder: (context, ref, _) {
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

// This is the list view of the tracking tiles.
ListView listView(BuildContext context, List<TrackingTiles> trackingTiles) =>
    ListView(
      reverse: true,
      children: [
        for (int i = trackingTiles.length - 1; i >= 0; i--)
          trackingTiles[i].build(context),
      ],
    );

// This is is the left and bottom container counting the time of the algorithm.
Widget algorithmTimeDisplay(BuildContext context) => DecoratedBox(
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
