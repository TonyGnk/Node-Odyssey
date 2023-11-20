import 'package:flutter/material.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import 'Breadth First Parts/appbar_bf.dart';
import 'Breadth First Parts/center_column_bf.dart';
import 'Breadth First Parts/left_column_bf.dart';
import 'Breadth First Parts/right_column_bf.dart';

class BreadthFirstAlg extends StatelessWidget {
  const BreadthFirstAlg({super.key});

  @override
  Widget build(BuildContext context) => bodyWithAppBar(
        appBar: appBar(context),
        body: body(context),
      );

  Widget appBar(BuildContext context) => appBarBf(
        context,
      );

  Widget body(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: c1(context),
          ),
          Expanded(
            flex: 14,
            child: c2(context),
          ),
          Expanded(
            flex: 3,
            child: c3(context),
          ),
        ],
      );
}
