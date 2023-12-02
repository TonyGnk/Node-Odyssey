import 'package:flutter_riverpod/flutter_riverpod.dart';

final oneUi = StateProvider<bool>((ref) => true);

//Create a provider for a List of Strings
// final textListProvider = StateProvider<List<String>>((ref) => []);

//Create a method increasing the list with one more given String
// void addText(String text, WidgetRef ref) {
//   ref.watch(textListProvider.notifier).state.add(text);
// }

final textProvider = StateProvider<String>((ref) => '');
