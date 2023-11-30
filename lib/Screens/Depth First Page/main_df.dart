import 'package:flutter/material.dart';

import '../../Algorithms/Depth First/algorithm_df.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';

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

Widget body(BuildContext context) => Center(
      child: ElevatedButton(
        child: const Text('Πειράματα σε Τερματικό'),
        onPressed: () {
          StartSearching(2, 113);
        },
      ),
    );


// Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         leftColumnDf(context),
//         const SizedBox(width: 10),
//         Expanded(
//           flex: 14, //14
//           child: chartDF(context),
//         ),
//       ],
//     );
