import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import 'sliders_and_options_bf.dart';
import 'submit_controls_bf.dart';

TextEditingController inputControllerBf = TextEditingController();
TextEditingController targetControllerBf = TextEditingController();

final moreOptionsProviderBf = StateProvider<bool>((ref) => false);
final moreOptionsProviderBf2 = StateProvider<bool>((ref) => false);

void moreOptionsFun(WidgetRef ref) async {
  ref.read(moreOptionsProviderBf.notifier).state = true;
  await Future.delayed(const Duration(milliseconds: 150));
  ref.read(moreOptionsProviderBf2.notifier).state = true;
}

// Αυτή είναι η φόρμα αναζήτησης για την εισαγωγή αρχικής και τελικής τιμής
// Περιλαμβάνει τον τίτλο, πεδία εισαγωγής και ράβδους επιλογής ταχύτητας και λύσεων
Widget formR(BuildContext context) => searchContainer(
      context,
      Column(
        children: [
          basicRow(context),
          extraOptionsBuilder(context),
        ],
      ),
    );

Widget basicRow(BuildContext context) => Consumer(builder: (context, ref, _) {
      final moreOptions = ref.watch(moreOptionsProviderBf);
      final moreOptions2 = ref.watch(moreOptionsProviderBf2);
      return Row(
        children: [
          Expanded(
            child: inPutFieldBf(
              context,
              inputControllerBf,
              'Αρχική Τιμή',
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: inPutFieldBf(
              context,
              targetControllerBf,
              'Τελική Τιμή',
            ),
          ),
          const SizedBox(width: 6),
          extraButtonBf(context),
          const SizedBox(width: 3),
          submitButtonBf(context),
        ],
      );
    });

Widget searchContainer(BuildContext context, Widget child) =>
    Consumer(builder: (context, ref, _) {
      final moreOptions = ref.watch(moreOptionsProviderBf);
      return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 220),
        height: moreOptions ? 220 : 50,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize),
          color: Theme.of(context).shadowColor,
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0),
          ),
        ),
        child: child,
      );
    });

Widget extraOptionsBuilder(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final moreOptions2 = ref.watch(moreOptionsProviderBf2);
        return AnimatedOpacity(
          opacity: moreOptions2
              ? 1.0
              : 0.0, // Ρύθμισε το opacity ανάλογα με το moreOptions2
          duration: const Duration(
              milliseconds: 300), // Ρύθμισε τον χρόνο εμφάνισης/εξαφάνισης
          child: moreOptions2 ? extraOptions(context) : const SizedBox(),
        );
      },
    );

//Create a widget with 1 column
Widget extraOptions(BuildContext context) => Column(
      children: [
        const SizedBox(height: 10),
        speedSliderBf(context),
        const SizedBox(height: 10),
        solutionSliderBf(context),
      ],
    );
