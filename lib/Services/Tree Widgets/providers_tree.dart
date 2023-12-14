import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LeafType {
  throne,
  additionLeaf,
  additionLeaf1,
  additionLeaf2,
  additionLeaf3,
  additionLeaf4,
  additionLeaf5,
  additionLeaf6,
  subtractionLeaf,
  subtractionLeaf1,
  subtractionLeaf2,
  subtractionLeaf3,
  subtractionLeaf4,
  subtractionLeaf5,
  subtractionLeaf6,
  multiplicationLeaf,
  multiplicationLeaf1,
  multiplicationLeaf2,
  multiplicationLeaf3,
  multiplicationLeaf4,
  multiplicationLeaf5,
  multiplicationLeaf6,
  divisionLeaf,
  divisionLeaf1,
  divisionLeaf2,
  divisionLeaf3,
  divisionLeaf4,
  divisionLeaf5,
  divisionLeaf6,
  squareLeaf,
  squareLeaf1,
  squareLeaf2,
  squareLeaf3,
  squareLeaf4,
  squareLeaf5,
  squareLeaf6,
  squareRootLeaf,
  squareRootLeaf1,
  squareRootLeaf2,
  squareRootLeaf3,
  squareRootLeaf4,
  squareRootLeaf5,
  squareRootLeaf6,
  unknown,
}

//Function
//final tag = getTheRightProvider(ref, type);
//Create a giant switch statement to return the right provider
getTheRightProvider(ref, type) {
  switch (type) {
    case LeafType.throne:
      return ref.watch(throneProvider);
    case LeafType.additionLeaf:
      return ref.watch(additionLeafProvider);
    case LeafType.additionLeaf1:
      return ref.watch(additionLeaf1Provider);
    case LeafType.additionLeaf2:
      return ref.watch(additionLeaf2Provider);
    case LeafType.additionLeaf3:
      return ref.watch(additionLeaf3Provider);
    case LeafType.additionLeaf4:
      return ref.watch(additionLeaf4Provider);
    case LeafType.additionLeaf5:
      return ref.watch(additionLeaf5Provider);
    case LeafType.additionLeaf6:
      return ref.watch(additionLeaf6Provider);
    case LeafType.subtractionLeaf:
      return ref.watch(subtractionLeafProvider);
    case LeafType.subtractionLeaf1:
      return ref.watch(subtractionLeaf1Provider);
    case LeafType.subtractionLeaf2:
      return ref.watch(subtractionLeaf2Provider);
    case LeafType.subtractionLeaf3:
      return ref.watch(subtractionLeaf3Provider);
    case LeafType.subtractionLeaf4:
      return ref.watch(subtractionLeaf4Provider);
    case LeafType.subtractionLeaf5:
      return ref.watch(subtractionLeaf5Provider);
    case LeafType.subtractionLeaf6:
      return ref.watch(subtractionLeaf6Provider);
    case LeafType.multiplicationLeaf:
      return ref.watch(multiplicationLeafProvider);
    case LeafType.multiplicationLeaf1:
      return ref.watch(multiplicationLeaf1Provider);
    case LeafType.multiplicationLeaf2:
      return ref.watch(multiplicationLeaf2Provider);
    case LeafType.multiplicationLeaf3:
      return ref.watch(multiplicationLeaf3Provider);
    case LeafType.multiplicationLeaf4:
      return ref.watch(multiplicationLeaf4Provider);
    case LeafType.multiplicationLeaf5:
      return ref.watch(multiplicationLeaf5Provider);
    case LeafType.multiplicationLeaf6:
      return ref.watch(multiplicationLeaf6Provider);
    case LeafType.divisionLeaf:
      return ref.watch(divisionLeafProvider);
    case LeafType.divisionLeaf1:
      return ref.watch(divisionLeaf1Provider);
    case LeafType.divisionLeaf2:
      return ref.watch(divisionLeaf2Provider);
    case LeafType.divisionLeaf3:
      return ref.watch(divisionLeaf3Provider);
    case LeafType.divisionLeaf4:
      return ref.watch(divisionLeaf4Provider);
    case LeafType.divisionLeaf5:
      return ref.watch(divisionLeaf5Provider);
    case LeafType.divisionLeaf6:
      return ref.watch(divisionLeaf6Provider);
    case LeafType.squareLeaf:
      return ref.watch(squareLeafProvider);
    case LeafType.squareLeaf1:
      return ref.watch(squareLeaf1Provider);
    case LeafType.squareLeaf2:
      return ref.watch(squareLeaf2Provider);
    case LeafType.squareLeaf3:
      return ref.watch(squareLeaf3Provider);
    case LeafType.squareLeaf4:
      return ref.watch(squareLeaf4Provider);
    case LeafType.squareLeaf5:
      return ref.watch(squareLeaf5Provider);
    case LeafType.squareLeaf6:
      return ref.watch(squareLeaf6Provider);
    case LeafType.squareRootLeaf:
      return ref.watch(squareRootLeafProvider);
    case LeafType.squareRootLeaf1:
      return ref.watch(squareRootLeaf1Provider);
    case LeafType.squareRootLeaf2:
      return ref.watch(squareRootLeaf2Provider);
    case LeafType.squareRootLeaf3:
      return ref.watch(squareRootLeaf3Provider);
    case LeafType.squareRootLeaf4:
      return ref.watch(squareRootLeaf4Provider);
    case LeafType.squareRootLeaf5:
      return ref.watch(squareRootLeaf5Provider);
    case LeafType.squareRootLeaf6:
      return ref.watch(squareRootLeaf6Provider);
    default:
      return null;
  }
}

