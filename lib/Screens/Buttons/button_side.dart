import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screen_list.dart';

import '../Home Page/ArchHP/modern_caption.dart';
import 'button_state.dart';

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
  Widget build(BuildContext context) => animatedColumn(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Select the desired algorithm',
              style: TextStyle(
                fontSize: 27,
                fontFamily: 'AdventoPro',
              ),
            ),
            const SizedBox(height: 42),
            listButtons(context),
            Expanded(
              child: listOfChecks(),
            ),
          ],
        ),
      );
}

//Widget for the list buttons to go each algorithm screen
Widget listButtons(BuildContext context) => Consumer(
      builder: (context, ref, _) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ModernCaption(
            // label: 'Αλγόριθμος Πρώτα σε Πλάτος' in English,
            label: 'Breadth First',
            onTap: () => buttonGo(ref, ScreenDestination.breadthFirstAlg),
            icon: Icons.radar_outlined,
          ),
          const SizedBox(height: 12, width: 12),
          ModernCaption(
            // label: 'Αλγόριθμος Πρώτα σε Βάθος' in English,
            label: 'Depth First',
            onTap: () => buttonGo(ref, ScreenDestination.depthFirstAlg),
            icon: Icons.grid_goldenratio,
          ),
          const SizedBox(height: 12, width: 12),
          ModernCaption(
            // label: 'Πρώτα στο καλύτερο' in English,
            label: 'Best First',
            onTap: () => buttonGo(ref, ScreenDestination.bestFirstAlg),
            icon: Icons.filter_tilt_shift_outlined,
          ),
          const SizedBox(height: 12, width: 12),
          ModernCaption(
            // label: 'Α*' in English,
            label: 'A*',
            onTap: () async {},
            icon: Icons.star_border_outlined,
          ),
        ],
      ),
    );

Widget listOfChecks() => Consumer(
      builder: (context, ref, _) => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            height: 100,
            child: Center(
              child: Icon(
                Icons.check,
                color: Colors.green,
              ),
            ),
          ),
          SizedBox(height: 12, width: 12),
          SizedBox(
            width: 200,
            height: 100,
            child: Center(
              child: Icon(
                Icons.check,
                color: Colors.green,
              ),
            ),
          ),
          SizedBox(height: 12, width: 12),
          SizedBox(
            width: 200,
            height: 100,
            child: Center(
              child: Icon(
                Icons.check,
                color: Colors.green,
              ),
            ),
          ),
          SizedBox(height: 12, width: 12),
          SizedBox(
            width: 200,
            height: 100,
            child: Center(
              child: Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
