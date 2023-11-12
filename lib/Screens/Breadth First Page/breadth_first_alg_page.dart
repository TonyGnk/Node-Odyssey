import 'package:flutter/material.dart';

import '../../UI/screen/screen.dart';
import '../../UI/screen/stab/stab.dart';
import '../../tree.dart';
import '../../logic/first.dart';

class BreadthFirstAlg extends StatelessWidget {
  const BreadthFirstAlg({super.key});

  @override
  RoutedScreen build(BuildContext context) => RoutedScreen(
        mainChild: const Algo1z(),
        label: 'Basic',
        appBar: Stab(true),
        filledIcon: Icons.calculate,
        icon: Icons.calculate_outlined,
      );
}

class Algo1z extends StatelessWidget {
  const Algo1z({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        // appBar: AppBar(
        //   title: const Text('Κατασκευή Δέντρου'),
        //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Tree()],
        ),
      );
}

class TestAlg extends StatelessWidget {
  const TestAlg({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Δοκιμή'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [First()],
        ),
      );
}