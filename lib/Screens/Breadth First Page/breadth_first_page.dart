// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Services/providers_bf.dart';
import 'algorithm_bf.dart';
import 'selector.dart';
import 'tracking_bf.dart';

class BreadthFirstAlg extends StatelessWidget {
  const BreadthFirstAlg({super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: trackingListBF(),
          ),
          Expanded(
            flex: 2,
            child: const SizedBox(),
          ),
          Expanded(
            flex: 2,
            child: Selector(),
          ),
        ],
      );
}

startCal(int start, int end, int speed, WidgetRef ref) async {
  List<List<Node>> solutions = await findBreadthSolutionUI(
    start,
    end,
    speed,
    ref,
  );
  clearTrackingTextBF(ref);

  if (solutions.isEmpty) {
    log('Δεν υπάρχουν λύσεις.');
    addTrackingTextBF(ref, 'Δεν υπάρχουν λύσεις.');
  } else {
    for (List<Node> solution in solutions) {
      log('Λύση:');
      addTrackingTextBF(ref, 'Λύση:');

      for (Node node in solution) {
        log('${node.operation} ${node.value}');
        addTrackingTextBF(ref, '${node.operation} ${node.value}');
      }

      log('Συνολικό Κόστος: ${solution.last.cost}');
      addTrackingTextBF(ref, 'Συνολικό Κόστος: ${solution.last.cost}');
      log('\n');
      addTrackingTextBF(ref, '\n');
    }
  }
}
