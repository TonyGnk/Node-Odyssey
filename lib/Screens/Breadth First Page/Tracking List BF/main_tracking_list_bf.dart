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
        isCreating ? const SelectStage() : TrackingStage(ref: ref),
      );
    });

// Χρήσιμα Στοιχεία