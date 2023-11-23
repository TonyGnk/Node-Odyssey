import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Algorithms/Breadth First/start_calculation.dart';
import '../../../Services & Providers/constants.dart';
import '../Archive BF/list_provider.dart';
import 'buttons_templates_bf.dart';

Widget buttonArea(BuildContext context) => Consumer(
    builder: (context, ref, _) => Row(
          children: [
            Expanded(
              child: trackingFilledButtonBf(
                context,
                'Νέα Αναζήτηση',
                Icons.search,
                () => ref.watch(isCreatingProvider.notifier).state = true,
              ),
            ),
          ],
        ));

Widget miniAppBar(BuildContext context) => Consumer(builder: (context, ref, _) {
      final startValue =
          ref.read(bfRunningProvider.notifier).state.startValue.toString();
      final targetValue =
          ref.read(bfRunningProvider.notifier).state.targetValue.toString();
      return Row(
        children: [
          //Create an icon button with reset icon
          const SizedBox(width: 8),
          Expanded(child: Text('Αναζήτηση από $startValue σε $targetValue')),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  value: 0.7,
                )),
          ),
          const SizedBox(width: 8),
        ],
      );
    });
