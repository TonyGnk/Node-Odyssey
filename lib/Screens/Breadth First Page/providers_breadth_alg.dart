import 'package:flutter_riverpod/flutter_riverpod.dart';

final trackingTextBF = StateProvider<String>(
  (ref) => '',
);

void concatTrackingBF(WidgetRef ref, String text) {
  ref.read(trackingTextBF.notifier).state = '${ref.watch(
    trackingTextBF,
  )}\n$text';
}

void clearTrackingBF(WidgetRef ref) {
  ref.read(trackingTextBF.notifier).state = '';
}
