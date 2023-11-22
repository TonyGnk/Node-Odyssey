import 'package:flutter/material.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';
import 'Chart BF/center_column_bf.dart';
import 'Stopwatch BF/time.dart';
import 'left_column_bf.dart';

class BreadthFirstAlg extends StatelessWidget {
  const BreadthFirstAlg({super.key});

  @override
  Widget build(BuildContext context) => bodyWithAppBar(
        appBar: appBarBf(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: body(context),
        ),
      );
}

Widget appBarBf(BuildContext context) => const AdaptAppBar(
      filled: false,
      label: 'Αλγόριθμος Πρώτα σε Βάθος',
      showThemeIcon: true,
      showInfoIcon: true,
    );

Widget body(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: leftColumnBf(context),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 14,
          child: centerColumnBf(context),
        ),
      ],
    );

// This a the left column of the Breadth First Algorithm page.
Widget leftColumnBf(BuildContext context) => Column(
      children: [
        Expanded(
          child: trackingListAndButton(context),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: algorithmTimeDisplay(
            context,
          ),
        ),
      ],
    );
