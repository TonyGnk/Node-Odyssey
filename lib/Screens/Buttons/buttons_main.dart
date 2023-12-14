import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'buttons_list.dart';
import 'buttons_state.dart';

class AlgorithmsGUIBody extends ConsumerStatefulWidget {
  const AlgorithmsGUIBody({super.key});

  @override
  ConsumerState<AlgorithmsGUIBody> createState() => _TerminalSideState();
}

class _TerminalSideState extends ConsumerState<AlgorithmsGUIBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      buttonReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Select the desired algorithm',
            style: TextStyle(
              fontSize: 27,
              fontFamily: 'Play',
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(5),
              children: [row()],
            ),
          ),
        ],
      );

  row() => Row(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 5,
            child: animatedColumn(column()),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      );

  column() => const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          bfButton,
          dfButton,
          bestButton,
          aStarButton,
          compareButton,
        ],
      );
}
