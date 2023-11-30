import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import 'closed_search.dart';
import 'sliders_and_options_bf.dart';

final makeContainerTallerProvider = StateProvider<bool>((ref) => false);
final showTheExtraOptionsProvider = StateProvider<bool>((ref) => false);

searchBarContainer() => Consumer(builder: (context, ref, _) {
      final moreOptions = ref.watch(makeContainerTallerProvider);
      return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 120),
        height: moreOptions ? 374 : 50,
        padding: const EdgeInsets.all(4),
        decoration: modernDecoration(context),
        child: mainSearchBar(context),
      );
    });

modernDecoration(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(cornerSize),
      color: Theme.of(context).shadowColor,
      border: Border.all(
        width: 1,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0),
      ),
    );

mainSearchBar(BuildContext context) => Column(
      children: [closedSearch(context), extraOptionsBuilder(context)],
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
        const SizedBox(height: 10),
        speedSliderBf(context),
        const SizedBox(height: 4),
        //solutionSliderBf(context),
        checkBoxListTile1(context),
        checkBoxListTile2(context),
        checkBoxListTile3(context),
        checkBoxListTile4(context),
        checkBoxListTile5(context),
        checkBoxListTile6(context),
      ],
    );

//CheckboxListTile
Widget checkBoxListTile1(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final checkedValue = ref.watch(checkPlusOneProvider);
        return CheckboxListTile(
          title: const Text('Πρόσθεση Κατά Ένα'),
          value: checkedValue,
          dense: true,
          onChanged: (newValue) {
            ref.read(checkPlusOneProvider.notifier).state = newValue!;
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );

Widget checkBoxListTile2(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final checkedValue = ref.watch(checkMinusOneProvider);
        return CheckboxListTile(
          title: const Text('Αφαίρεση Κατά Ένα'),
          value: checkedValue,
          dense: true,
          onChanged: (newValue) {
            ref.read(checkMinusOneProvider.notifier).state = newValue!;
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );

Widget checkBoxListTile3(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final checkedValue = ref.watch(checkDoubleProvider);
        return CheckboxListTile(
          dense: true,
          title: const Text('Διπλασιασμός'),
          value: checkedValue,
          onChanged: (newValue) {
            ref.read(checkDoubleProvider.notifier).state = newValue!;
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );

Widget checkBoxListTile4(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final checkedValue = ref.watch(checkHalfProvider);
        return CheckboxListTile(
          title: const Text('Υποδιπλασιασμός'),
          value: checkedValue,
          dense: true,
          onChanged: (newValue) {
            ref.read(checkHalfProvider.notifier).state = newValue!;
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );

Widget checkBoxListTile5(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final checkedValue = ref.watch(checkSquareProvider);
        return CheckboxListTile(
          title: const Text('Τετράγωνο'),
          value: checkedValue,
          dense: true,
          onChanged: (newValue) {
            ref.read(checkSquareProvider.notifier).state = newValue!;
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );

Widget checkBoxListTile6(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final checkedValue = ref.watch(checkRootProvider);
        return CheckboxListTile(
          title: const Text('Ρίζα'),
          value: checkedValue,
          dense: true,
          onChanged: (newValue) {
            ref.read(checkRootProvider.notifier).state = newValue!;
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );

//Provider checkedValue
final checkPlusOneProvider = StateProvider<bool>((ref) => true);
final checkMinusOneProvider = StateProvider<bool>((ref) => true);
final checkDoubleProvider = StateProvider<bool>((ref) => true);
final checkHalfProvider = StateProvider<bool>((ref) => true);
final checkSquareProvider = StateProvider<bool>((ref) => true);
final checkRootProvider = StateProvider<bool>((ref) => true);
