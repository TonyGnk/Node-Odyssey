import 'dart:collection';
import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services & Providers/tracking_container.dart';

class Node {
  Node(this.value, this.cost, this.operation);

  late int value;
  late int cost;
  late String operation;
}

Future<List<Node>?> findBreadthSolutionUI(
  int start,
  int end,
  int speed,
  WidgetRef ref,
) async {
  ListQueue<List<Node>> queue = ListQueue();
  // Initialize visited list
  List<bool> visited = List.filled(99999, false);

  queue.add([Node(start, 0, 'Αρχική Τιμή')]);

  while (queue.isNotEmpty) {
    await Future.delayed(Duration(microseconds: speed));

    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    // If the node has been visited before, skip it
    if (current.value >= visited.length || visited[current.value]) continue;

    // Mark the node as visited
    visited[current.value] = true;

    // Print the current node value
    log('${current.value}');
    ref
        .watch(trackingListProvider)
        .addTile(current.value, current.operation, ref);
    addTrackingContainer(ref, current.value, end);

// For printing the ui only
    // addTrackingContainerRolling(
    //   ref,
    //   '${current.value}',
    // );

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
        'Πρόσθεση κατά 1',
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
        'Αφαίρεση κατά 1',
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
        'Πολ/σιασμός επί 2',
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
        'Διαίρεση με 2',
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
        'Τετράγωνο',
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
          'Ρίζα',
        );
        List<Node> newPath = List.from(currentPath)..add(newNode);
        queue.add(newPath);
      }
    }
  }

  return null;
}

//

Future<List<List<Node>>?> findBreadthSolutionsUI2(
  int start,
  int end,
  int speed,
  WidgetRef ref,
) async {
  ListQueue<List<Node>> queue = ListQueue();
  // Initialize visited list
  //List<bool> visited = List.filled(99999, false);

  // Keep track of solutions
  List<List<Node>> solutions = [];

  queue.add([Node(start, 0, '')]);

  while (queue.isNotEmpty && solutions.length < 2) {
    await Future.delayed(Duration(milliseconds: speed));

    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    // If the node has been visited before, skip it
    //if (current.value >= visited.length || visited[current.value]) continue;

    // Mark the node as visited
    //visited[current.value] = true;

    // Print the current node value
    log('${current.value}');
    // For printing the ui only

    if (current.value == end) {
      solutions.add(currentPath);
      continue; // Continue exploring other paths even after finding a solution
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

  return solutions.length == 2 ? solutions : null;
}

//

Future<List<List<Node>>?> findBreadthSolutionsUI3(
  int start,
  int end,
  int speed,
  WidgetRef ref,
) async {
  ListQueue<List<Node>> queue = ListQueue();
  // Initialize visited list
  //List<bool> visited = List.filled(99999, false);

  // Keep track of solutions
  List<List<Node>> solutions = [];

  queue.add([Node(start, 0, '')]);

  while (queue.isNotEmpty && solutions.length < 3) {
    await Future.delayed(Duration(milliseconds: speed));

    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    // If the node has been visited before, skip it
    //if (current.value >= visited.length || visited[current.value]) continue;

    // Mark the node as visited
    //visited[current.value] = true;

    // Print the current node value
    log('${current.value}');
    // For printing the ui only

    if (current.value == end) {
      solutions.add(currentPath);
      continue; // Continue exploring other paths even after finding a solution
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

  return solutions.length == 3 ? solutions : null;
}
