import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import 'Search Call/submit_function_step.dart';
import 'check_box_search.dart';
import 'closed_search.dart';
import 'sliders_and_options_bf.dart';

final makeContainerTallerProvider = StateProvider<bool>((ref) => false);
final showTheExtraOptionsProvider = StateProvider<bool>((ref) => false);
final heightSearchProvider = StateProvider<double>((ref) => 50);

publicSearchBar() => Consumer(builder: (context, ref, _) {
      //final moreOptions = ref.watch(makeContainerTallerProvider);
      final height = ref.watch(heightSearchProvider);
      return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        height: height,
        padding: const EdgeInsets.all(4),
        decoration: decoration(context),
        child: mainSearchBar(context),
      );
    });

decoration(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(cornerSize),
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      border: Border.all(
        width: 1,
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      ),
    );

mainSearchBar(BuildContext context) => Column(
      children: [closedSearch(context), extraOptionsBuilder()],
    );

void moreOptionsFun(WidgetRef ref) async {
  ref.read(heightSearchProvider.notifier).state = 291;
  ref.read(makeContainerTallerProvider.notifier).state = true;
  await Future.delayed(const Duration(milliseconds: 200));
  ref.read(showTheExtraOptionsProvider.notifier).state = true;
}

Widget extraOptionsBuilder() => Consumer(
      builder: (context, ref, _) {
        final moreOptions2 = ref.watch(showTheExtraOptionsProvider);
        return AnimatedOpacity(
          opacity: moreOptions2 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 600),
          child: moreOptions2 ? extraOptions() : const SizedBox(),
        );
      },
    );

Widget extraOptions() => Column(
      children: [
        const SizedBox(height: 12),
        segmentedSpeed(),
        const SizedBox(height: 8),
        rowOfChecks(),
        const SizedBox(height: 2),
        customSwitch(),
        stepRow(),
      ],
    );

void resetControllers() {
  inputController.clear();
  targetController.clear();
}

stepRow() => Consumer(
      builder: (context, ref, _) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              onPressed: () => onButtonPressedFirst(ref),
              icon: const Icon(Icons.play_circle_filled_outlined),
              label: fontText('Run the algorithm in steps', 14),
            ),
          ),
        ],
      ),
    );

fontText(String text, double size) => Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Play',
      ),
    );
