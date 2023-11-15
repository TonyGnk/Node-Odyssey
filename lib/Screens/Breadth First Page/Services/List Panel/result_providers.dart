import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../result_box_bf.dart';

final resultPanelList = StateProvider<List<ResultBoxBf>>(
  (ref) => [],
);

void clearResultPanelList(WidgetRef ref) {
  ref.read(resultPanelList.notifier).state = [];
}

void addResultPanelList(WidgetRef ref, String title, String text, String cost) {
  List<ResultBoxBf>? list = ref.watch(resultPanelList);
  if (list == null) {
    ref.read(resultPanelList.notifier).state = [
      ResultBoxBf(text: text, title: title, cost: cost),
    ];
  } else {
    ref.read(resultPanelList.notifier).state.add(
          ResultBoxBf(text: text, title: title, cost: cost),
        );
  }
}
