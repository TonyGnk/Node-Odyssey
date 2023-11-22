import 'package:flutter/material.dart';
import '../../../Services & Providers/constants.dart';
import '../Tracking List BF/create_stage.dart';

Widget rightColumnBf(BuildContext context) => Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(cornerSize),
          //bottomLeft: Radius.circular(cornerSize),
        ),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: const Column(
        children: [
          Expanded(
            flex: 4,
            child: SelectStage(),
          ),
        ],
      ),
    );
