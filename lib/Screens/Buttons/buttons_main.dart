import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screen_list.dart';

import '../Home/ArchHP/modern_caption.dart';
import 'buttons_list.dart';
import 'buttons_state.dart';
import 'button_template.dart';

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
  Widget build(BuildContext context) => Row(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 5,
            child: animatedColumn(columButScrollable()),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      );

  column() => Column(
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
          const SizedBox(height: 42),
          bfButton,
          dfButton,
          bestButton,
          //aStarButton,

          ModernCaption(
            // label: 'Α*' in English,
            label: 'A*',
            onTap: () => buttonGo(ref, ScreenDestination.aStarAlg),
            icon: Icons.star_border_outlined,
          ),
        ],
      );

  columButScrollable() => Column(
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
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              children: const [
                bfButton,
                dfButton,
                bestButton,
                aStarButton,
              ],
            ),
          ),
        ],
      );
}
