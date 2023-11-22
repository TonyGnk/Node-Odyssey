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
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Services/List Panel/list_provider.dart';
import '../../Screens/Breadth First Page/Services/List Panel/result_providers.dart';
import 'algorithm_bf.dart';

startCalR(WidgetRef ref) async {
//clear the
  ref.watch(trackingListProvider).clear();
  //make stopTimer false
  ref.watch(stopTimerProvider.notifier).state = false;
  BfRunning running = ref.read(bfRunningProvider.notifier).state;
  List<Node>? solution = await findBreadthSolutionUI(
    running.startValue,
    running.targetValue,
    running.speed,
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
  ref.watch(stopTimerProvider.notifier).state = true;
  print('ΤΕΛΟΣ');
}

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
