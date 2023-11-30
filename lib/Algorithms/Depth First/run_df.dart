// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
// import '../../Screens/Breadth First Page/Archive BF/result_providers.dart';
// import '../../Services & Providers/node.dart';


// runBF(WidgetRef ref) async {
//   BfRunning running = ref.read(bfRunningProvider.notifier).state;
//   List<Node>? solution = await findBreadthSolutionUI(
//     running.startValue,
//     running.targetValue,
//     running.speed,
//     running.enableCalculationMap,
//     ref,
//   );
//   clearResultPanelList(ref);
//   String solutionTitle = '';

//   if (solution == null) {
//     noSolutions(ref);
//   } else {
//     solutionTitle += 'Λύση';

//     addResultPanelList(
//       ref,
//       solutionTitle,
//       solution,
//     );
//   }
//   ref.watch(stopTimerProvider.notifier).state = true;
//   ref.watch(isAlgorithmEndProviderBf.notifier).state = true;
// }
