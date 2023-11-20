import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Breadth First/start_calculation.dart';
import '../../../Services & Providers/constants.dart';
import '../Services/List Panel/list_provider.dart';

class Selector2 extends StatefulWidget {
  const Selector2({super.key});

  @override
  State<Selector2> createState() => _SelectorState();
}

class _SelectorState extends State<Selector2> {
  late TextEditingController controller1 = TextEditingController();
  late TextEditingController controller2 = TextEditingController();

  double currentSliderValue = 100;
  double currentSliderValue2 = 1.0;

  @override
  Widget build(BuildContext context) =>
      Consumer(builder: (_, WidgetRef ref, __) {
        //  final isCreating = ref.watch(isCreatingProvider);
        return Container(
          child: Column(
            children: [
              container1(context),
              container2(context),
              speedSlider(context),
              const SizedBox(height: 2),
              solutionSlider(context),
              submit(context, ref),
              //createButtonArea(context),
            ],
          ),
        );
      });

  Widget container1(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        margin: const EdgeInsets.all(2),
        width: 200,
        //height: 38,
        child: TextField(
          controller: controller1,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Εισάγεται Αρχική Τιμή',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      );

  Widget container2(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        margin: const EdgeInsets.all(2),
        width: 200,
        child: TextField(
          controller: controller2,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Εισάγεται Τελική Τιμή',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      );

  Widget submit(BuildContext context, WidgetRef ref) => ElevatedButton.icon(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(200, 55)),
          //corners
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        label: const Text('Εκτέλεση'),
        onPressed: () {
          ref.read(isCreatingProvider.notifier).state = false;
          Future.delayed(const Duration(milliseconds: 100), () {
            ref.read(trackingContainer).clear();
            clearTrackingContainer(ref);
            currentSliderValue2 == 1.0
                ? startCal(
                    int.parse(controller1.text),
                    int.parse(controller2.text),
                    speedToMillisecond(currentSliderValue),
                    ref,
                  )
                : startCal2(
                    int.parse(controller1.text),
                    int.parse(controller2.text),
                    speedToMillisecond(currentSliderValue),
                    ref,
                    currentSliderValue2.toInt(),
                  );
          });
        },
        icon: const Icon(Icons.send),
      );

  Widget speedSlider(BuildContext context) => Column(
        children: [
          const Text('Ταχύτητα Εκτέλεσης'),
          Slider(
            value: currentSliderValue,
            max: 100,
            divisions: 10,
            label: speed(currentSliderValue),
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
            onChanged: (double value) {
              setState(() {
                currentSliderValue2 = value;
              });
            },
          ),
        ],
      );

  //Create a function which returns a String. Takes a double. If 0 returns slow, 10 returns medium, 20 returns fast.
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

//Create Button Area
  Widget createButtonArea(BuildContext context) => Consumer(
        builder: (context, ref, _) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornerSize - 1),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    //update the final isCreating = ref.watch(isCreatingProvider); to false
                    ref.watch(isCreatingProvider.notifier).state = false;

                    ref.read(trackingContainer).clear();
                    clearTrackingContainer(ref);
                    currentSliderValue2 == 1.0
                        ? startCal(
                            int.parse(controller1.text),
                            int.parse(controller2.text),
                            speedToMillisecond(currentSliderValue),
                            ref,
                          )
                        : startCal2(
                            int.parse(controller1.text),
                            int.parse(controller2.text),
                            speedToMillisecond(currentSliderValue),
                            ref,
                            currentSliderValue2.toInt(),
                          );
                  },
                  child: const Text(
                    'Εκτέλεση',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
