import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main_bf.dart';
import 'list_and_button_bf.dart';

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

