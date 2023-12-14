import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Algorithms/Best First/async_bfs.dart';
import '../../Algorithms/Best First/async_bfs_2.dart';
import '../../Services/Tree Widgets/tree_container.dart';
import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/public_left_column.dart';
import '../../Services/six_calculations.dart';
import '../Breadth First Page/Archive BF/result_providers.dart';
import 'bsf_state.dart';

class BestFirstAlg extends ConsumerStatefulWidget {
  const BestFirstAlg({super.key});

  @override
  ConsumerState<BestFirstAlg> createState() => _TerminalSideState();
}

class _TerminalSideState extends ConsumerState<BestFirstAlg> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      bsfReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          publicLeftColumn(),
          const SizedBox(width: 10),
          const Expanded(
            flex: 14, //14
            child: TreeContainer(),
          ),
        ],
      );
}

rowButtons() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [button1(), button2()],
    );

button1() => Consumer(
      builder: (context, ref, _) => TextButton(
        onPressed: () async {
          //Clear Tracking Panel, Result Panel and Chart
          clearGUI(ref);

          //Start the selected algorithm
          ref.read(isAlgorithmEndProvider.notifier).state = false; //Started
          List<Node>? solution = runBSFAsync(ref);
        },
        child: const Text('Έναρξη σε Βήματα'),
      ),
    );

button2() => Consumer(
      builder: (context, ref, _) => TextButton(
        onPressed: () {
          List<Node>? solution = runBSFAsyncStep(ref);
          if (solution != null) {
            ref.read(isAlgorithmEndProvider.notifier).state = true;
            addResultPanelList(ref, solution);
          }
        },
        child: const Text('Επόμενο'),
      ),
    );
