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
  int target,
) {
  ref.read(trackingContainer.notifier).state.add(
        TrackingTiles(
          text: text,
        ),
      );
  double a = width / target * 10;
  double bc = (10 - a) / 2;
  ref.read(trackingBox.notifier).state.add(
        Column(
          children: [
            Expanded(
              child: Container(
                width: 10,
                color: Color.fromARGB(255, 231, 77, 77).withOpacity(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: bc.toInt(), child: const SizedBox()),
                    Expanded(
                        flex: a.toInt(),
                        child: Container(color: Colors.grey.withOpacity(0.4))),
                    Expanded(flex: bc.toInt(), child: const SizedBox()),
                  ],
                ),
              ),
            ),
          ],
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

final trackingBox = StateProvider<List<Column>>(
  (ref) => [],
);
