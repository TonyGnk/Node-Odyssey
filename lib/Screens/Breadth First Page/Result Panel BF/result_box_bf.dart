import 'package:flutter/material.dart';

class ResultBoxBf {
  ResultBoxBf({
    this.text = '',
    this.title = '',
    this.cost = '',
    this.error = false,
  });

  final String title;
  final String text;
  final String cost;
  final bool error;

  Widget build(BuildContext context) => Container(
        //margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        //color: Colors.black,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    error
                        ? const SizedBox()
                        : Text(
                            text,
                          ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cost,
                  style: const TextStyle(fontSize: 24),
                ),
                const Text(
                  '⚡',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            )
          ],
        ),
      );
}
