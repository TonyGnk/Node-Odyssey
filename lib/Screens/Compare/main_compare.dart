import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/main_search.dart';
import '../../Services/constants.dart';
import 'helper_compare.dart';
import 'state_compare.dart';

class Compare extends ConsumerStatefulWidget {
  const Compare({super.key});

  @override
  ConsumerState<Compare> createState() => _TerminalSideState();
}

class _TerminalSideState extends ConsumerState<Compare> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      compareReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          centerAppBarText('Compare Algorithms'),
          const SizedBox(height: 40),
          row(),
          const SizedBox(height: 16),
          row2(AlgorithmType.breadth),
          const SizedBox(height: 8),
          row2(AlgorithmType.depth),
          const SizedBox(height: 8),
          row2(AlgorithmType.best),
          const SizedBox(height: 8),
          row2(AlgorithmType.astar),
          const Expanded(child: SizedBox()),
        ],
      );

  row() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 380, child: publicSearchBar(true)),
        ],
      );

  row2(AlgorithmType type) => Row(
        children: [
          const Expanded(child: SizedBox()),
          Expanded(
            flex: 5,
            child: compareItem(context, type),
          ),
          const Expanded(child: SizedBox())
        ],
      );
}
