import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';
import 'Archive BF/list_provider.dart';
import 'Tracking List BF/create_stage.dart';
import 'Tracking List BF/list_and_button.dart';

Widget trackingListAndButton(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final isCreating = ref.watch(isCreatingProvider);
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize),
          color: Theme.of(context).shadowColor.withOpacity(1),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: isCreating
            ? const SelectStage()
            : TrackingStage(
                ref: ref,
              ),
      );
    });
