import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../tracking_tiles.dart';

final resultPanelList = StateProvider<List<TrackingTiles>>(
  (ref) => [
    TrackingTiles(
      text: '',
    ),
  ],
);

void clearResultPanelList(WidgetRef ref) {
  ref.read(resultPanelList.notifier).state = [
    TrackingTiles(
      text: '',
    ),
  ];
}

void addResultPanelList(
  WidgetRef ref,
  String text,
) {
  ref.read(resultPanelList.notifier).state.add(
        TrackingTiles(
          text: text,
        ),
      );
}

final resultPanelListUpdater = StateProvider<TrackingTiles>(
  (ref) => TrackingTiles(
    text: '',
  ),
);

void addResultPanelListRolling(WidgetRef ref, String text, Color color) {
  ref.read(resultPanelListUpdater.notifier).state = TrackingTiles(
    text: text,
  );
}
