import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../tracking_tiles.dart';

final trackingContainer = StateProvider<List<TrackingTiles>>(
  (ref) => [
    TrackingTiles(
      text: '',
    ),
  ],
);

void clearTrackingContainer(WidgetRef ref) {
  ref.read(trackingContainer.notifier).state = [
    TrackingTiles(
      text: '',
    ),
  ];
  ref.read(trackingBox.notifier).state = [];
}

void addTrackingContainer(
  WidgetRef ref,
  String text,
  int width,
) {
  ref.read(trackingContainer.notifier).state.add(
        TrackingTiles(
          text: text,
        ),
      );
  ref.read(trackingBox.notifier).state.add(Container(
        width: 6,
        height: width.toDouble() / 2,
        color: Colors.grey.withOpacity(0.2),
      ));
}

final trackUpdater = StateProvider<TrackingTiles>(
  (ref) => TrackingTiles(
    text: '',
  ),
);

void addTrackingContainerRolling(
  WidgetRef ref,
  String text,
) {
  ref.read(trackUpdater.notifier).state = TrackingTiles(
    text: text,
  );
}

final trackingBox = StateProvider<List<Container>>(
  (ref) => [],
);
