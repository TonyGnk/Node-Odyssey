import 'dart:collection';
import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Services/List Panel/list_provider.dart';

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

// Future<List<List<Node>>> findBreadthSolutionUI(
//   int start,
//   int end,
//   int speed,
//   WidgetRef ref,
// ) async {
//   ListQueue<List<Node>> queue = ListQueue();
//   List<List<Node>> solutions = [];

//   queue.add([Node(start, 0, '')]);

//   while (queue.isNotEmpty) {
//     await Future.delayed(Duration(milliseconds: speed));

//     List<Node> currentPath = queue.removeFirst();
//     Node current = currentPath.last;

//     //Print the current node value
//     log('${current.value}');
//     //For printing the ui only
//     addTrackingContainer(ref, '${current.value}', Colors.transparent);
//     addTrackingContainerRolling(ref, '${current.value}', Colors.green);

//     if (current.value == end) {
//       solutions.add(List.from(currentPath));
//       continue;
//     }

//     // Προσθήκη κόμβων μετά την πρόσθεση
//     if (current.value + 1 < 51) {
//       Node newNode = Node(current.value + 1, current.cost + 2, '+');
//       List<Node> newPath = List.from(currentPath)..add(newNode);
//       queue.add(newPath);
//     }

//     // Προσθήκη κόμβων μετά τον πολλαπλασιασμό
//     if (current.value * 2 < 51) {
//       Node newNode = Node(current.value * 2, current.cost + 4, '*');
//       List<Node> newPath = List.from(currentPath)..add(newNode);
//       queue.add(newPath);
//     }
//   }

//   return solutions;
// }

//

Future<List<Node>?> findBreadthSolutionUI(
  int start,
  int end,
  int speed,
  WidgetRef ref,
) async {
  ListQueue<List<Node>> queue = ListQueue();
  // Initialize visited list
  List<bool> visited = List.filled(99999, false);

  queue.add([Node(start, 0, '')]);

  while (queue.isNotEmpty) {
    await Future.delayed(Duration(milliseconds: speed));

    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    // If the node has been visited before, skip it
    if (current.value >= visited.length || visited[current.value]) continue;

    // Mark the node as visited
    visited[current.value] = true;

    // Print the current node value
    log('${current.value}');
    // For printing the ui only
    addTrackingContainer(
      ref,
      '${current.value}',
    );
    addTrackingContainerRolling(
      ref,
      '${current.value}',
    );

    if (current.value == end) {
      return currentPath;
    }

    // Πρόσθεση x+1
    //Κόστος:2
    //Προϋπόθεση x<10^9
    if (current.value + 1 < math.pow(10, 9)) {
      Node newNode = Node(
        current.value + 1,
        current.cost + 2,
        '+',
      );
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }

    // Αφαίρεση x-1
    // Κόστος:2
    // Προϋπόθεση x>0
    if (current.value > 0) {
      Node newNode = Node(
        current.value - 1,
        current.cost + 2,
        '-',
      );
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }

    // Διπλασιασμός *2
    // Κόστος: floor(x/2)+1
    // Προϋπόθεση x>0 AND 2*x<10^9
    if (current.value > 0 && 2 * current.value < math.pow(10, 9)) {
      Node newNode = Node(
        current.value * 2,
        current.cost + (current.value / 2).ceil() + 1,
        '*',
      );
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }

    // Υποδιπλασιασμός floor(x/2)]
    // Κόστος: floor(x/4)+1
    // Προϋπόθεση x>0
    if (current.value > 0) {
      Node newNode = Node(
        (current.value / 2).floor(),
        current.cost + (current.value / 4).ceil() + 1,
        '/',
      );
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }

    // Τετράγωνο x^2
    // Κόστος: (x^2-x)/4+1
    // Προϋπόθεση x^2<=10^9
    if (current.value * current.value <= math.pow(10, 9)) {
      Node newNode = Node(
        current.value * current.value,
        current.cost + (current.value * current.value - current.value) ~/ 4 + 1,
        '^',
      );
      List<Node> newPath = List.from(currentPath)..add(newNode);
      queue.add(newPath);
    }

    // Τετραγωνική ρίζα sqrt(x)
    // Κόστος: (x-sqrt(x))/4+1
    // Προϋπόθεση x>1 AND X perfect of sqrt(x).
    if (current.value > 1) {
      double sqrtValue = math.sqrt(current.value);
      if (sqrtValue.toInt() == sqrtValue &&
          sqrtValue * sqrtValue == current.value) {
        Node newNode = Node(
          sqrtValue.toInt(),
          current.cost + (current.value - sqrtValue.toInt()) ~/ 4 + 1,
          '√',
        );
        List<Node> newPath = List.from(currentPath)..add(newNode);
        queue.add(newPath);
      }
    }
  }

  return null;
}

//

//

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
