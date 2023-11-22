import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../Archive BF/list_provider.dart';
import 'main_tracking_list_bf.dart';
import 'sliders_and_options_bf.dart';

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

Widget submitButtonBf(BuildContext context) => Consumer(
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
              onPressed: () => onButtonPressed(ref),
            ),
          ),
        ],
      ),
    );

void onButtonPressed(WidgetRef ref) {
  final speedSlider = ref.watch(speedSliderProviderBf);
  ref.watch(bfRunningProvider.notifier).state = BfRunning(
    startValue: int.parse(inputControllerBf.text),
    targetValue: int.parse(targetControllerBf.text),
    speed: setSpeedFromSlider(speedSlider),
  );
  ref.watch(isCreatingProvider.notifier).state = false;
  ref.watch(bfRunningProviderUpdater.notifier).state =
      !ref.watch(bfRunningProviderUpdater);
}
