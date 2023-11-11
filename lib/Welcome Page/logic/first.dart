// ignore_for_file: library_private_types_in_public_api

import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../selector.dart';
import 'second.dart';

class First extends StatefulWidget {
  First({
    super.key,
  });

  @override
  FirstState createState() => FirstState();
}

class FirstState extends State<First> {
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      );

  List<List<Node>> findSolutions(int start, int end) {
    ListQueue<List<Node>> queue = ListQueue();
    List<List<Node>> solutions = [];

    queue.add([Node(start, 0, '')]);

    while (queue.isNotEmpty) {
      List<Node> currentPath = queue.removeFirst();
      Node current = currentPath.last;

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

  startCal(int start, int end) async {
    List<List<Node>> solutions = findSolutions(start, end);

    if (solutions.isEmpty) {
      log('Δεν υπάρχουν λύσεις.');
    } else {
      for (List<Node> solution in solutions) {
        log('Λύση:');

        for (Node node in solution) {
          log('${node.operation} ${node.value}');
        }

        log('Συνολικό Κόστος: ${solution.last.cost}');
        log('\n');
      }
    }
  }
}
