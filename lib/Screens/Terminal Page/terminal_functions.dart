import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/constants.dart';
import '../../Services/public_left_column.dart';
import '../../Services/six_calculations.dart';
import 'terminal_providers.dart';

analyzeTheText(WidgetRef ref) {
  //Get the text from the textField
  final text = ref.watch(controllerProvider);

  //Split the text into words and Remove the System32
  List<String> words = text.text.split(' ');
  if (words[0] == system32Text) words.removeAt(0);

  if (words.length < 4) {
    myFocusNode.requestFocus();
    return;
  }

  //Get the algorithmType
  AlgorithmType type = findType(words[1]);

  int startValue = int.parse(words[2]);
  int targetValue = int.parse(words[3]);
  inputController = TextEditingController(text: startValue.toString());
  targetController = TextEditingController(text: targetValue.toString());

  //Start the selected algorithm
  ref.read(isAlgorithmEndProvider.notifier).state = false; //Started
  List<Node>? solution = startAlgorithmTerminal(type);
  ref.read(isAlgorithmEndProvider.notifier).state = true; //Finished

  if (solution != null) newResult(ref, solution);
  if (solution == null) {
    ref.read(terminalContentProvider.notifier).state +=
        '\nNo Solution Found!\n';
    return;
  }
}

AlgorithmType findType(String algorithm) {
  switch (algorithm) {
    case 'breadth':
      return AlgorithmType.breadth;
    case 'depth':
      return AlgorithmType.depth;
    case 'best':
      return AlgorithmType.best;
    case 'astar':
      return AlgorithmType.astar;
    default:
      return AlgorithmType.breadth;
  }
}

newResult(WidgetRef ref, List<Node>? solution) {
  if (solution == null) {
    ref.read(terminalContentProvider.notifier).state +=
        '\nNo Solution Found!\n';
    return;
  }

  //Add the used textField to terminal content
  final text = ref.watch(controllerProvider);
  ref.read(terminalContentProvider.notifier).state += '\n${text.text}\n';

  addTheLastResult(ref, solution);
  myFocusNode.requestFocus();
}

addTheLastResult(WidgetRef ref, List<Node> solution) {
  //Count the nodes and total cost
  int nodeCounter = solution.length;
  int totalCost = solution.last.cost;

  //Show the number of nodes and total cost
  ref.read(terminalContentProvider.notifier).state +=
      '$nodeCounter, $totalCost';

  Node node;
  for (int i = 1; i < solution.length; i++) {
    node = solution[i];
    ref.read(terminalContentProvider.notifier).state +=
        '\n${node.operation} ${node.value}';
  }
}
