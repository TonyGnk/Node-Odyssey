// ignore_for_file: prefer_const_literals_to_create_immutables,

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Services/List Panel/result_providers.dart';
import 'Services/create_dialog.dart';
import 'algorithm_bf.dart';
import 'center_column_bf.dart';
import 'left_column_bf.dart';
import 'right_column_bf.dart';

class BreadthFirstAlg extends StatelessWidget {
  BreadthFirstAlg({super.key});

  final TextButton textbutton =
      TextButton(onPressed: () {}, child: const Text('Κλείσιμο'));

  //getter for the textbutton
  TextButton get gettextbutton => textbutton;

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) {
          //add a delay
          Future.delayed(const Duration(milliseconds: 50), () {
            ref.read(textButtonProviderR.notifier).state = TextButton(
              onPressed: () {
                createDialog(context, true);
              },
              child: const Text('Νέα Αναζήτηση'),
            );
          });
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: c1(context),
                ),
                Expanded(
                  flex: 14,
                  child: c2(context),
                ),
                Expanded(
                  flex: 3,
                  child: c3(context),
                ),
              ],
            ),
          );
        },
      );
}

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
  String solutionTitle = '';
  String solutionText = '';
  String solutionCost = '';

  if (solution == null) {
    addResultPanelList(ref, 'Δεν υπάρχουν λύσεις.', '', '', true);
  } else {
    solutionTitle += 'Λύση';

    for (Node node in solution) {
      solutionText += '${node.operation} ${node.value}';
    }

    solutionCost += '${solution.last.cost}';
    addResultPanelList(ref, solutionTitle, solutionText, solutionCost, false);
  }
}

startCal2(int start, int end, int speed, WidgetRef ref, int sol) async {
  List<List<Node>>? solutions = sol == 2
      ? await findBreadthSolutionsUI2(
          start,
          end,
          speed,
          ref,
        )
      : await findBreadthSolutionsUI3(
          start,
          end,
          speed,
          ref,
        );
  clearResultPanelList(ref);

  if (solutions == null || solutions.isEmpty) {
    addResultPanelList(ref, 'Δεν υπάρχουν λύσεις.', '', '', true);
  } else {
    for (int i = 0; i < solutions.length; i++) {
      String solutionTitle = 'Λύση ${i + 1}';
      String solutionText = '';
      String solutionCost = '';

      for (Node node in solutions[i]) {
        solutionText += '${node.operation} ${node.value} ';
      }

      solutionCost += '${solutions[i].last.cost}';
      addResultPanelList(ref, solutionTitle, solutionText, solutionCost, false);
    }
  }
}

//Create a function take a String
