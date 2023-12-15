import 'dart:math';

class Node {
  Node(this.value, this.cost, this.operation, [this.parent]);

  final int value;
  final int cost;
  final String operation;
  late int distance;
  final Node? parent;

  setDistance(int target) {
    distance = (target - value).abs();
  }
}

enum CalculationType {
  addition,
  subtraction,
  multiplication,
  division,
  exponential,
  square,
}

enum RunningStyle { instant, terminal, step, normal }

getNewValue(int? value, CalculationType type) {
  if (value == null) return 0;
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

bool isAllowed(int newValue, int? value, CalculationType type) {
  if (value == null) return false;
  switch (type) {
    case CalculationType.addition:
      return newValue < pow(10, 9);
    case CalculationType.subtraction:
      return newValue >= 0; // The = is not in the assignment
    case CalculationType.multiplication:
      return newValue / 2 > 0 && newValue < pow(10, 9);
    case CalculationType.division:
      return newValue > 0;
    case CalculationType.exponential:
      return newValue <= pow(10, 9) && newValue > 1;
    case CalculationType.square:
      return (newValue * newValue == value) && (value > 1);
  }
}

positionToType(int? pos) {
  switch (pos) {
    case 0:
      return CalculationType.addition;
    case 1:
      return CalculationType.subtraction;
    case 2:
      return CalculationType.multiplication;
    case 3:
      return CalculationType.division;
    case 4:
      return CalculationType.exponential;
    case 5:
      return CalculationType.square;
    default:
      return CalculationType.addition;
  }
}

Node getNewNode(int value, int cost, int newValue, CalculationType type) {
  switch (type) {
    case CalculationType.addition:
      return Node(
        newValue,
        cost + 2,
        getCalculationTypeMap()[type]!,
      );
    case CalculationType.subtraction:
      return Node(
        newValue,
        cost + 2,
        getCalculationTypeMap()[type]!,
      );
    case CalculationType.multiplication:
      return Node(
        newValue,
        cost + (value / 2).ceil() + 1,
        getCalculationTypeMap()[type]!,
      );
    case CalculationType.division:
      return Node(
        newValue,
        cost + (value / 4).ceil() + 1,
        getCalculationTypeMap()[type]!,
      );
    case CalculationType.exponential:
      return Node(
        newValue,
        cost + ((value * value - value) ~/ 4 + 1).toInt(),
        getCalculationTypeMap()[type]!,
      );
    case CalculationType.square:
      return Node(
        newValue,
        cost + (value - newValue.toInt()) ~/ 4 + 1,
        getCalculationTypeMap()[type]!,
      );
    default:
      return Node(newValue, cost, '');
  }
}

//Create map. First is Calculation Type, second is the String 'Ρίζα, Τετράγωνο, Πολ/σιασμός επί 2, Διαίρεση με 2, Πρόσθεση κατά 1, Αφαίρεση κατά 1' etc
Map<CalculationType, String> getCalculationTypeMap() => {
      CalculationType.addition: 'Increase',
      CalculationType.subtraction: 'Decrease',
      CalculationType.multiplication: 'Double',
      CalculationType.division: 'Half',
      CalculationType.exponential: 'Square',
      CalculationType.square: 'Root',
    };
