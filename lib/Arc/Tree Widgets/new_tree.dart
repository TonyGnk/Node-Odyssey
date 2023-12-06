import 'package:flutter/material.dart';

import 'tree1.dart';

//Create a const variable width 30
const double nodeWidth = 30;

class NewTree extends StatelessWidget {
  const NewTree({super.key});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.03),
        child: const NewLeaf(),
      );
}

class NewLeaf extends StatelessWidget {
  const NewLeaf({super.key});

  @override
  Widget build(BuildContext context) => Column(children: [row1()]);
}
