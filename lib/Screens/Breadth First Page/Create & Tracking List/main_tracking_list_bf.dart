import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Archive BF/list_provider.dart';
import '../Search BF/main_search_bf.dart';
import '../main_bf.dart';
import 'list_and_button_bf.dart';
import 'sliders_and_options_bf.dart';
import '../Search BF/submit_controls_bf.dart';

Widget trackingListAndButton(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      //final isCreating = ref.watch(isCreatingProvider);
      return containerWithStyleBF(
        Theme.of(context).shadowColor.withOpacity(1),
        Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        TrackingStage(ref: ref),
      );
    });

// Χρήσιμα Στοιχεία
TextEditingController inputControllerBf = TextEditingController();
TextEditingController targetControllerBf = TextEditingController();
