import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Archive BF/list_provider.dart';
import '../main_bf.dart';
import 'list_and_button_bf.dart';
import 'sliders_and_options_bf.dart';
import 'submit_controls_bf.dart';

Widget trackingListAndButton(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final isCreating = ref.watch(isCreatingProvider);
      return containerWithStyleBF(
        Theme.of(context).shadowColor.withOpacity(1),
        Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        isCreating ? form(context) : TrackingStage(ref: ref),
      );
    });

// Χρήσιμα Στοιχεία
TextEditingController inputControllerBf = TextEditingController();
TextEditingController targetControllerBf = TextEditingController();

// Αυτή είναι η φόρμα αναζήτησης για την εισαγωγή αρχικής και τελικής τιμής
// Περιλαμβάνει τον τίτλο, πεδία εισαγωγής και ράβδους επιλογής ταχύτητας και λύσεων
Widget form(BuildContext context) => Column(
      children: [
        const SizedBox(height: 8),
        const Text(
          'Νέα Αναζήτηση',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        inPutFieldBf(
          context,
          inputControllerBf,
          'Εισάγεται Αρχική Τιμή',
        ),
        inPutFieldBf(
          context,
          targetControllerBf,
          'Εισάγεται Τελική Τιμή',
        ),
        speedSliderBf(context),
        const SizedBox(height: 2),
        solutionSliderBf(context),
        Expanded(
          child: Container(),
        ),
        submitButtonBf(context),
      ],
    );
