import '../../Services/six_calculations.dart';

class PriorityQueue {
  PriorityQueue([this._nodes = const []]);

  final List<Node> _nodes;

  void add(Node node) {
    _nodes.add(node);
    _nodes.sort(
        (a, b) => (a.cost * 3 + a.distance).compareTo(b.cost * 3 + b.distance));
  }

  Node removeFirst() => _nodes.removeAt(0);

  void clear() => _nodes.clear();

  bool get isEmpty => _nodes.isEmpty;
}

List<Node> reconstructPath(Node end) {
  List<Node> path = [];
  Node currentNode = end;

  //Until we reach the start node with operation 'Initial Value'
  while (currentNode.operation != 'Initial Value') {
    path.add(currentNode);
    currentNode = currentNode.parent!;
  }

  //Before return the path, flip it
  path = path.reversed.toList();

  return path;
}

Node getNewNodeZ(
  Node current,
  int value,
  int cost,
  int newValue,
  CalculationType type,
) {
  switch (type) {
    case CalculationType.addition:
      return Node(
        newValue,
        cost + 2,
        getCalculationName()[type]!,
        current,
      );
    case CalculationType.subtraction:
      return Node(
        newValue,
        cost + 2,
        getCalculationName()[type]!,
        current,
      );
    case CalculationType.multiplication:
      return Node(
        newValue,
        cost + (value / 2).ceil() + 1,
        getCalculationName()[type]!,
        current,
      );
    case CalculationType.division:
      return Node(
        newValue,
        cost + (value / 4).ceil() + 1,
        getCalculationName()[type]!,
        current,
      );
    case CalculationType.exponential:
      return Node(
        newValue,
        cost + ((value * value - value) ~/ 4 + 1).toInt(),
        getCalculationName()[type]!,
        current,
      );
    case CalculationType.square:
      return Node(
        newValue,
        cost + (value - newValue.toInt()) ~/ 4 + 1,
        getCalculationName()[type]!,
        current,
      );
    default:
      return Node(
        newValue,
        cost,
        '',
        current,
      );
  }
}
