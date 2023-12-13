import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Services/six_calculations.dart';
import '../../../Services/tracking_container.dart';
import '../Result Panel BF/result_box_bf.dart';

final resultPanelList = StateProvider<List<ResultBoxBf>>(
  (ref) => [],
);

void addResultPanelList(
  WidgetRef ref,
  List<Node>? solution,
) {
//
  if (solution == null) {
    ref.read(resListProvider.notifier).state.addTile(
          0,
          'Δεν υπάρχει λύση',
          ref,
        );
  } else {
    for (int i = 0; i < solution.length; i++) {
      ref.read(resListProvider.notifier).state.addTile(
            solution[i].value,
            solution[i].operation,
            ref,
          );
    }
  }
}

final resListProvider = StateProvider<TrackingList>(
  (ref) => TrackingList(),
);

//Clear resListProvider
// void clearResListProvider(WidgetRef ref) {
//   ref.read(resListProvider.notifier).state = TrackingList();
// }