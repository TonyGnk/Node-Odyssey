import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
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
  if (words[0] == 'register.exe') words.removeAt(0);

  if (words.length < 3) {
    myFocusNode.requestFocus();
    return;
  }

  //Get the algorithmType
  currentAlgorithm = findType(words[0]);

  int startValue = int.parse(words[1]);
  int targetValue = int.parse(words[2]);
  inputController = TextEditingController(text: startValue.toString());
  targetController = TextEditingController(text: targetValue.toString());

  //Start the selected algorithm
  ref.read(isAlgorithmEndProvider.notifier).state = false; //Started
  List<Node>? solution = startAlgorithm(ref, RunningStyle.terminal);
  ref.read(isAlgorithmEndProvider.notifier).state = true; //Finished

  if (solution.isNotEmpty) {
    writeToFile(solution, 'solution.txt');
    newResult(ref, solution);
    //If universal platform!=web
    if (!UniversalPlatform.isWeb) {
      ScaffoldMessenger.of(ref.context).showSnackBar(
        snackBarText(ref.context, 'The solution is saved in solution.txt'),
      );
    }

    myFocusNode.requestFocus();
  } else {
    ref.read(terminalOutput.notifier).state += '\nTime Out!\n';
    myFocusNode.requestFocus();
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

void writeToFile(List<Node> dataList, String path) async {
  final file = File(path);
  // Write the file
  //For every node write the operation and the value
  String data = '';
  //Add node count and cost of last
  data += '${dataList.length - 1}, ${dataList.last.cost}\n';
  for (int i = 1; i < dataList.length; i++) {
    data +=
        '${dataList[i].operation} ${dataList[i].value} ${dataList[i].cost}\n';
  }
  await file.writeAsString(data);
}

newResult(WidgetRef ref, List<Node>? solution) {
  if (solution == null) {
    ref.read(terminalOutput.notifier).state += '\nNo Solution Found!\n';
    return;
  }

  //Add the used textField to terminal content
  final text = ref.watch(controllerProvider);
  ref.read(terminalOutput.notifier).state += '\n${text.text}\n';

  addTheLastResult(ref, solution);
  myFocusNode.requestFocus();
}

addTheLastResult(WidgetRef ref, List<Node> solution) {
  //Count the nodes and total cost
  int nodeCounter = solution.length;
  int totalCost = solution.last.cost;

  //Show the number of nodes and total cost
  ref.read(terminalOutput.notifier).state += '$nodeCounter, $totalCost';

  Node node;
  for (int i = 1; i < solution.length; i++) {
    node = solution[i];
    ref.read(terminalOutput.notifier).state +=
        '\n${node.operation} ${node.value}';
  }
}

snackBarText(
  BuildContext context,
  String message,
) =>
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'Play',
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerSize),
      ),
      showCloseIcon: false,
      closeIconColor: Theme.of(context).colorScheme.onBackground,
      backgroundColor: Theme.of(context).shadowColor,
    );
