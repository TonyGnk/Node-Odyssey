import 'package:flutter/material.dart';
import '../../../Services & Providers/constants.dart';

class ResultBoxBf {
  ResultBoxBf({
    required this.text,
    required this.title,
    required this.cost,
  });

  final String title;
  final String text;
  final String cost;

  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(cornerSize)),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      text,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                //color: Colors.black,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '🪙',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  cost,
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ))
          ],
        ),
      );
}
