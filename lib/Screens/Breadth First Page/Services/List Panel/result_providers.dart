import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../tracking_tiles.dart';

final resultPanelList = StateProvider<List<TrackingTiles>>(
  (ref) => [],
);

void clearResultPanelList(WidgetRef ref) {
  ref.read(resultPanelList.notifier).state = [];
}

void addResultPanelList(
  WidgetRef ref,
  String text,
) {
  List<TrackingTiles>? list = ref.watch(resultPanelList);
  if (list == null) {
    ref.read(resultPanelList.notifier).state = [
      TrackingTiles(
        text: text,
      ),
    ];
  } else {
    ref.read(resultPanelList.notifier).state.add(
          TrackingTiles(
            text: text,
          ),
        );
  }
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
