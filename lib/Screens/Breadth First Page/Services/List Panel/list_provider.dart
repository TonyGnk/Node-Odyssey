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
}

void addTrackingContainer(
  WidgetRef ref,
  String text,
) {
  ref.read(trackingContainer.notifier).state.add(
        TrackingTiles(
          text: text,
        ),
      );
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
