import 'package:flutter/material.dart';

import '../UI/screen/screen.dart';
import '../UI/screen/stab/stab.dart';
import '../tree.dart';
import 'first.dart';

class Algo1 extends StatelessWidget {
  const Algo1({super.key});

  @override
  RoutedScreen build(BuildContext context) => RoutedScreen(
        mainChild: const TestAlg(),
        label: 'Basic',
        appBar: Stab(true),
        filledIcon: Icons.calculate,
        icon: Icons.calculate_outlined,
      );
}

class Algo2 extends StatelessWidget {
  const Algo2({super.key});

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
