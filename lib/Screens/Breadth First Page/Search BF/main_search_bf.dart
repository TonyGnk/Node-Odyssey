import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import 'sliders_and_options_bf.dart';
import 'submit_controls_bf.dart';

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

TextEditingController inputControllerBf = TextEditingController();
TextEditingController targetControllerBf = TextEditingController();

final moreOptionsProviderBf = StateProvider<bool>((ref) => false);

Widget formR(BuildContext context) => searchContainer(
      context,
      Row(
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
          //extraButtonBf(context),
          const SizedBox(width: 3),
          submitButtonBf(context),
        ],
      ),
    );

Widget searchContainer(BuildContext context, Widget child) => AnimatedContainer(
      duration: const Duration(milliseconds: 500),
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
