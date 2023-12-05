import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Algorithms/Breadth First/providers_bf.dart';
import '../../Services & Providers/constants.dart';
import 'Chart BF/chart_bf.dart';
import 'Result Panel BF/result_panel_bf.dart';
import '../../Services & Providers/Public Search Bar/main_search_bf.dart';
import 'Create & Tracking List/list_and_button_bf.dart';
import 'bf_state.dart';

class BreadthFirstAlg extends ConsumerStatefulWidget {
  const BreadthFirstAlg({super.key});

  @override
  ConsumerState<BreadthFirstAlg> createState() => _TerminalSideState();
}

class _TerminalSideState extends ConsumerState<BreadthFirstAlg> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      bfReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leftColumnBf(),
          const SizedBox(width: 10),
          Expanded(
            flex: 14, //14
            child: containerZ(),
          ),
        ],
      );
}

// Αυτή είναι η αριστερή στήλη της οθόνης
// Περιλαμβάνει την φόρμα αναζήτησης-οθόνη παρακολούθησης και το χρονόμετρο
Widget leftColumnBf() => SizedBox(
      width: 330,
      child: Column(
        children: [
          searchBarContainer(AlgorithmType.bf),
          const SizedBox(height: 10),
          Expanded(
            child: trackingListAndButton(),
          ),
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

// Κάθε βασικό στοιχείο της οθόνης είναι ένα Container
// Περιλαμβάνει ένα πρότυπο στυλ για τα Container
Container containerWithStyleBF(Color color, Color borderColor, Widget child) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize),
        color: color,
        border: Border.all(
          width: 1,
          color: borderColor.withOpacity(0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
