import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Algorithms/Best First/async_bfs.dart';
import '../../Algorithms/Best First/async_bfs_2.dart';
import '../../Arc/Tree Widgets/new_tree.dart';
import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/Search Call/submit_function.dart';
import '../../Services/Public Search Bar/main_search.dart';
import '../../Services/constants.dart';
import '../../Services/public_left_column.dart';
import '../../Services/six_calculations.dart';
import '../Breadth First Page/Archive BF/list_provider.dart';
import '../Breadth First Page/Archive BF/result_providers.dart';
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
          const SizedBox(height: 10),
          Expanded(child: rowComp(context)),
          const SizedBox(height: 18),
        ],
      );

  row() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          SizedBox(width: 400, child: publicSearchBar(true)),
          const Expanded(child: SizedBox()),
        ],
      );
}

rowComp(BuildContext context) => Row(
      children: [
        const Expanded(child: SizedBox()),
        Expanded(flex: 3, child: breadthCompare(context)),
        const SizedBox(width: 8),
        Expanded(flex: 3, child: breadthCompare(context)),
        const SizedBox(width: 8),
        Expanded(flex: 3, child: breadthCompare(context)),
        const SizedBox(width: 8),
        Expanded(flex: 3, child: breadthCompare(context)),
        const Expanded(child: SizedBox()),
      ],
    );

breadthCompare(BuildContext context) => templateContainer(
      context,
      const SizedBox(
        //height: 100,
        child: Center(
          child: Text('dd'),
        ),
      ),
    );