//Provider
final throneProvider = StateProvider<int?>((ref) => null);

final additionLeafProvider = StateProvider<int?>((ref) => null);
final additionLeaf1Provider = StateProvider<int?>((ref) => null);
final additionLeaf2Provider = StateProvider<int?>((ref) => null);
final additionLeaf3Provider = StateProvider<int?>((ref) => null);
final additionLeaf4Provider = StateProvider<int?>((ref) => null);
final additionLeaf5Provider = StateProvider<int?>((ref) => null);
final additionLeaf6Provider = StateProvider<int?>((ref) => null);

final subtractionLeafProvider = StateProvider<int?>((ref) => null);
final subtractionLeaf1Provider = StateProvider<int?>((ref) => null);
final subtractionLeaf2Provider = StateProvider<int?>((ref) => null);
final subtractionLeaf3Provider = StateProvider<int?>((ref) => null);
final subtractionLeaf4Provider = StateProvider<int?>((ref) => null);
final subtractionLeaf5Provider = StateProvider<int?>((ref) => null);
final subtractionLeaf6Provider = StateProvider<int?>((ref) => null);

final multiplicationLeafProvider = StateProvider<int?>((ref) => null);
final multiplicationLeaf1Provider = StateProvider<int?>((ref) => null);
final multiplicationLeaf2Provider = StateProvider<int?>((ref) => null);
final multiplicationLeaf3Provider = StateProvider<int?>((ref) => null);
final multiplicationLeaf4Provider = StateProvider<int?>((ref) => null);
final multiplicationLeaf5Provider = StateProvider<int?>((ref) => null);
final multiplicationLeaf6Provider = StateProvider<int?>((ref) => null);

final divisionLeafProvider = StateProvider<int?>((ref) => null);
final divisionLeaf1Provider = StateProvider<int?>((ref) => null);
final divisionLeaf2Provider = StateProvider<int?>((ref) => null);
final divisionLeaf3Provider = StateProvider<int?>((ref) => null);
final divisionLeaf4Provider = StateProvider<int?>((ref) => null);
final divisionLeaf5Provider = StateProvider<int?>((ref) => null);
final divisionLeaf6Provider = StateProvider<int?>((ref) => null);

final squareLeafProvider = StateProvider<int?>((ref) => null);
final squareLeaf1Provider = StateProvider<int?>((ref) => null);
final squareLeaf2Provider = StateProvider<int?>((ref) => null);
final squareLeaf3Provider = StateProvider<int?>((ref) => null);
final squareLeaf4Provider = StateProvider<int?>((ref) => null);
final squareLeaf5Provider = StateProvider<int?>((ref) => null);
final squareLeaf6Provider = StateProvider<int?>((ref) => null);

final squareRootLeafProvider = StateProvider<int?>((ref) => null);
final squareRootLeaf1Provider = StateProvider<int?>((ref) => null);
final squareRootLeaf2Provider = StateProvider<int?>((ref) => null);
final squareRootLeaf3Provider = StateProvider<int?>((ref) => null);
final squareRootLeaf4Provider = StateProvider<int?>((ref) => null);
final squareRootLeaf5Provider = StateProvider<int?>((ref) => null);
final squareRootLeaf6Provider = StateProvider<int?>((ref) => null);
