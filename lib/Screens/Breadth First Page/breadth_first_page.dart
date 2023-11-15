// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Services/List Panel/result_providers.dart';
import 'algorithm_bf.dart';
import 'center_column_bf.dart';
import 'left_column_bf.dart';
import 'selector.dart';

class BreadthFirstAlg extends StatelessWidget {
  const BreadthFirstAlg({super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: c1(context),
          ),
          Expanded(
            flex: 15,
            child: c2(context),
          ),
          Expanded(
            flex: 3,
            child: Selector(),
          ),
        ],
      );
}

Column c3() => Column(
      children: [
        const SizedBox(height: 20),
      ],
    );

// startCal(int start, int end, int speed, WidgetRef ref) async {
//   List<List<Node>> solutions = await findBreadthSolutionUI(
//     start,
//     end,
//     speed,
//     ref,
//   );
//   clearTrackingTextBF(ref);

//   if (solutions.isEmpty) {
//     log('Δεν υπάρχουν λύσεις.');
//     addTrackingTextBF(ref, 'Δεν υπάρχουν λύσεις.');
//   } else {
//     for (List<Node> solution in solutions) {
//       log('Λύση:');
//       addTrackingTextBF(ref, 'Λύση:');

//       for (Node node in solution) {
//         log('${node.operation} ${node.value}');
//         addTrackingTextBF(ref, '${node.operation} ${node.value}');
//       }

//       log('Συνολικό Κόστος: ${solution.last.cost}');
//       addTrackingTextBF(ref, 'Συνολικό Κόστος: ${solution.last.cost}');
//       log('\n');
//       addTrackingTextBF(ref, '\n');
//     }
//   }
// }
startCal(int start, int end, int speed, WidgetRef ref) async {
  List<Node>? solution = await findBreadthSolutionUI(
    start,
    end,
    speed,
    ref,
  );
  clearResultPanelList(ref);

  if (solution == null) {
    log('Δεν υπάρχουν λύσεις.');
    addResultPanelList(ref, 'Δεν υπάρχουν λύσεις.');
  } else {
    log('Λύση:');
    addResultPanelList(
      ref,
      'Λύση:',
    );

    for (Node node in solution) {
      log('${node.operation} ${node.value}');
      addResultPanelList(
        ref,
        '${node.operation} ${node.value}',
      );
    }

    log('Συνολικό Κόστος: ${solution.last.cost}');
    addResultPanelList(
      ref,
      'Συνολικό Κόστος: ${solution.last.cost}',
    );
    log('\n');
  }
}
