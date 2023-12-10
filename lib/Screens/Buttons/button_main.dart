import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screen_list.dart';

import '../Home/ArchHP/modern_caption.dart';
import 'button_state.dart';
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
          Expanded(
            child: animatedColumn(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Expanded(
                    child: buttonDestinationsTemplate('Breadth First'),
                  ),
                  ModernCaption(
                    label: 'Breadth First',
                    onTap: () =>
                        buttonGo(ref, ScreenDestination.breadthFirstAlg),
                    icon: Icons.radar_outlined,
                  ),
                  ModernCaption(
                    // label: 'Αλγόριθμος Πρώτα σε Βάθος' in English,
                    label: 'Depth First',
                    onTap: () => buttonGo(ref, ScreenDestination.depthFirstAlg),
                    icon: Icons.grid_goldenratio,
                  ),
                  ModernCaption(
                    // label: 'Πρώτα στο καλύτερο' in English,
                    label: 'Best First',
                    onTap: () => buttonGo(ref, ScreenDestination.bestFirstAlg),
                    icon: Icons.filter_tilt_shift_outlined,
                  ),
                  ModernCaption(
                    // label: 'Α*' in English,
                    label: 'A*',
                    onTap: () => buttonGo(ref, ScreenDestination.aStarAlg),
                    icon: Icons.star_border_outlined,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
