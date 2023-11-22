import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../Archive BF/list_provider.dart';

// This is is the left and bottom container counting the time of the algorithm.
Widget algorithmTimeDisplay(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize),
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.0),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
      child: algorithmTime(context),
    );

Widget algorithmTime(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final isCreating = ref.watch(isCreatingProvider);
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize),
          color: Theme.of(context).shadowColor.withOpacity(1),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: isCreating
            ? const Center(child: SizedBox())
            : StopwatchWidget(ref: ref),
      );
    });

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({
    required this.ref,
    super.key, // Fix typo: change super.key to Key key
  });

  final WidgetRef ref;

  @override
  State<StopwatchWidget> createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  int milliseconds = 0;
  int seconds = 0;
  late Timer timer;
  bool isRunning = true;

  @override
  void initState() {
    bool _stopTimer = widget.ref.read(stopTimerProvider.notifier).state;
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      bool _stopTimer = widget.ref.read(stopTimerProvider.notifier).state;
      if (isRunning && !_stopTimer) {
        setState(() {
          milliseconds++;
          if (milliseconds == 1000) {
            milliseconds = 0;
            seconds++;
          }
        });
      }
    });
  }

  void stopTimer() {
    timer.cancel();
  }

  void resumeTimer() {
    startTimer();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$seconds:$milliseconds',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isRunning = !isRunning;
                      if (!isRunning) {
                        stopTimer();
                      } else {
                        resumeTimer();
                      }
                    });
                  },
                  label: Text(isRunning ? 'Stop' : 'Resume'),
                  icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      seconds = 0;
                      milliseconds = 0;
                    });
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      );
}
