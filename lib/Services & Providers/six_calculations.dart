import 'dart:math';

import 'node.dart';

enum CalculationType {
  addition,
  subtraction,
  multiplication,
  division,
  exponential,
  square,
}

int getNewValue(int value, CalculationType type) {
  switch (type) {
    case CalculationType.addition:
      return value + 1;
    case CalculationType.subtraction:
      return value - 1;
    case CalculationType.multiplication:
      return value * 2;
    case CalculationType.division:
      return (value / 2).floor();
    case CalculationType.exponential:
      return value * value;
    case CalculationType.square:
      return value > 1 ? sqrt(value).toInt() : 2;
    default:
      return value;
  }
}

bool isAllowed(int newValue, int value, CalculationType type) {
  switch (type) {
    case CalculationType.addition:
      return newValue < pow(10, 9);
    case CalculationType.subtraction:
      return newValue > 0;
    case CalculationType.multiplication:
      return newValue / 2 > 0 && newValue < pow(10, 9);
    case CalculationType.division:
      return newValue > 0;
    case CalculationType.exponential:
      return newValue <= pow(10, 9);
    case CalculationType.square:
      return (newValue * newValue == value) && (value > 1);
  }
}

Node getNewNode(int value, int cost, int newValue, CalculationType type) {
  switch (type) {
    case CalculationType.addition:
      return Node(
        newValue,
        cost + 2,
        'Πρόσθεση κατά 1',
      );
    case CalculationType.subtraction:
      return Node(
        newValue,
        cost + 2,
        'Αφαίρεση κατά 1',
      );
    case CalculationType.multiplication:
      return Node(
        newValue,
        cost + (value / 2).ceil() + 1,
        'Πολλαπλασιασμός με 2',
      );
    case CalculationType.division:
      return Node(
        newValue,
        cost + (value / 4).ceil() + 1,
        'Διαίρεση με 2',
      );
    case CalculationType.exponential:
      return Node(
        newValue,
        cost + ((value * value - value) ~/ 4 + 1).toInt(),
        'Εκθετική',
      );
    case CalculationType.square:
      return Node(
        newValue,
        cost + (value - newValue.toInt()) ~/ 4 + 1,
        'Τετράγωνο',
      );
    default:
      return Node(newValue, cost, '');
  }
}
