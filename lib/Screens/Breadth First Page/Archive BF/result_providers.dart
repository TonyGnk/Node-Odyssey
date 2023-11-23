import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Algorithms/Breadth First/algorithm_bf.dart';
import '../../../Services & Providers/tracking_container.dart';
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
//

//full the list with the tracking tiles of solution
  for (int i = 0; i < solution.length; i++) {
    ref.read(resListProvider.notifier).state.addTile(
          solution[i].value,
          solution[i].operation,
          ref,
        );
  }
  for (int i = 0; i < solution.length; i++) {
    ref.read(resListProvider2.notifier).state.addTile(
          solution[i].value,
          solution[i].operation,
          ref,
        );
  }

  //
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

final resListProvider = StateProvider<TrackingList>(
  (ref) => TrackingList(),
);

final resListProvider2 = StateProvider<TrackingList2>(
  (ref) => TrackingList2(),
);

class TrackingList2 extends StatelessWidget {
  TrackingList2({
    super.key,
    this.ref,
    List<SemiTrack>? trackingTiles,
  }) : trackingTiles = trackingTiles ?? [];

  final WidgetRef? ref;
  final List<SemiTrack> trackingTiles;

  @override
  ListView build(BuildContext context) => ListView(
        scrollDirection: Axis.horizontal,
        reverse: false,
        children: [
          //opposite
          //not opposite
          for (int i = 0; i < trackingTiles.length; i++) trackingTiles[i],
        ],
      );

  void clear() {
    trackingTiles.clear();
  }

  void addTile(int value, String operation, WidgetRef ref) {
    trackingTiles.add(
      SemiTrack(
        value: value,
        operation: operation,
      ),
    );
    addTrackingContainerRolling(ref);
  }
}
