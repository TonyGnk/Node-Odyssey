import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/constants.dart';

buttonDestinationsTemplate(String title) => Consumer(
      builder: (context, ref, _) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(cornerSize),
        ),
        padding: const EdgeInsets.all(8),
        child: columnTemplate(title),
      ),
    );

columnTemplate(String title) => Column(
      children: [
        titleTemplate(title),
      ],
    );

titleTemplate(String title) => Text(
      title,
    );
