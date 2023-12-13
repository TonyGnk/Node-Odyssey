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
            onPressed: () => onButtonPressedStep(ref, false),
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
            onPressed: () => onButtonPressedStep(ref, true),
            icon: const Icon(Icons.keyboard_tab_outlined),
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
            onPressed: () => cancelStep(ref),
            icon: const Icon(Icons.block_outlined),
            label: fontText('Exit', 14),
          ),
        ),
      ],
    );
