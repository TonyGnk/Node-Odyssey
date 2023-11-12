import 'package:flutter/material.dart';

class TrackingTiles {
  TrackingTiles({
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.black,
          child: Text(text),
        ),
      );
}
