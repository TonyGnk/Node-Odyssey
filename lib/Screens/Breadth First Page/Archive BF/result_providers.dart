import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Algorithms/Breadth First/algorithm_bf.dart';
import '../Result Panel BF/result_box_bf.dart';

final resultPanelList = StateProvider<List<ResultBoxBf>>(
  (ref) => [],
);

void clearResultPanelList(WidgetRef ref) {
  ref.read(resultPanelList.notifier).state = [];
}

void addResultPanelList(
  WidgetRef ref,
  String title,
  List<Node> solution,
) {
  List<ResultBoxBf>? list = ref.watch(resultPanelList);
  if (list == null) {
    ref.read(resultPanelList.notifier).state = [
      ResultBoxBf(
        title: title,
        solution: solution,
      ),
    ];
  } else {
    ref.read(resultPanelList.notifier).state.add(
          ResultBoxBf(
            title: title,
            solution: solution,
          ),
        );
  }
}

void noSolutions(WidgetRef ref) {
  // addResultPanelList(ref, 'Δεν υπάρχουν λύσεις.', '', '', true);
}

//Create an empty provider for a TextButton
final textButtonProviderR = StateProvider<Widget>(
  (ref) => const SizedBox(),
);
