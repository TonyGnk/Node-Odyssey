import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../Archive BF/list_provider.dart';
import 'main_tracking_list_bf.dart';

Widget inPutFieldBf(
  BuildContext context,
  TextEditingController controller,
  String message,
) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize),
        color: Theme.of(context).colorScheme.primary.withOpacity(0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: message,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );

Widget speedSlider2(BuildContext context) => Consumer(
      builder: (_, WidgetRef ref, __) {
        final speedSlider = ref.watch(speedSliderProvider);
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
                //Change the value of speedSliderProvider
                ref.watch(speedSliderProvider.notifier).state = value;
              },
            ),
          ],
        );
      },
    );

String speed(double currentSliderValue) {
  if (currentSliderValue == 0) {
    return '1 sec';
  } else {
    int millisec = 1000 - (currentSliderValue * 10).toInt();
    return '$millisec millisec';
  }
}

//Create a provider for currentSliderValue type double with initial value 100
final speedSliderProvider = StateProvider<double>((ref) => 100);

//Create a provider for currentSliderValue2 type double with initial value 1.0
final solutionSliderProvider = StateProvider<double>((ref) => 1.0);

Widget solutionSlider2(BuildContext context) =>
    Consumer(builder: (_, WidgetRef ref, __) {
      final solutionSlider = ref.watch(solutionSliderProvider);
      return Column(
        children: [
          const Text('Πλήθος Λύσεων'),
          const Text('Μη διαθέσιμο'),
          Slider(
            value: solutionSlider,
            min: 1,
            max: 3,
            divisions: 2,
            label: solutionSlider.toInt().toString(),
            thumbColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).colorScheme.secondary,
            onChanged: (double value) {
              ref.watch(solutionSliderProvider.notifier).state = value;
            },
          ),
        ],
      );
    });

Widget newSubmit2(BuildContext context) => Consumer(
      builder: (_, WidgetRef ref, __) => Row(
        children: [
          Expanded(
            child: FilledButton.icon(
              label: const Text('Εκτέλεση'),
              icon: const Icon(Icons.auto_awesome_outlined),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.secondary,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cornerSize - 1),
                  ),
                ),
              ),
              onPressed: () => onButtonPressed2(ref),
            ),
          ),
        ],
      ),
    );

void onButtonPressed2(WidgetRef ref) {
  final speedSlider = ref.watch(speedSliderProvider);
  ref.watch(bfRunningProvider.notifier).state = BfRunning(
    startValue: int.parse(controller1.text),
    targetValue: int.parse(controller2.text),
    speed: setSpeedFromSlider(speedSlider),
  );
  ref.watch(isCreatingProvider.notifier).state = false;
  ref.watch(bfRunningProviderUpdater.notifier).state =
      !ref.watch(bfRunningProviderUpdater);
}

int setSpeedFromSlider(double currentSliderValue) {
  if (currentSliderValue >= 0 && currentSliderValue <= 90) {
    return 1000 - (currentSliderValue.toInt() * 10);
  } else {
    return 1;
  }
}
