import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Breadth First/providers_bf.dart';
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
        onPressed: () => onButtonPressed(context, ref),
      ),
    );

void onButtonPressed(BuildContext context, WidgetRef ref) {
  clearTrackingBox(ref);
  ref.read(isAlgorithmEndProviderBf.notifier).state = false;
  final speedSlider = ref.watch(speedSliderProviderBf);

  ref.watch(bfRunningProvider.notifier).state = BfRunning(
    startValue: int.parse(inputControllerBf.text),
    targetValue: int.parse(targetControllerBf.text),
    speed: setSpeedFromSlider(speedSlider),
    checkOnePlus: ref.watch(checkPlusOneProvider),
    checkOneMinus: ref.watch(checkMinusOneProvider),
    checkDouble: ref.watch(checkDoubleProvider),
    checkHalf: ref.watch(checkHalfProvider),
    checkSquare: ref.watch(checkSquareProvider),
    checkRoot: ref.watch(checkRootProvider),
  );
  startCalR(context, ref);
  ref.watch(isCreatingProvider.notifier).state = false;
  ref.watch(bfRunningProviderUpdater.notifier).state =
      !ref.watch(bfRunningProviderUpdater);

  //Reset the Input Fields
  inputControllerBf.clear();
  targetControllerBf.clear();
}

Widget extraButtonBf(BuildContext context) =>
    Consumer(builder: (_, WidgetRef ref, __) {
      final moreOptions = ref.watch(moreOptionsProviderBf);
      final moreOptions2 = ref.watch(moreOptionsProviderBf2);
      return IconButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerSize - 1),
              ),
            ),
          ),
          icon: moreOptions
              ? const Icon(Icons.close)
              : const Icon(Icons.tune_outlined),
          onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 150));
            moreOptions
                ? {
                    ref.watch(moreOptionsProviderBf.notifier).state = false,
                  }
                : moreOptionsFun(ref);
            moreOptions2
                ? ref.read(moreOptionsProviderBf2.notifier).state = false
                : null;
            print('extra button pressed');
          });
    });

Widget closeExtraButtonBf(BuildContext context) => Consumer(
    builder: (_, WidgetRef ref, __) => IconButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerSize - 1),
            ),
          ),
        ),
        icon: const Icon(Icons.close),
        onPressed: () async {
          await Future.delayed(const Duration(milliseconds: 150));
          ref.watch(moreOptionsProviderBf.notifier).state = false;
          ref.read(moreOptionsProviderBf2.notifier).state = false;
        }));
