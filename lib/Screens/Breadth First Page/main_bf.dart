import 'package:flutter/material.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import 'appbar_bf.dart';
import 'center_column_bf.dart';
import 'left_column_bf.dart';
import 'Archive BF/right_column_bf.dart';

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
          // Expanded(
          //   flex: 3,
          //   child: rightColumnBf(context),
          // ),
        ],
      );
}
