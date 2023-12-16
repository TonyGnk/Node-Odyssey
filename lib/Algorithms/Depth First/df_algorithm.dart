import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/Public Search Bar/Search Call/call_helper.dart';
import '../../Services/Public Search Bar/check_box_search.dart';
import '../../Services/Public Search Bar/closed_search.dart';
import '../../Services/Public Search Bar/sliders_and_options_bf.dart';
import '../../Services/six_calculations.dart';

List<Node> runDepth(WidgetRef ref, RunningStyle style) {
  // Αρχικοποίηση των αρχικών και τελικών τιμών
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  // Αρχικοποίηση του χρόνου έναρξης
  DateTime startTime = DateTime.now();

  // Δημιουργία στοίβας και συνόλου για την αποθήκευση των μονοπατιών
  List<List<Node>> stack = [
    [Node(start, 0, 'Initial Value')]
  ];
  Set<int> visited = {start};

  // Όσο η ουρά δεν είναι άδεια και ξεπεράσαμε το χρονικό όριο
  while (stack.isNotEmpty &&
      DateTime.now().difference(startTime).inSeconds < timeLimit) {
    // Αρχικοποίηση του μετρητή
    int counter = 0;

    // Αφαίρεση του τελευταίου μονοπατιού από τη στοίβα
    List<Node> currentPath = stack.removeLast();
    // Λήψη του τελευταίου κόμβου του μονοπατιού
    Node current = currentPath.last;

    // Ενημέρωση του γραφικού περιεχομένου
    updateGraphicalContent(ref, current, end);

    // Έλεγχος αν έχουμε φτάσει στον τελικό κόμβο
    if (current.value == end) return currentPath;

    // Διατρέχουμε όλους τους δυνατούς τύπους υπολογισμών
    for (CalculationType type in CalculationType.values) {
      // Εάν η λειτουργία είναι ενεργοποιημένη
      if (enabledOperations[type]!) {
        // Υπολογίζουμε τη νέα τιμή
        int newValue = getNewValue(current.value, type);
        // Εάν η νέα τιμή είναι επιτρεπτή
        if (isAllowed(newValue, current.value, type)) {
          // Εάν ο κόμβος δεν έχει επισκεφτεί ή αν η επίσκεψη είναι απενεργοποιημένη
          if (!visited.contains(newValue) || avoidVisitedIsDisable) {
            Node newNode = getNewNode(
              current.value,
              current.cost,
              newValue,
              type,
            );
            // Δημιουργούμε ένα νέο μονοπάτι προσθέτοντας τον νέο κόμβο
            List<Node> newPath = List.from(currentPath)..add(newNode);
            // Εισάγουμε το νέο μονοπάτι στη στοίβα.
            // Οι νεότεροι κόμβοι προστίθονται πιο κοντά στο τέλος της στοίβας
            stack.insert(stack.length - counter, newPath);
            if (counter == 0) {
              visited.add(newNode.value);
            }
          }
        }
      }
      // Αύξηση του μετρητή
      counter++;
    }
  }
  return [];
}

Future<List<Node>> runDepthAsync(WidgetRef ref, RunningStyle style) async {
  int start = int.parse(inputController.text);
  int end = int.parse(targetController.text);
  DateTime startTime = DateTime.now();

  List<List<Node>> stack = [
    [Node(start, 0, 'Initial Value')]
  ];
  Set<int> visited = {start};

  while (stack.isNotEmpty &&
      DateTime.now().difference(startTime).inSeconds < timeLimit) {
    int counter = 0;

    List<Node> currentPath = stack.removeLast();
    Node current = currentPath.last;

    updateGraphicalContent(ref, current, end);

    if (current.value == end) return currentPath;

    // Calculate all the possible
    for (CalculationType type in CalculationType.values) {
      //If the operation is enabled
      if (enabledOperations[type]!) {
        int newValue = getNewValue(current.value, type);
        // If the new value is allowed from the rules
        if (isAllowed(newValue, current.value, type)) {
          // If the new value is not visited
          if (!visited.contains(newValue) || avoidVisitedIsDisable) {
            Node newNode = getNewNode(
              current.value,
              current.cost,
              newValue,
              type,
            );
            List<Node> newPath = List.from(currentPath)..add(newNode);
            stack.insert(stack.length - counter, newPath);
            if (counter == 0) {
              visited.add(newNode.value);
            }
          }
        }
      }
      counter++;
    }
    await Future.delayed(Duration(milliseconds: searchSpeed));
  }

  return [];
}
