import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/six_calculations.dart';
import '../Archive BF/result_providers.dart';

class ResultBoxBf {
  ResultBoxBf({
    required this.solution,
    this.title = '',
  });

  final String title;
  final List<Node> solution;
  String allValuesInOneString = '';

  Widget build(BuildContext context) => Consumer(builder: (context, ref, _) {
        final resList = ref.watch(resListProvider);

        return Container(
          width: 200,
          height: 22,
          child: Column(
            children: [
              Expanded(
                child: resList.build(context),
              ),
            ],
          ),
        );
      });

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

String operationToString(String operation) {
  switch (operation) {
    case 'Πρόσθεση κατά 1':
      return '+ 1 = ';
    case 'Αφαίρεση κατά 1':
      return '- 1 = ';
    case 'Πολ/σιασμός επί 2':
      return '* 2 = ';
    case 'Διαίρεση με 2':
      return '/ 2 = ';
    default:
      return '';
  }
}
