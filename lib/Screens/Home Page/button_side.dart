import 'package:flutter/material.dart';
import '../../Arc/custom_list_tile.dart';
import '../screen_list.dart';

class ButtonsSide extends StatelessWidget {
  const ButtonsSide({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Επιλέξτε τον επιθυμητό αλγόριθμο',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(child: listButtons(context))
          ],
        ),
      );

//Widget for the list buttons to go each algorithm screen
  Widget listButtons(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            CustomListTile(
              label: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Πλάτος',
              onTap: () async => Navigator.push(
                context,
                // push breadthFirstAlgScreen(),
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    body: breadthFirstAlgScreen(),
                  ),
                ),
              ),
              leftIcon: breadthFirstAlgScreen().getIcon,
              type: Type.top,
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            CustomListTile(
              label: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Βάθος',
              onTap: () async {},
              // Navigator.push(
              //   context,
              //   _customPageRouteBuilder(
              //     const BreadthFirstAlg(),
              //   ),
              // ),
              leftIcon: Icons.grid_goldenratio,
              type: Type.none,
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            CustomListTile(
              label: 'Μετάβαση σε άλλο Αλγόριθμο',
              onTap: () async => {},
              leftIcon: Icons.no_encryption_gmailerrorred_rounded,
              type: Type.bottom,
            ),
            const Expanded(child: SizedBox()),
            CustomListTile(
              label: 'Σύγκριση Αλγορίθμων & Στατιστικά',
              onTap: () async => {},
              leftIcon: Icons.stacked_line_chart_sharp,
              type: Type.top,
            ),
          ],
        ),
      );
}
