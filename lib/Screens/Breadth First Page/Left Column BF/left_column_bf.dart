import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../Services/List Panel/list_provider.dart';
import 'create_stage.dart';
import 'list_and_button.dart';

// This a the left column of the Breadth First Algorithm page.
Widget leftColumnBf(BuildContext context) => Column(
      children: [
        Expanded(
          child: trackingListAndButton(context),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: algorithmTimeDisplay(
            context,
          ),
        ),
      ],
    );

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

// This is is the left and bottom container counting the time of the algorithm.
Widget algorithmTimeDisplay(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize),
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.0),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
      child: Center(
        child: Text(
          'Κάτι για τους Χρόνους Εκτέλεσης...',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
