import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import 'check_box_search.dart';
import 'closed_search.dart';
import 'sliders_and_options_bf.dart';

final makeContainerTallerProvider = StateProvider<bool>((ref) => false);
final showTheExtraOptionsProvider = StateProvider<bool>((ref) => false);

publicSearchBar(AlgorithmType type) => Consumer(builder: (context, ref, _) {
      final moreOptions = ref.watch(makeContainerTallerProvider);
      return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        height: moreOptions ? 260 : 50,
        padding: const EdgeInsets.all(4),
        decoration: decoration(context),
        child: mainSearchBar(context, type),
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

mainSearchBar(BuildContext context, AlgorithmType type) => Column(
      children: [closedSearch(context, type), extraOptionsBuilder(context)],
    );

void moreOptionsFun(WidgetRef ref) async {
  ref.read(makeContainerTallerProvider.notifier).state = true;
  await Future.delayed(const Duration(milliseconds: 200));
  ref.read(showTheExtraOptionsProvider.notifier).state = true;
}

Widget extraOptionsBuilder(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final moreOptions2 = ref.watch(showTheExtraOptionsProvider);
        return AnimatedOpacity(
          opacity: moreOptions2 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 600),
          child: moreOptions2 ? extraOptions(context) : const SizedBox(),
        );
      },
    );

//Create a widget with 1 column
Widget extraOptions(BuildContext context) => Column(
      children: [
        const SizedBox(height: 12),
        segmentedSpeed(context),
        const SizedBox(height: 8),
        rowOfChecks(context),
        const SizedBox(height: 2),
        customSwitch(),
      ],
    );

void resetControllers() {
  inputController.clear();
  targetController.clear();
}
