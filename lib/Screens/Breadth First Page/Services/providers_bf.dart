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

final trackingContainer = StateProvider<List<TrackingTiles>?>(
  (ref) => [
    TrackingTiles(text: 'ENA', color: Colors.red),
  ],
);

void addTrackingContainer(WidgetRef ref, String text, Color color) {
  ref.read(trackingContainer.notifier).state?.add(
        TrackingTiles(text: text, color: color),
      );
}
