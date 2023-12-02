// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Algorithms/Breadth First/providers_bf.dart';
import '../../Services & Providers/constants.dart';
import '../../Services & Providers/node.dart';
import '../../Services & Providers/six_calculations.dart';
import '../../Services & Providers/text_editor_provider.dart';
import '../../Services & Providers/tracking_container.dart';
import '../Breadth First Page/Archive BF/list_provider.dart';
import 'terminal_helper.dart';

Future<void> analyzeTheText(WidgetRef ref) async {
  //Get the text from the textField
  final text = ref.watch(controllerProvider);

  //Split the text into words and Remove the System32
  List<String> words = text.text.split(' ');
  if (words[0] == system32Text) words.removeAt(0);

  if (words.length >= 4) {
    //Get the algorithmType
    AlgorithmType type = findType(words[1]);

    int? startValue;
    int? targetValue;
    try {
      startValue = int.parse(words[2]);
    } catch (e) {
      log('${words[2]} is not a valid number');
    }
    try {
      targetValue = int.parse(words[3]);
    } catch (e) {
      log('${words[3]} is not a valid number');
    }

    ref.watch(runningRequestProvider.notifier).state = running(
      ref,
      startValue ?? 0,
      targetValue ?? 0,
    );

    //Start the selected algorithm
    ref.read(isAlgorithmEndProviderBf.notifier).state = false; //Started
    List<Node>? solution = await startAlgorithm(ref, type);
    ref.read(isAlgorithmEndProviderBf.notifier).state = true; //Finished

    newResult(ref, solution);
  }
}

AlgorithmType findType(String algorithm) {
  switch (algorithm) {
    case 'breadth':
      return AlgorithmType.bf;
    case 'depth':
      return AlgorithmType.df;
    case 'best':
      return AlgorithmType.bestf;
    case 'a*':
      return AlgorithmType.astar;
    default:
      return AlgorithmType.bf;
  }
}

running(WidgetRef ref, int startValue, int targetValue) => RunningRequest(
      startValue: startValue,
      targetValue: targetValue,
      speed: 0,
      enabledOperations: {
        CalculationType.addition: true,
        CalculationType.subtraction: true,
        CalculationType.multiplication: true,
        CalculationType.division: true,
        CalculationType.exponential: true,
        CalculationType.square: true,
      },
    );

newResult(WidgetRef ref, List<Node>? solution) {
  ref.read(terminalRowsProvider.notifier).state = [];
  if (solution == null) {
    ref.read(terminalRowsProvider.notifier).state.add(
          terminalText(
            'No Solution Found!',
          ),
        );
  } else {
    int nodeCounter = countNodes(solution);
    int totalCost = solution.last.cost;
    ref.read(terminalRowsProvider.notifier).state.add(
          terminalText(
            '$nodeCounter, $totalCost',
          ),
        );
    for (Node node in solution) {
      ref.read(terminalRowsProvider.notifier).state.add(
            terminalText(
                '${node.operation} ${getPreviousValue(node.value, node.operation)} ${node.cost}'),
          );
    }
  }

  //Refresh the terminalRowsProvider
  ref.read(justForRefreshProvider.notifier).state =
      !ref.read(justForRefreshProvider.notifier).state;
}

int countNodes(List<Node> solution) => solution.length;
