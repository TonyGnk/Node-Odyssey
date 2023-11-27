import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants.dart';

final trackingListProvider = StateProvider<TrackingList>(
  (ref) => TrackingList(),
);

class TrackingList extends StatelessWidget {
  TrackingList({
    super.key,
    this.ref,
    this.reverse = false,
    List<TrackingTiles>? trackingTiles,
  }) : trackingTiles = trackingTiles ?? [];

  final WidgetRef? ref;
  final List<TrackingTiles> trackingTiles;
  final bool reverse;

  @override
  ListView build(BuildContext context) => ListView(
        reverse: reverse,
        children: [
          for (int i = trackingTiles.length - 1; i >= 0; i--)
            trackingTiles[i].build(context),
        ],
      );

  void clear() {
    trackingTiles.clear();
  }

  // void addTile2(int value, String operation, WidgetRef ref) {
  //   trackingTiles.add(
  //     TrackingTiles(
  //       //text: '$operation $value',
  //       value: value,
  //       operation: operation,
  //     ),
  //   );
  //   addTrackingContainerRolling(ref);
  // }

  void addTile(
    int value,
    String operation,
    WidgetRef ref,
  ) {
    trackingTiles.add(
      TrackingTiles(
        //text: '$operation $value',

        value,
        operation,
      ),
    );
    addTrackingContainerRolling(ref);
  }
}

class TrackingTiles2 extends StatefulWidget {
  TrackingTiles2({
    super.key,
    this.value = 0,
    this.operation = '',
  });

  final int value;
  final String operation;

  @override
  State<TrackingTiles2> createState() => _TrackingTilesState();
}

class _TrackingTilesState extends State<TrackingTiles2> {
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
                width: 165,
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
}

class TrackingTiles {
  TrackingTiles(this.value, this.operation);

  final int value;
  final String operation;

  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(cornerSize)),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        ),
        margin: const EdgeInsets.all(5),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded(
              child: Text('  ${operation}'),
            ),
            Container(
              width: 175,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(cornerSize),
                ),
              ),
              child: Center(
                child: Text(
                  getPreviousValue(value, operation) +
                      (operation == 'Αρχική Τιμή' ? '' : ' 🡢 ') +
                      value.toString(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class SemiTrack extends StatelessWidget {
  const SemiTrack({
    super.key,
    this.value = 0,
    this.operation = '',
  });

  final int value;
  final String operation;
  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          margin: const EdgeInsets.all(2),
          width: 90,
          height: 40,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(cornerSize),
            ),
          ),
          child: Center(
            child: Text(
              getPreviousValue(value, operation) +
                  (operation == 'Αρχική Τιμή' ? '' : ' 🡢 ') +
                  value.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}

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

final trackUpdater = StateProvider<bool>((ref) => false);

void addTrackingContainerRolling(WidgetRef ref) {
  ref.watch(trackUpdater.notifier).state = !ref.read(trackUpdater);
}
