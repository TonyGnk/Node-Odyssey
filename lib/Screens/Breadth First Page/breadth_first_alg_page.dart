import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../logic/second.dart';
import '../../selector.dart';

class TestAlg extends StatelessWidget {
  const TestAlg({super.key});

  @override
  Widget build(BuildContext context) =>
      Consumer(builder: (_, WidgetRef ref, __) {
        String text = ref.watch(textProvider);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              ),
              height: 600,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ListView(children: [
                SelectableText(text)
                //Text(text),
              ]),
            ),
            const SizedBox(height: 20),
            Selector(ref: ref),
          ],
        );
      });
}

startCal(int start, int end, WidgetRef ref) async {
  List<List<Node>> solutions = findSolutions(start, end);
  clearText(ref);

  if (solutions.isEmpty) {
    log('Δεν υπάρχουν λύσεις.');
    addText(ref, 'Δεν υπάρχουν λύσεις.');
  } else {
    for (List<Node> solution in solutions) {
      log('Λύση:');
      addText(ref, 'Λύση:');

      for (Node node in solution) {
        log('${node.operation} ${node.value}');
        addText(ref, '${node.operation} ${node.value}');
      }

      log('Συνολικό Κόστος: ${solution.last.cost}');
      addText(ref, 'Συνολικό Κόστος: ${solution.last.cost}');
      log('\n');
      addText(ref, '\n');
    }
  }
}
