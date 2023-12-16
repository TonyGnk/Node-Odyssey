import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/Tree Widgets/tree_helpler.dart';
import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/six_calculations.dart';
import 'bst_step_helper.dart';

List<Node> runBest(WidgetRef ref, RunningStyle style) {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  ListQueue<List<Node>> queue = ListQueue();
  List<List<int?>> treeList = List.filled(6, List<int?>.filled(6, null));
  List<int?> treeListSmall = List.filled(6, null);
  bool founded = false;

  queue.add([Node(start, 0, 'Initial Value')]);
  Set<int> visited = {start};

  for (CalculationType type in CalculationType.values) {
    if (enabledOperations[type]!) {
      int newValue = getNewValue(start, type);
      if (isAllowed(newValue, start, type)) {
        if (!visited.contains(newValue)) {
          treeListSmall[getPosition(type)] = newValue;
        }
      }
    }
  }

  while (queue.isNotEmpty &&
      DateTime.now().difference(startTime).inSeconds < timeLimit) {
    List<Node> currentPath = queue.removeFirst();
    Node current = currentPath.last;

    setKingLeafs(treeListSmall, ref);
    updateGraphicalContent(ref, current, end);

    if (current.value == end) return currentPath;

    for (int i = 0; i < treeListSmall.length; i++) {
      if (treeListSmall[i] != null) {
        if (treeListSmall[i] == end) {
          Node rightNode = getNewNode(
            current.value,
            current.cost,
            treeListSmall[i] ?? 0,
            positionToType(i),
          );
          // Δημιουργία νέου μονοπατιού και προσθήκη του νέου κόμβου
          List<Node> newPath = List.from(currentPath)..add(rightNode);
          // Προσθήκη του νέου μονοπατιού στην ουρά
          queue.add(newPath);
          // Ορίζουμε ότι βρήκαμε τον τελικό κόμβο
          founded = true;
        }
      }
    }
    // Εάν βρήκαμε τον τελικό κόμβο, συνεχίζουμε στην επόμενη επανάληψη
    if (founded) continue;

    for (int i = 0; i < treeListSmall.length; i++) {
      // Εάν η τιμή στη θέση i είναι null
      if (treeListSmall[i] == null) {
        // Ορίζουμε τη λίστα στη θέση i ως null
        treeList[i] = List.filled(6, null);
      } else {
        // Δημιουργία προσωρινής λίστας
        List<int?> temp = List.filled(6, null);
        // Διατρέχουμε όλους τους δυνατούς τύπους υπολογισμών
        for (CalculationType type in CalculationType.values) {
          if (enabledOperations[type]!) {
            int newValue = getNewValue(treeListSmall[i], type);
            if (isAllowed(newValue, treeListSmall[i], type)) {
              if (!visited.contains(newValue)) {
                temp[getPosition(type)] = newValue;
              }
            }
          }
        }
        // Ορίζουμε τη λίστα στη θέση i ως την προσωρινή λίστα
        treeList[i] = temp;
      }
    }
    // Βρίσκουμε τον κόμβο με την ελάχιστη τιμή
    setLeafs(treeList, ref);
    Map map = findSmallest(treeList, end);
    int rightNodePosition = map['minListIndex'];
    int rightNodeValue = treeListSmall[map['minListIndex']] ?? 0;

    // Δημιουργία νέου κόμβου
    Node rightNode = getNewNode(
      current.value,
      current.cost,
      rightNodeValue,
      positionToType(rightNodePosition),
    );
    // Δημιουργία νέου μονοπατιού και προσθήκη του νέου κόμβου
    List<Node> newPath = List.from(currentPath)..add(rightNode);
    // Προσθήκη του νέου μονοπατιού στην ουρά
    queue.add(newPath);
    // Προσθήκη της τιμής του νέου κόμβου στη λίστα των επισκεπτόμενων
    visited.add(rightNode.value);

    // Ενημέρωση της λίστας με τις μικρότερες τιμές
    treeListSmall = treeList[rightNodePosition];
    // Επαναφορά της λίστας του δέντρου
    treeList = List.filled(6, List<int?>.filled(6, null));
  }

  return [];
}
