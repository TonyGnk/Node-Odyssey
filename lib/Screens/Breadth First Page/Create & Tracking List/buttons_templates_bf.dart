import 'package:flutter/material.dart';

import '../../../Services/constants.dart';

FilledButton trackingFilledButtonBf(
  BuildContext context,
  String label,
  IconData icon,
  Function() onPressed,
) =>
    FilledButton.icon(
      label: Text(label),
      icon: Icon(icon),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.secondary,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerSize - 1),
          ),
        ),
      ),
      onPressed: onPressed,
    );
