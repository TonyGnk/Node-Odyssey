import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Search Call/submit_function_step.dart';
import 'main_search.dart';

stepColumn() => Consumer(
      builder: (context, ref, _) => Column(
        children: [
          nextStep(ref),
        ],
      ),
    );

nextStep(WidgetRef ref) => Row(
      children: [
        Expanded(
          child: TextButton.icon(
            onPressed: () => onButtonPressedStep(ref),
            icon: const Icon(Icons.next_plan),
            label: fontText('Next Step', 14),
          ),
        ),
      ],
    );
