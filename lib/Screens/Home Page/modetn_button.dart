import 'dart:ui';

import 'package:flutter/material.dart';

import '../screen_list.dart';

class theGloriousButton extends StatelessWidget {
  theGloriousButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            // push breadthFirstAlgScreen(),
            MaterialPageRoute(
              builder: (context) => Scaffold(
                body: breadthFirstAlgScreen(),
              ),
            ),
          );
        },
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  width: 340 * MediaQuery.of(context).size.width / 1380,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.2), width: 2.5),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: theColumn(context),
                  ),
                ),
              ),
            )
          ],
        ),
      );

  Widget theColumn(BuildContext context) => const Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 4),
              Icon(
                Icons.radar_outlined,
                size: 30,
              ),
            ],
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Best First Search',
              style: TextStyle(fontSize: 23),
            ),
          ]),
        ],
      );
}
