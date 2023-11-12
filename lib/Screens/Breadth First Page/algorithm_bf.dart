import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Services/providers_bf.dart';

class Node {
  Node(this.value, this.cost, this.operation);

  late int value;
  late int cost;
  late String operation;
}

// It initializes an empty queue and a list of solutions. The queue will hold all possible paths, while the solutions list will hold all valid paths from start to end.

// It adds the start node to the queue.

// It enters a loop that continues as long as the queue is not empty.

// In each iteration of the loop, it removes the first path from the queue and gets the last node from this path (the current node).

// It logs the value of the current node.

// If the value of the current node is equal to end, it adds the current path to the solutions list and continues to the next iteration.

// If the value of the current node plus one is less than 99, it creates a new node with this value, a cost of current.cost + 2, and an operation of '+'. It then adds this new node to the current path and adds the updated path to the queue.

// If the value of the current node multiplied by two is less than 150, it creates a new node with this value, a cost of current.cost + 4, and an operation of '*'. It then adds this new node to the current path and adds the updated path to the queue.

// The loop continues until the queue is empty, meaning all possible paths have been explored.

// Finally, the function returns the list of solutions, which are all the paths from start to end that were found.

List<List<Node>> findBreadthSolutionUI(int start, int end, WidgetRef ref) {
  ListQueue<List<Node>> queue = ListQueue();
  List<List<Node>> solutions = [];

  queue.add([Node(start, 0, '')]);

  while (queue.isNotEmpty) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    //Print the current node value
    log('${current.value}');
    addTrackingContainer(ref, '${current.value}', Colors.green);

    if (current.value == end) {
      solutions.add(List.from(currentPath));
      continue;
    }

    // Προσθήκη κόμβων μετά την πρόσθεση
    if (current.value + 1 < 32) {
      Node newNode = Node(current.value + 1, current.cost + 2, '+');
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }

    // Προσθήκη κόμβων μετά τον πολλαπλασιασμό
    if (current.value * 2 < 32) {
      Node newNode = Node(current.value * 2, current.cost + 4, '*');
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }
  }

  return solutions;
}

List<List<Node>> findBreadthSolutionCmd(int start, int end) {
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
    if (current.value + 1 < 32) {
      Node newNode = Node(current.value + 1, current.cost + 2, '+');
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }

    // Προσθήκη κόμβων μετά τον πολλαπλασιασμό
    if (current.value * 2 < 32) {
      Node newNode = Node(current.value * 2, current.cost + 4, '*');
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }
  }

  return solutions;
}
