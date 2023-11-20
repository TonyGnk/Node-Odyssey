import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Services & Providers/constants.dart';

//Create a

//1
final trackingContainer = StateProvider<List<TrackingTiles>>(
  (ref) => [
    TrackingTiles(
      text: '',
    ),
  ],
);

//2
void clearTrackingContainer(WidgetRef ref) {
  ref.read(trackingContainer.notifier).state = [
    TrackingTiles(
      text: '',
    ),
  ];
  ref.read(trackingBox.notifier).state = [];
}

//3
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
  double bc = 10 - a;
  ref.read(trackingBox.notifier).state.add(
        Column(
          children: [
            Expanded(
              child: Container(
                width: 10,
                color: const Color.fromARGB(255, 73, 67, 67).withOpacity(1),
              ),
            ),
            Expanded(
              child: Container(
                width: 10,
                color: const Color.fromARGB(255, 231, 77, 77).withOpacity(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: bc.toInt(), child: const SizedBox()),
                    Expanded(
                        flex: a.toInt(),
                        child: Container(color: Colors.grey.withOpacity(0.4))),
                    //Expanded(flex: bc.toInt(), child: const SizedBox()),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

class TrackingTiles {
  TrackingTiles({
    required this.text,
  });

  final String text;

  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(cornerSize)),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        child: Text(text),
      );
}

//B
final trackUpdater = StateProvider<TrackingTiles>(
  (ref) => TrackingTiles(
    text: '',
  ),
);

//B
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
