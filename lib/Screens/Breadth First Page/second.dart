import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Node {
  Node(this.value, this.cost, this.operation);

  late int value;
  late int cost;
  late String operation;
}

List<List<Node>> findSolutions(int start, int end) {
  ListQueue<List<Node>> queue = ListQueue();
  List<List<Node>> solutions = [];

  queue.add([Node(start, 0, '')]);

  while (queue.isNotEmpty) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    //Print the current node value
    log('${current.value}');

    if (current.value == end) {
      solutions.add(List.from(currentPath));
      continue;
    }

    // Προσθήκη κόμβων μετά την πρόσθεση
    if (current.value + 1 < 99) {
      Node newNode = Node(current.value + 1, current.cost + 2, '+');
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }

    // Προσθήκη κόμβων μετά τον πολλαπλασιασμό
    if (current.value * 2 < 150) {
      Node newNode = Node(current.value * 2, current.cost + 4, '*');
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }
  }

  return solutions;
}

final blueColorProvider = StateProvider<DD>(
  (ref) => DD(),
);

class DD extends StatelessWidget {
  DD({super.key});

  late String text = 'Hello';
  String get getText => text;

  @override
  Widget build(BuildContext context) => Container(
        child: Text(text),
      );
}
