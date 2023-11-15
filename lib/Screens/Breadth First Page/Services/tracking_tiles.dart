import 'package:flutter/material.dart';
import '../../../Services & Providers/constants.dart';

class TrackingTiles {
  TrackingTiles({
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(cornerSize)),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        child: Text(text),
      );
}
