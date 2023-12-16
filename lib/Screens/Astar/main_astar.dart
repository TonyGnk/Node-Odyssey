import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Tree Widgets/main_tree.dart';
import '../../Services/public_left_column.dart';
import 'astar_state.dart';

class AStarAlg extends ConsumerStatefulWidget {
  const AStarAlg({super.key});

  @override
  ConsumerState<AStarAlg> createState() => _TerminalSideState();
}

class _TerminalSideState extends ConsumerState<AStarAlg> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      asfReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          publicLeftColumn(),
          const SizedBox(width: 10),
          const Expanded(
            flex: 14, //14
            child: TreeContainer(),
          ),
          //containerZ(),  ),
        ],
      );
}
