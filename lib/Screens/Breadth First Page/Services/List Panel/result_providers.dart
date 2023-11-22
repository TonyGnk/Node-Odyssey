import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Archive BF/result_box_bf.dart';

final resultPanelList = StateProvider<List<ResultBoxBf>>(
  (ref) => [],
);

void clearResultPanelList(WidgetRef ref) {
  ref.read(resultPanelList.notifier).state = [];
}

void addResultPanelList(
  WidgetRef ref,
  String title,
  String text,
  String cost,
  bool error,
) {
  List<ResultBoxBf>? list = ref.watch(resultPanelList);
  if (list == null) {
    ref.read(resultPanelList.notifier).state = [
      ResultBoxBf(text: text, title: title, cost: cost, error: error),
    ];
  } else {
    ref.read(resultPanelList.notifier).state.add(
          ResultBoxBf(text: text, title: title, cost: cost, error: error),
        );
  }
}

//Create an empty provider for a TextButton
final textButtonProviderR = StateProvider<Widget>(
  (ref) => const SizedBox(),
);
