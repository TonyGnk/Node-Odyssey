import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Breadth First/start_calculation.dart';
import '../../../Services & Providers/constants.dart';
import '../Archive BF/list_provider.dart';
import 'main_search_bf.dart';
import 'sliders_and_options_bf.dart';

Widget inPutFieldBf(
  BuildContext context,
  TextEditingController controller,
  String message,
) =>
    Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize - 1),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      ),
      //4 left and right , 12 top and 0 bottom
      padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Center(
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
      ),
    );

Widget submitButtonBf(BuildContext context) => Consumer(
      builder: (_, WidgetRef ref, __) => IconButton.filled(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerSize - 1),
            ),
          ),
        ),
        icon: const Icon(Icons.auto_awesome_outlined),
        onPressed: () => onButtonPressed(ref),
      ),
    );

void onButtonPressed(WidgetRef ref) {
  clearTrackingBox(ref);
  final speedSlider = ref.watch(speedSliderProviderBf);
  startCalR(ref);
  ref.watch(bfRunningProvider.notifier).state = BfRunning(
    startValue: int.parse(inputControllerBf.text),
    targetValue: int.parse(targetControllerBf.text),
    speed: setSpeedFromSlider(speedSlider),
  );
  ref.watch(isCreatingProvider.notifier).state = false;
  ref.watch(bfRunningProviderUpdater.notifier).state =
      !ref.watch(bfRunningProviderUpdater);
  //reset the textcontrollers
  inputControllerBf.clear();
  targetControllerBf.clear();
}

Widget extraButtonBf(BuildContext context) => Consumer(
      builder: (_, WidgetRef ref, __) => IconButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerSize - 1),
              ),
            ),
          ),
          icon: const Icon(Icons.tune_outlined),
          onPressed: () {
            ref.watch(moreOptionsProviderBf.notifier).state =
                !ref.read(moreOptionsProviderBf);
            print('extra button pressed');
          }),
    );
