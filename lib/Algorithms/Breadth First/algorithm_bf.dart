import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/Breadth First Page/Archive BF/list_provider.dart';
import '../../Services & Providers/node.dart';
import '../../Services & Providers/six_calculations.dart';
import '../../Services & Providers/tracking_container.dart';

Future<List<Node>?> findBreadthSolutionUI(
  int start,
  int end,
  int speed,
  Map<CalculationType, bool> enableCalculationMap,
  WidgetRef ref,
) async {
  ListQueue<List<Node>> queue = ListQueue();
  // ignore: prefer_collection_literals
  Set<int> visited = Set();

  queue.add([Node(start, 0, 'Αρχική Τιμή')]);
  visited.add(start);

  while (queue.isNotEmpty) {
    await Future.delayed(Duration(microseconds: speed));

    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    ref
        .watch(trackingListProvider)
        .addTile(current.value, current.operation, ref);
    addTrackingContainer(ref, current.value, end);

    if (current.value == end) {
      return currentPath;
    }

    for (CalculationType type in CalculationType.values) {
      if (enableCalculationMap[type]!) {
        int newValue = getNewValue(current.value, type);
        if (isAllowed(newValue, current.value, type)) {
          if (!visited.contains(newValue)) {
            Node newNode = getNewNode(
              current.value,
              current.cost,
              newValue,
              type,
            );
            List<Node> newPath = List.from(currentPath)..add(newNode);
            queue.add(newPath);
            visited.add(newNode.value);
          }
        }
      }
    }

    //   // Πρόσθεση x+1
    //   //Κόστος:2
    //   //Προϋπόθεση x<10^9

    //   int newValuePlusOne = current.value + 1;
    //   bool canPlusOne = newValuePlusOne < math.pow(10, 9);
    //   bool hasVisit = visited.contains(newValuePlusOne);
    //   if (canPlusOne && !hasVisit) {
    //     Node newNode = Node(
    //       newValuePlusOne,
    //       current.cost + 2,
    //       'Πρόσθεση κατά 1',
    //     );
    //     List<Node> newPath = List.from(currentPath)..add(newNode);
    //     queue.add(newPath);
    //     visited.add(newNode.value);
    //   }

    //   // Αφαίρεση x-1
    //   // Κόστος:2
    //   // Προϋπόθεση x>0
    //   bool goMinusOne = current.value > 0;
    //   int newValueMinusOne = current.value - 1;
    //   bool existMinusOne = visited.contains(newValueMinusOne);
    //   if (goMinusOne && !existMinusOne) {
    //     Node newNode = Node(
    //       newValueMinusOne,
    //       current.cost + 2,
    //       'Αφαίρεση κατά 1',
    //     );
    //     List<Node> newPath = List.from(currentPath)..add(newNode);
    //     queue.add(newPath);
    //     visited.add(newNode.value);
    //   }

    //   // Διπλασιασμός *2
    //   // Κόστος: floor(x/2)+1
    //   // Προϋπόθεση x>0 AND 2*x<10^9
    //   bool goDouble = current.value > 0 && 2 * current.value < math.pow(10, 9);
    //   int newValueDouble = current.value * 2;
    //   bool existDouble = visited.contains(newValueDouble);
    //   if (goDouble && !existDouble) {
    //     Node newNode = Node(
    //       newValueDouble,
    //       current.cost + (current.value / 2).ceil() + 1,
    //       'Πολ/σιασμός επί 2',
    //     );
    //     List<Node> newPath = List.from(currentPath)..add(newNode);
    //     queue.add(newPath);
    //     visited.add(newNode.value);
    //   }

    //   // Υποδιπλασιασμός floor(x/2)]
    //   // Κόστος: floor(x/4)+1
    //   // Προϋπόθεση x>0
    //   bool goHalf = current.value > 0;
    //   int newValueHalf = (current.value / 2).floor();
    //   bool existHalf = visited.contains(newValueHalf);
    //   if (goHalf && !existHalf) {
    //     Node newNode = Node(
    //       newValueHalf,
    //       current.cost + (current.value / 4).ceil() + 1,
    //       'Διαίρεση με 2',
    //     );
    //     List<Node> newPath = List.from(currentPath)..add(newNode);
    //     queue.add(newPath);
    //     visited.add(newNode.value);
    //   }

    //   // Τετράγωνο x^2
    //   // Κόστος: (x^2-x)/4+1
    //   // Προϋπόθεση x^2<=10^9
    //   bool goSquare = current.value * current.value <= math.pow(10, 9);
    //   int newValueSquare = current.value * current.value;
    //   bool existSquare = visited.contains(newValueSquare);
    //   if (goSquare && !existSquare) {
    //     Node newNode = Node(
    //       newValueSquare,
    //       current.cost +
    //           ((current.value * current.value - current.value) ~/ 4 + 1).toInt(),
    //       'Τετράγωνο',
    //     );
    //     List<Node> newPath = List.from(currentPath)..add(newNode);
    //     queue.add(newPath);
    //   }

    //   // Τετραγωνική ρίζα sqrt(x)
    //   // Κόστος: (x-sqrt(x))/4+1
    //   // Προϋπόθεση x>1 AND X perfect of sqrt(x)
    //   bool goRoot = current.value > 1;
    //   double sqrtValue = math.sqrt(current.value);
    //   bool isSquareRoot = sqrtValue.toInt() == sqrtValue &&
    //       sqrtValue * sqrtValue == current.value;
    //   bool existRoot = visited.contains(sqrtValue.toInt());
    //   if (goRoot && isSquareRoot && !existRoot) {
    //     Node newNode = Node(
    //       sqrtValue.toInt(),
    //       current.cost + (current.value - sqrtValue.toInt()) ~/ 4 + 1,
    //       'Ρίζα',
    //     );
    //     List<Node> newPath = List.from(currentPath)..add(newNode);
    //     queue.add(newPath);
    //   }
  }

  return null;
}
