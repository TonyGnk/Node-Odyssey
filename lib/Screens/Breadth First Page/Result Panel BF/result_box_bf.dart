import 'package:flutter/material.dart';

import '../../../Algorithms/Breadth First/algorithm_bf.dart';

class ResultBoxBf {
  ResultBoxBf({
    required this.solution,
    this.title = '',
  });

  final String title;
  final List<Node> solution;

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
                    for (int i = 0; i < solution.length; i++)
                      Text(
                        'Τιμή ${solution[i].value} | Πράξη ${solution[i].operation} ',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            costPartBf(),
          ],
        ),
      );

  Row costPartBf() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            solution.last.cost.toString(),
            style: const TextStyle(fontSize: 24),
          ),
          const Text(
            '⚡',
            style: TextStyle(fontSize: 24),
          ),
        ],
      );
}
