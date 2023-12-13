import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Search Call/submit_function_step.dart';
import 'main_search.dart';

stepColumn() => Consumer(
      builder: (context, ref, _) => Column(
        children: [
          nextStep(ref),
          runToTheEnd(ref),
          cancel(ref),
        ],
      ),
    );

nextStep(WidgetRef ref) => Row(
      children: [
        Expanded(
          child: TextButton.icon(
            onPressed: () => onButtonPressedStep(ref),
            icon: const Icon(Icons.redo_outlined),
            label: fontText('Next Step', 14),
          ),
        ),
      ],
    );

runToTheEnd(WidgetRef ref) => Row(
      children: [
        Expanded(
          child: TextButton.icon(
            onPressed: () => onButtonPressedStep(ref),
            icon: const Icon(Icons.keyboard_tab_outlined),
            //We are in a step by step search. This button will ovveride the step by step and will go in a single step to the end.
            label: fontText(
              'Run to the end',
              14,
            ),
          ),
        ),
      ],
    );

cancel(WidgetRef ref) => Row(
      children: [
        Expanded(
          child: TextButton.icon(
            onPressed: () => onButtonPressedStep(ref),
            icon: const Icon(Icons.block_outlined),
            label: fontText('Exit', 14),
          ),
        ),
      ],
    );
