import 'package:flutter/material.dart';

import '../../Screens/Best First Search/bsf_state.dart';
import '../../Screens/Breadth First Page/Chart BF/chart_bf.dart';
import 'tree1.dart';
import 'tree10.dart';
import 'tree4.dart';
import 'tree7.dart';
import 'tree_helpler.dart';

//Create a const variable width 30
const double nodeWidth = 20;
const double gapWidth = 1;

class TreeContainer extends StatelessWidget {
  const TreeContainer({super.key});

  @override
  Widget build(BuildContext context) => animatedLeftColumn(
        chartContainer(
          context,
          const NewLeaf(),
        ),
      );
}

class NewLeaf extends StatelessWidget {
  const NewLeaf({super.key});

  @override
  Widget build(BuildContext context) => Column(children: [
        Expanded(flex: 4, child: row00()),
        Expanded(flex: 1, child: row0()),
        Expanded(flex: 1, child: row1()),
        Expanded(flex: 4, child: row2()),
        Expanded(flex: 1, child: row3()),
        Expanded(flex: 1, child: row4()),
        Expanded(flex: 4, child: row5()),
        Expanded(flex: 4, child: row6()),
        Expanded(flex: 4, child: row7()),
        Expanded(flex: 4, child: row8()),
        Expanded(flex: 1, child: row9()),
        Expanded(flex: 1, child: row10()),
        Expanded(flex: 4, child: row11()),
        Expanded(flex: 4, child: row12()),
        Expanded(flex: 4, child: row13()),
        Expanded(flex: 4, child: row14()),
        Expanded(flex: 1, child: row15()),
        Expanded(flex: 1, child: row16()),
        Expanded(flex: 4, child: row17()),
        Expanded(flex: 4, child: row18()),
        Expanded(flex: 4, child: row19()),
      ]);
}
