import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Algorithms/Breadth First/providers_bf.dart';
import '../../Algorithms/Depth First/algorithm_df.dart';
import '../../Services & Providers/Public Search Bar/main_search_bf.dart';
import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../Breadth First Page/Chart BF/chart_bf.dart';
import '../Breadth First Page/Create & Tracking List/list_and_button_bf.dart';
import '../Breadth First Page/Result Panel BF/result_panel_bf.dart';
import '../Breadth First Page/main_bf.dart';

class DepthFirstAlg extends StatelessWidget {
  const DepthFirstAlg({super.key});

  @override
  Widget build(BuildContext context) => bodyWithAppBar(
        context: context,
        appBar: appBarDf(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: body(context),
        ),
      );
}

Widget appBarDf(BuildContext context) => AdaptAppBar(
      filled: false,
      label: 'Αλγόριθμος Πρώτα σε Βάθος',
      showThemeIcon: true,
      showInfoIcon: false,
      brightness: Theme.of(context).brightness,
      backgroundColor: Colors.transparent,
    );

// Αυτή είναι το κεντρικό σώμα της οθόνης
// Περιλαμβάνει την αριστερή και την δεξιά στήλη
Widget body(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        leftColumnBf(context),
        const SizedBox(width: 10),
        Expanded(
          flex: 14, //14
          child: containerZ(context),
        ),
      ],
    );

Widget leftColumnBf(BuildContext context) => SizedBox(
      width: 330,
      child: Column(
        children: [
          searchBarContainer(AlgorithmType.df),
          const SizedBox(height: 10),
          Expanded(
            child: trackingListAndButton(context),
          ),
        ],
      ),
    );

Widget trackingListAndButton(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final isAlgorithmEnd = ref.watch(isAlgorithmEndProviderBf);
        return containerWithStyleBF(
          Theme.of(context).shadowColor.withOpacity(1),
          Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          isAlgorithmEnd ? resultPanel(context) : trackingStage(context),
        );
      },
    );
