import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/public_left_column.dart';
import '../Breadth First Page/Chart BF/chart_bf.dart';
import 'state_df.dart';

class BodyDf extends ConsumerStatefulWidget {
  const BodyDf({super.key});

  @override
  ConsumerState<BodyDf> createState() => _TerminalSideState();
}

class _TerminalSideState extends ConsumerState<BodyDf> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      dfReturn(ref);
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
