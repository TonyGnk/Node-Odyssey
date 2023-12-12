import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../six_calculations.dart';
import 'closed_search.dart';
import 'sliders_and_options_bf.dart';

final makeContainerTallerProvider = StateProvider<bool>((ref) => false);
final showTheExtraOptionsProvider = StateProvider<bool>((ref) => false);

searchBarContainer(AlgorithmType type) => Consumer(builder: (context, ref, _) {
      final moreOptions = ref.watch(makeContainerTallerProvider);
      return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 120),
        height: moreOptions ? 374 : 50,
        padding: const EdgeInsets.all(4),
        decoration: modernDecoration(context),
        child: mainSearchBar(context, type),
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
        const SizedBox(height: 10),
        speedSliderBf(context),
        const SizedBox(height: 4),
        //solutionSliderBf(context),
        totalCheckBox(context, CalculationType.addition),
        totalCheckBox(context, CalculationType.subtraction),
        totalCheckBox(context, CalculationType.multiplication),
        totalCheckBox(context, CalculationType.division),
        totalCheckBox(context, CalculationType.square),
        totalCheckBox(context, CalculationType.exponential),
      ],
    );

Widget totalCheckBox(BuildContext context, CalculationType type) => Consumer(
      builder: (context, ref, _) {
        final checkedPlus = ref.watch(checkPlusOneProvider);
        final checkedMinus = ref.watch(checkMinusOneProvider);
        final checkedDouble = ref.watch(checkDoubleProvider);
        final checkedHalf = ref.watch(checkHalfProvider);
        final checkedSquare = ref.watch(checkSquareProvider);
        final checkedRoot = ref.watch(checkRootProvider);
        return CheckboxListTile(
          title: Text(
            getCalculationTypeMap()[type]!,
            style: const TextStyle(
              fontFamily: 'Play',
              fontSize: 15,
            ),
          ),
          value: getCheckValue(
            checkedPlus,
            checkedMinus,
            checkedDouble,
            checkedHalf,
            checkedSquare,
            checkedRoot,
            type,
          ),
          dense: true,
          onChanged: (newValue) {
            if (type == CalculationType.addition) {
              ref.read(checkPlusOneProvider.notifier).state = newValue!;
            } else if (type == CalculationType.subtraction) {
              ref.read(checkMinusOneProvider.notifier).state = newValue!;
            } else if (type == CalculationType.multiplication) {
              ref.read(checkDoubleProvider.notifier).state = newValue!;
            } else if (type == CalculationType.division) {
              ref.read(checkHalfProvider.notifier).state = newValue!;
            } else if (type == CalculationType.square) {
              ref.read(checkSquareProvider.notifier).state = newValue!;
            } else if (type == CalculationType.exponential) {
              ref.read(checkRootProvider.notifier).state = newValue!;
            }
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );

getCheckValue(
  bool checkedPlus,
  bool checkedMinus,
  bool checkedDouble,
  bool checkedHalf,
  bool checkedSquare,
  bool checkedRoot,
  CalculationType type,
) {
  if (type == CalculationType.addition) {
    return checkedPlus;
  } else if (type == CalculationType.subtraction) {
    return checkedMinus;
  } else if (type == CalculationType.multiplication) {
    return checkedDouble;
  } else if (type == CalculationType.division) {
    return checkedHalf;
  } else if (type == CalculationType.square) {
    return checkedSquare;
  } else if (type == CalculationType.exponential) {
    return checkedRoot;
  }
}

//Provider checkedValue
final checkPlusOneProvider = StateProvider<bool>((ref) => true);
final checkMinusOneProvider = StateProvider<bool>((ref) => true);
final checkDoubleProvider = StateProvider<bool>((ref) => true);
final checkHalfProvider = StateProvider<bool>((ref) => true);
final checkSquareProvider = StateProvider<bool>((ref) => true);
final checkRootProvider = StateProvider<bool>((ref) => true);

void resetControllers() {
  inputController.clear();
  targetController.clear();
}
