// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'second.dart';
import 'selector.dart';
import 'providers_bf.dart';
import 'tracking_bf.dart';

class BreadthFirstAlg extends StatelessWidget {
  const BreadthFirstAlg({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: trackingListBF(),
            ),
            Expanded(flex: 2, child: const SizedBox())
          ],
        ),
      );
}

startCal(int start, int end, WidgetRef ref) async {
  List<List<Node>> solutions = findSolutions(start, end);
  clearTrackingBF(ref);

  if (solutions.isEmpty) {
    log('Δεν υπάρχουν λύσεις.');
    concatTrackingBF(ref, 'Δεν υπάρχουν λύσεις.');
  } else {
    for (List<Node> solution in solutions) {
      log('Λύση:');
      concatTrackingBF(ref, 'Λύση:');

      for (Node node in solution) {
        log('${node.operation} ${node.value}');
        concatTrackingBF(ref, '${node.operation} ${node.value}');
      }

      log('Συνολικό Κόστος: ${solution.last.cost}');
      concatTrackingBF(ref, 'Συνολικό Κόστος: ${solution.last.cost}');
      log('\n');
      concatTrackingBF(ref, '\n');
    }
  }
}

// Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(20)),
//                 color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
//               ),
//               height: 600,
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: ListView(children: [SelectableText(text)]),
//             ),
//             const SizedBox(height: 20),
//             Selector(ref: ref),


