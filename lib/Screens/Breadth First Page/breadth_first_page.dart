import 'package:flutter/material.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import 'Breadth First Parts/appbar_bf.dart';
import 'Breadth First Parts/center_column_bf.dart';
import 'Left Column BF/left_column_bf.dart';
import 'Breadth First Parts/right_column_bf.dart';

class BreadthFirstAlg extends StatelessWidget {
  const BreadthFirstAlg({super.key});

  @override
  Widget build(BuildContext context) => bodyWithAppBar(
        appBar: appBar(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: body(context),
        ),
      );

  Widget appBar(BuildContext context) => appBarBf(
        context,
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
          Expanded(
            flex: 3,
            child: rightColumnBf(context),
          ),
        ],
      );
}
