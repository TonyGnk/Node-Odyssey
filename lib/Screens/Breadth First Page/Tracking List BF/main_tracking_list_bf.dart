import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Archive BF/list_provider.dart';
import '../main_bf.dart';
import 'create_stage.dart';
import 'list_and_button.dart';

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
TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();

// Αυτή είναι η φόρμα αναζήτησης για την εισαγωγή αρχικής και τελικής τιμής
// Περιλαμβάνει τον τίτλο, πεδία εισαγωγής και ράβδους επιλογής ταχύτητας και λύσεων
Widget form(BuildContext context) => Column(
      children: [
        const SizedBox(height: 8),
        const Text(
          'Νέα Αναζήτηση BF',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        inPutFieldBf(
          context,
          controller1,
          'Εισάγεται Αρχική Τιμή',
        ),
        inPutFieldBf(
          context,
          controller2,
          'Εισάγεται Τελική Τιμή',
        ),
        speedSlider2(context),
        const SizedBox(height: 2),
        solutionSlider2(context),
        Expanded(
          child: Container(),
        ),
        newSubmit2(context),
      ],
    );
