import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tracking_tiles.dart';

final trackingTextBF = StateProvider<String>(
  (ref) => '',
);

void addTrackingTextBF(WidgetRef ref, String text) {
  ref.read(trackingTextBF.notifier).state = '${ref.watch(
    trackingTextBF,
  )}\n$text';
}

void clearTrackingTextBF(WidgetRef ref) {
  ref.read(trackingTextBF.notifier).state = '';
}

final trackingContainer = StateProvider<List<TrackingTiles>>(
  (ref) => [
    TrackingTiles(text: '', color: Colors.transparent),
  ],
);

void clearTrackingContainer(WidgetRef ref) {
  ref.read(trackingContainer.notifier).state = [
    TrackingTiles(text: '', color: Colors.transparent),
  ];
}

void addTrackingContainer(WidgetRef ref, String text, Color color) {
  ref.read(trackingContainer.notifier).state.add(
        TrackingTiles(text: text, color: color),
      );
}

final trackUpdater = StateProvider<TrackingTiles>(
  (ref) => TrackingTiles(text: '', color: Colors.transparent),
);

void addTrackingContainerRolling(WidgetRef ref, String text, Color color) {
  ref.read(trackUpdater.notifier).state =
      TrackingTiles(text: text, color: randomColor());
}

//Create a getter random color
Color randomColor() =>
    Color((0x00FFFFFF & DateTime.now().millisecondsSinceEpoch) |
        0xFF000000); //0xFFFFFFFF
