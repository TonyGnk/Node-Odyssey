import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../Services/List Panel/list_provider.dart';

class SelectStage extends StatefulWidget {
  const SelectStage({super.key});

  @override
  State<SelectStage> createState() => _SelectorState();
}

class _SelectorState extends State<SelectStage> {
  late TextEditingController controller1 = TextEditingController();
  late TextEditingController controller2 = TextEditingController();

  double currentSliderValue = 100;
  double currentSliderValue2 = 1.0;

  @override
  Widget build(BuildContext context) => Consumer(
      builder: (_, WidgetRef ref, __) => Column(
            children: [
              const SizedBox(height: 8),
              const Text(
                'Νέα Αναζήτηση',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              customFieldBf(
                controller1,
                'Εισάγεται Αρχική Τιμή',
              ),
              customFieldBf(
                controller2,
                'Εισάγεται Τελική Τιμή',
              ),
              speedSlider(context),
              const SizedBox(height: 2),
              solutionSlider(context),
              Expanded(
                child: Container(),
              ),
              newSubmit(context),
            ],
          ));

  Widget newSubmit(BuildContext context) => Consumer(
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
                onPressed: () {
                  ref.watch(bfRunningProvider.notifier).state = BfRunning(
                    startValue: int.parse(controller1.text),
                    targetValue: int.parse(controller2.text),
                  );
                  ref.watch(isCreatingProvider.notifier).state = false;
                  ref.watch(bfRunningProviderUpdater.notifier).state =
                      !ref.watch(bfRunningProviderUpdater);
                },
              ),
            ),
          ],
        ),
      );

  Widget speedSlider(BuildContext context) => Column(
        children: [
          const Text('Ταχύτητα Εκτέλεσης'),
          Slider(
            value: currentSliderValue,
            max: 100,
            divisions: 10,
            label: speed(currentSliderValue),
            thumbColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).colorScheme.secondary,
            onChanged: (double value) {
              setState(() {
                currentSliderValue = value;
              });
            },
          ),
        ],
      );

  Widget solutionSlider(BuildContext context) => Column(
        children: [
          const Text('Πλήθος Λύσεων'),
          const Text('Μη διαθέσιμο'),
          Slider(
            value: currentSliderValue2,
            min: 1,
            max: 3,
            divisions: 2,
            label: currentSliderValue2.toInt().toString(),
            thumbColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).colorScheme.secondary,
            onChanged: (double value) {
              setState(() {
                currentSliderValue2 = value;
              });
            },
          ),
        ],
      );

  String speed(double currentSliderValue) {
    if (currentSliderValue == 0) {
      return '1 sec';
    } else if (currentSliderValue == 10) {
      return '900 millisec';
    } else if (currentSliderValue == 20) {
      return '800 millisec';
    } else if (currentSliderValue == 30) {
      return '700 millisec';
    } else if (currentSliderValue == 40) {
      return '600 millisec';
    } else if (currentSliderValue == 50) {
      return '500 millisec';
    } else if (currentSliderValue == 60) {
      return '400 millisec';
    } else if (currentSliderValue == 70) {
      return '300 millisec';
    } else if (currentSliderValue == 80) {
      return '200 millisec';
    } else if (currentSliderValue == 90) {
      return '100 millisec';
    } else {
      return '1 millisec';
    }
  }

  int speedToMillisecond(double currentSliderValue) {
    if (currentSliderValue == 0) {
      return 1000;
    } else if (currentSliderValue == 10) {
      return 900;
    } else if (currentSliderValue == 20) {
      return 800;
    } else if (currentSliderValue == 30) {
      return 700;
    } else if (currentSliderValue == 40) {
      return 600;
    } else if (currentSliderValue == 50) {
      return 500;
    } else if (currentSliderValue == 60) {
      return 400;
    } else if (currentSliderValue == 70) {
      return 300;
    } else if (currentSliderValue == 80) {
      return 200;
    } else if (currentSliderValue == 90) {
      return 100;
    } else {
      return 1;
    }
  }

  Widget customFieldBf(
    TextEditingController controller,
    String message,
  ) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize),
          color: Theme.of(context).colorScheme.primary.withOpacity(0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        //margin: const EdgeInsets.all(2),
        //width: 200,
        //height: 38,
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
}
