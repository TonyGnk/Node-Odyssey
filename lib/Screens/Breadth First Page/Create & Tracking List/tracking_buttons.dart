import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Breadth First/start_calculation.dart';
import '../../../Services & Providers/constants.dart';
import '../Archive BF/list_provider.dart';

Widget buttonArea(BuildContext context) => Consumer(
    builder: (context, ref, _) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornerSize - 1),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: repeatButton(context, ref)),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    ref.watch(isCreatingProvider.notifier).state = true;
                  },
                  child: const Text(
                    'Νέα Αναζήτηση',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));

TextButton repeatButton(BuildContext context, WidgetRef ref) => TextButton(
      onPressed: () {
        //add delay 1ms
        startCalR(ref);
      },
      child: const Text(
        'Επανάληψη',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
