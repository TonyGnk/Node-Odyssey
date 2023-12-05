import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Algorithms/Breadth First/providers_bf.dart';
import '../../Services & Providers/Public Search Bar/main_search_bf.dart';
import '../../Services & Providers/constants.dart';
import '../Breadth First Page/Chart BF/chart_bf.dart';
import '../Breadth First Page/Create & Tracking List/list_and_button_bf.dart';
import '../Breadth First Page/Result Panel BF/result_panel_bf.dart';
import '../Breadth First Page/main_bf.dart';
import 'df_state.dart';

class BodyDf extends ConsumerStatefulWidget {
  const BodyDf({super.key});

  @override
  ConsumerState<BodyDf> createState() => _TerminalSideState();
}

class _TerminalSideState extends ConsumerState<BodyDf> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      dfReturn(ref);
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

Widget leftColumnBf() => SizedBox(
      width: 330,
      child: Column(
        children: [
          searchBarContainer(AlgorithmType.df),
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
