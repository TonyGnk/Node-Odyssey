import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../six_calculations.dart';
import 'providers_tree.dart';

bool throneDone = false;
bool kingsDone = false;
bool leafsDone = false;

starTree(WidgetRef ref, Node current) {
  if (!throneDone) {
    ref.read(throneProvider.notifier).state = current.value;
    throneDone = true;
  } else {
    if (!kingsDone) {
      setKings(ref, current, true);
      kingsDone = true;
    } else {
      if (!leafsDone) {
        setLeafs(ref, current, true);
        leafsDone = true;
      } else {
        // ref.read(throneProvider.notifier).state = current.value;
        // clearKings(ref);
        // clearLeafs(ref);
        kingsDone = false;
        leafsDone = false;
      }
    }
  }
}

setKings(WidgetRef ref, Node current, bool enable) {
  switch (current.operation) {
    case 'Increase':
      ref.read(additionLeafProvider.notifier).state =
          enable ? current.value : null;
    case 'Decrease':
      ref.read(subtractionLeafProvider.notifier).state =
          enable ? current.value : null;
    case 'Double':
      ref.read(multiplicationLeafProvider.notifier).state =
          enable ? current.value : null;
    case 'Half':
      ref.read(divisionLeafProvider.notifier).state =
          enable ? current.value : null;
    case 'Square':
      ref.read(squareLeafProvider.notifier).state =
          enable ? current.value : null;
    case 'Root':
      ref.read(squareRootLeafProvider.notifier).state =
          enable ? current.value : null;
  }
}

clearKings(WidgetRef ref) {
  ref.read(additionLeafProvider.notifier).state = null;
  ref.read(subtractionLeafProvider.notifier).state = null;
  ref.read(multiplicationLeafProvider.notifier).state = null;
  ref.read(divisionLeafProvider.notifier).state = null;
  ref.read(squareLeafProvider.notifier).state = null;
  ref.read(squareRootLeafProvider.notifier).state = null;
}

setLeafs(WidgetRef ref, Node current, bool enable) {
  switch (current.parent!.operation) {
    case 'Increase':
      switch (current.operation) {
        case 'Increase':
          ref.read(additionLeaf1Provider.notifier).state =
              enable ? current.value : null;
        case 'Decrease':
          ref.read(subtractionLeaf1Provider.notifier).state =
              enable ? current.value : null;
        case 'Double':
          ref.read(multiplicationLeaf1Provider.notifier).state =
              enable ? current.value : null;
        case 'Half':
          ref.read(divisionLeaf1Provider.notifier).state =
              enable ? current.value : null;
        case 'Square':
          ref.read(squareLeaf1Provider.notifier).state =
              enable ? current.value : null;
        case 'Root':
          ref.read(squareRootLeaf1Provider.notifier).state =
              enable ? current.value : null;
      }
  }
}
