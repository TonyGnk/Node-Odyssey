import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/public_left_column.dart';
import 'Chart BF/chart_bf.dart';
import 'bf_state.dart';

class BreadthFirstAlg extends ConsumerStatefulWidget {
  const BreadthFirstAlg({super.key});

  @override
  ConsumerState<BreadthFirstAlg> createState() => _TerminalSideState();
}

class _TerminalSideState extends ConsumerState<BreadthFirstAlg> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      bfReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          publicLeftColumn(),
          const SizedBox(width: 10),
          Expanded(
            flex: 14, //14
            child: containerZ(),
          ),
        ],
      );
}
