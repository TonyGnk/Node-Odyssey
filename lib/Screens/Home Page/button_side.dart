import 'package:flutter/material.dart';
import '../../Arc/custom_list_tile.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';
//math
import 'dart:math' as math;

import 'modern_caption.dart';

class AlgorithmsGUI extends StatelessWidget {
  const AlgorithmsGUI({super.key});

  @override
  Widget build(BuildContext context) => bodyWithAppBar(
        context: context,
        appBar: appBarBf(context),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: AlgorithmsGUIBody(),
        ),
      );
}

Widget appBarBf(BuildContext context) => AdaptAppBar(
      filled: false,
      label: '',
      showThemeIcon: true,
      showBackButton: true,
      brightness: Theme.of(context).brightness,
      backgroundColor: Colors.transparent,
    );

class AlgorithmsGUIBody extends StatelessWidget {
  const AlgorithmsGUIBody({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Select the desired algorithm', //Επιλέξτε τον επιθυμητό αλγόριθμο
              style: TextStyle(
                fontSize: 27,
                fontFamily: 'AdventoPro',
              ),
            ),
            const SizedBox(height: 42),
            Expanded(child: listButtons(context)),
          ],
        ),
      );

//Widget for the list buttons to go each algorithm screen
  Widget listButtons(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ModernCaption(
            // label: 'Αλγόριθμος Πρώτα σε Πλάτος' in English,
            label: 'Breadth First',
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    body: breadthFirstAlgScreen(),
                  ),
                ),
              );
            },
            icon: Icons.radar_outlined,
          ),
          const SizedBox(height: 12, width: 12),
          ModernCaption(
            // label: 'Αλγόριθμος Πρώτα σε Βάθος' in English,
            label: 'Depth First',
            onTap: () async {},
            icon: Icons.grid_goldenratio,
          ),
          const SizedBox(height: 12, width: 12),
          ModernCaption(
            // label: 'Πρώτα στο καλύτερο' in English,
            label: 'Best First',
            onTap: () async {},
            icon: Icons.filter_tilt_shift_outlined,
          ),
          const SizedBox(height: 12, width: 12),
          ModernCaption(
            // label: 'Α*' in English,
            label: 'A*',
            onTap: () async {},
            icon: Icons.star_border_outlined,
          ),
          // CustomListTile(
          //   label: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Πλάτος',
          //   onTap: () async => Navigator.push(
          //     context,
          //     // push breadthFirstAlgScreen(),
          //     MaterialPageRoute(
          //       builder: (context) => Scaffold(
          //         body: breadthFirstAlgScreen(),
          //       ),
          //     ),
          //   ),
          //   leftIcon: breadthFirstAlgScreen().getIcon,
          //   type: Type.top,
          // ),
          // const Divider(
          //   height: 1,
          //   thickness: 1,
          // ),
          // CustomListTile(
          //   label: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Βάθος',
          //   onTap: () async {},
          //   // Navigator.push(
          //   //   context,
          //   //   _customPageRouteBuilder(
          //   //     const BreadthFirstAlg(),
          //   //   ),
          //   // ),
          //   leftIcon: Icons.grid_goldenratio,
          //   type: Type.none,
          // ),
          // const Divider(
          //   height: 1,
          //   thickness: 1,
          // ),
          // CustomListTile(
          //   label: 'Μετάβαση σε άλλο Αλγόριθμο',
          //   onTap: () async => {},
          //   leftIcon: Icons.no_encryption_gmailerrorred_rounded,
          //   type: Type.bottom,
          // ),
          // const Expanded(child: SizedBox()),
          // CustomListTile(
          //   label: 'Σύγκριση Αλγορίθμων & Στατιστικά',
          //   onTap: () async => {},
          //   leftIcon: Icons.stacked_line_chart_sharp,
          //   type: Type.top,
          // ),
        ],
      );
}
