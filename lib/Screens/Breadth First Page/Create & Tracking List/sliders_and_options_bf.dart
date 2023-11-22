import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final speedSliderProviderBf = StateProvider<double>((ref) => 100);
final solutionSliderProviderBf = StateProvider<double>((ref) => 1.0);

Widget speedSliderBf(BuildContext context) =>
    Consumer(builder: (_, WidgetRef ref, __) {
      final speedSlider = ref.watch(speedSliderProviderBf);
      return Column(
        children: [
          const Text('Ταχύτητα Εκτέλεσης'),
          Slider(
            value: speedSlider,
            max: 100,
            divisions: 10,
            label: speed(speedSlider),
            thumbColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).colorScheme.secondary,
            onChanged: (double value) {
              ref.watch(speedSliderProviderBf.notifier).state = value;
            },
          ),
        ],
      );
    });

String speed(double currentSliderValue) {
  if (currentSliderValue == 0) {
    return '1 sec';
  } else {
    int millisec = 1000 - (currentSliderValue * 10).toInt();
    return '$millisec millisec';
  }
}

int setSpeedFromSlider(double currentSliderValue) {
  if (currentSliderValue >= 0 && currentSliderValue <= 90) {
    return 1000 - (currentSliderValue.toInt() * 10);
  } else {
    return 1;
  }
}

Widget solutionSliderBf(BuildContext context) =>
    Consumer(builder: (_, WidgetRef ref, __) {
      final solutionSlider = ref.watch(solutionSliderProviderBf);
      return Column(
        children: [
          const Text('Πλήθος Λύσεων'),
          Slider(
            value: solutionSlider,
            min: 1,
            max: 3,
            divisions: 2,
            label:
                solutionSlider != 3 ? solutionSlider.toInt().toString() : '3!',
            thumbColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).colorScheme.secondary,
            onChanged: (double value) {
              ref.watch(solutionSliderProviderBf.notifier).state = value;
            },
          ),
        ],
      );
    });
