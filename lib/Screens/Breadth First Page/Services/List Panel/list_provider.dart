import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Services & Providers/constants.dart';

final trackingListProvider = StateProvider<TrackingList>(
  (ref) => TrackingList(),
);

class TrackingList extends StatelessWidget {
  TrackingList({
    super.key,
    this.ref,
    List<TrackingTiles>? trackingTiles,
  }) : trackingTiles = trackingTiles ?? [];

  final WidgetRef? ref;
  final List<TrackingTiles> trackingTiles;

  @override
  ListView build(BuildContext context) => ListView(
        reverse: true,
        children: [
          for (int i = trackingTiles.length - 1; i >= 0; i--) trackingTiles[i],
        ],
      );

  void clear() {
    trackingTiles.clear();
  }

  void addTile(int value, String operation) {
    trackingTiles.add(
      TrackingTiles(
        text: '$operation $value',
        value: value,
        operation: operation,
      ),
    );
  }
}

final stopTimerProvider = StateProvider<bool>(
  (ref) => false,
);

final bfRunningProvider = StateProvider<BfRunning>(
  (ref) => BfRunning(
    startValue: 0,
    targetValue: 0,
    speed: 1,
  ),
);

final bfRunningProviderUpdater = StateProvider<bool>(
  (ref) => false,
);

class BfRunning {
  BfRunning({
    required this.startValue,
    required this.targetValue,
    required this.speed,
  });

  //Αρχική Τιμή
  int startValue;

  //Τελική Τιμή
  int targetValue;

  // Speed of the algorithm
  int speed = 1;

  int getStartValue() => startValue;
  void setStartValue(int startValue) {
    this.startValue = startValue;
  }

  int getTargetValue() => targetValue;
  void setTargetValue(int targetValue) {
    this.targetValue = targetValue;
  }

  int getSpeed() => speed;
  void setSpeedFromSlider(double currentSliderValue) {
    if (currentSliderValue >= 0 && currentSliderValue <= 90) {
      speed = 1000 - (currentSliderValue.toInt() * 10);
    } else {
      speed = 1;
    }
  }
}

final isCreatingProvider = StateProvider<bool>(
  (ref) => true,
);

class TrackingTiles extends StatefulWidget {
  const TrackingTiles({
    required this.text,
    super.key,
    this.value = 0,
    this.operation = '',
  });

  final String text;
  final int value;
  final String operation;

  @override
  State<TrackingTiles> createState() => _TrackingTilesState();
}

class _TrackingTilesState extends State<TrackingTiles> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
        onHover: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(cornerSize)),
            color: _isHovering
                ? Theme.of(context).colorScheme.secondary.withOpacity(0.4)
                : Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          ),
          margin: const EdgeInsets.all(5),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Expanded(
                child: Text('  ${widget.operation}'),
              ),
              Container(
                width: 135,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(cornerSize),
                  ),
                ),
                child: Center(
                  child: Text(
                    getPreviousValue(widget.value, widget.operation) +
                        (widget.operation == 'Αρχική Τιμή' ? '' : ' 🡢 ') +
                        widget.value.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  getPreviousValue(int value, String operation) {
    //if (operation == 'Πρόσθεση κατά 1'
    if (operation == 'Πρόσθεση κατά 1') {
      return (value - 1).toString();
    } else if (operation == 'Αφαίρεση κατά 1') {
      return (value + 1).toString();
    } else if (operation == 'Πολ/σιασμός επί 2') {
      return (value ~/ 2).toString();
    } else if (operation == 'Διαίρεση με 2') {
      return (value * 2).toString();
    } else if (operation == 'Τετράγωνο') {
      return sqrt(value).toInt().toString();
    } else if (operation == 'Ρίζα') {
      return pow(value, 2).toInt().toString();
    } else if (operation == 'Αρχική Τιμή') {
      return '';
    } else {
      return 0.toString();
    }
  }
}

//

//

//

//

//

//

//3
void adddTrackingContainer(
  WidgetRef ref,
  String text,
  int width,
  int target,
) {
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
                color: const Color.fromARGB(255, 73, 67, 67).withOpacity(1),
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
