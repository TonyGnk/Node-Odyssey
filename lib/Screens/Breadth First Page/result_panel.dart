import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Services & Providers/constants.dart';
import 'Services/List Panel/result_providers.dart';
import 'Services/tracking_tiles.dart';

Widget resultPanel(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final stringResult = ref.watch(resultPanelList);
      //final resultPanelListUpdater = ref.watch(resultPanelListUpdater);
      return Container(
          //height: 300,
          //height: MediaQuery.of(context).size.height - 86,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(cornerSize),
              //bottomLeft: Radius.circular(cornerSize),
              //topLeft: Radius.circular(cornerSize),
              topRight: Radius.circular(cornerSize),
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

ListView listView(BuildContext context, List<TrackingTiles> trackingTiles) =>
    ListView(
      reverse: true,
      children: [
        for (int i = trackingTiles.length - 1; i >= 0; i--)
          trackingTiles[i].build(context),
      ],
    );
