import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Algorithms/Best First/async_bfs.dart';
import '../../Algorithms/Best First/async_bfs_2.dart';
import '../../Algorithms/Breadth First/providers_bf.dart';
import '../../Arc/Tree Widgets/new_tree.dart';
import '../../Arc/container_tree.dart';
import '../../Arc/tree.dart';
import '../../Services & Providers/Public Search Bar/main_search_bf.dart';
import '../../Services & Providers/Public Search Bar/submit_function.dart';
import '../../Services & Providers/constants.dart';
import '../../Services & Providers/node.dart';
import '../Breadth First Page/Archive BF/list_provider.dart';
import '../Breadth First Page/Archive BF/result_providers.dart';
import '../Breadth First Page/Chart BF/chart_bf.dart';
import '../Breadth First Page/Create & Tracking List/list_and_button_bf.dart';
import '../Breadth First Page/Result Panel BF/result_panel_bf.dart';
import '../Breadth First Page/main_bf.dart';
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
          leftColumnBf(),
          const SizedBox(width: 10),
          const Expanded(
            flex: 14, //14
            child: NewTree(),
          ),
          //containerZ(),  ),
        ],
      );
}

// Αυτή είναι η αριστερή στήλη της οθόνης
// Περιλαμβάνει την φόρμα αναζήτησης-οθόνη παρακολούθησης και το χρονόμετρο
Widget leftColumnBf() => SizedBox(
      width: 330,
      child: Column(
        children: [
          searchBarContainer(AlgorithmType.bestf),
          const SizedBox(height: 10),
          Expanded(
            child: trackingListAndButton(),
          ),
          const Text('Experiment'),
          rowButtons(),
        ],
      ),
    );

Widget trackingListAndButton() => Consumer(
      builder: (context, ref, _) {
        final isAlgorithmEnd = ref.watch(isAlgorithmEndProviderBf);
        return containerWithStyleBF(
          Theme.of(context).shadowColor.withOpacity(1),
          Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          isAlgorithmEnd ? resultPanel(context) : trackingStage(context),
        );
      },
    );

rowButtons() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [button1(), button2()],
    );

button1() => Consumer(
      builder: (context, ref, _) => TextButton(
        onPressed: () async {
          //Clear Tracking Panel, Result Panel and Chart
          clearGUI(ref);

          //Collect all the data from the UI
          //ref.watch(runningRequestProvider.notifier).state = saveRequest(ref);
          RunningRequest request = saveRequest(ref);

          //Start the selected algorithm
          ref.read(isAlgorithmEndProviderBf.notifier).state = false; //Started
          List<Node>? solution = runBSFAsync(ref, request);
        },
        child: const Text('Έναρξη σε Βήματα'),
      ),
    );

button2() => Consumer(
      builder: (context, ref, _) => TextButton(
        onPressed: () {
          List<Node>? solution = runBSFAsyncStep(ref, saveRequest(ref));
          if (solution != null) {
            ref.read(isAlgorithmEndProviderBf.notifier).state = true;
            addResultPanelList(ref, solution);
          }
        },
        child: const Text('Επόμενο'),
      ),
    );
