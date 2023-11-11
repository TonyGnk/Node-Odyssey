import 'package:flutter/material.dart';

import '../UI/screen/screen.dart';
import '../UI/screen/stab/stab.dart';
import '../tree.dart';

class Algo1 extends StatelessWidget {
  const Algo1({super.key});

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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Δοκιμαστικό Δέντρο'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Tree()],
        ),
      );
}
