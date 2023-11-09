import 'dart:developer';
import 'package:flutter/material.dart';
import '../UI/Components/Buttons/elevated_button.dart';
import '../UI/Components/List Tiles/list_tile_modifier.dart';
import '../UI/Routes/about_page.dart';
import '../custom_list_tile.dart';
import 'al1.dart';

class ButtonsSide extends StatelessWidget {
  const ButtonsSide({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Create a large label with text 'Πανεπιστημιακή Εργασία Αλγορίθμων 2023-2024'
            const Text(
              'Επιλέξτε τον επιθυμητό αλγόριθμο:',
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
          color: const Color.fromARGB(255, 245, 245, 255),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color.fromARGB(255, 220, 220, 255),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            CustomListTile(
              label: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Βάθος',
              onTap: () async => Navigator.push(
                context,
                _customPageRouteBuilder(
                  const Algo1(),
                ),
              ),
              leftIcon: Icons.calculate_outlined,
              type: Type.top,
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            CustomListTile(
              label: 'Μετάβαση στον Αλγόριθμο Πρώτα σε Πλάτος',
              onTap: () async => Navigator.push(
                context,
                _customPageRouteBuilder(
                  const Algo1(),
                ),
              ),
              leftIcon: Icons.calculate_outlined,
              type: Type.none,
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            CustomListTile(
              label: 'Μετάβαση σε άλλο Αλγόριθμο',
              onTap: () async => Navigator.push(
                context,
                _customPageRouteBuilder(
                  const Algo1(),
                ),
              ),
              leftIcon: Icons.calculate_outlined,
              type: Type.bottom,
            ),
            const Expanded(child: SizedBox()),
            CustomListTile(
              label: 'Μετάβαση σε άλλο Αλγόριθμο',
              onTap: () async => Navigator.push(
                context,
                _customPageRouteBuilder(
                  const Algo1(),
                ),
              ),
              leftIcon: Icons.calculate_outlined,
              type: Type.top,
            ),
          ],
        ),
      );

  PageRouteBuilder _customPageRouteBuilder(Widget page) => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var slideAnimation =
              Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                  .animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          );

          var scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          );

          // Add your new transition here
          var rotateAnimation = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          );

          return SlideTransition(
            position: slideAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: RotationTransition(
                turns: rotateAnimation,
                child: child,
              ),
            ),
          );
        },
      );
}
