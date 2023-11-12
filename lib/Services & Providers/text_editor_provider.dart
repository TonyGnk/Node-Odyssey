import 'package:flutter_riverpod/flutter_riverpod.dart';

final OneUi = StateProvider<bool>((ref) => true);

//Create a provider for a List of Strings
// final textListProvider = StateProvider<List<String>>((ref) => []);

//Create a method increasing the list with one more given String
// void addText(String text, WidgetRef ref) {
//   ref.watch(textListProvider.notifier).state.add(text);
// }

//Create a provider text
final textProvider = StateProvider<String>((ref) => '');

//Create a function doing concat \n to the text
void addText(String text, WidgetRef ref) {
  ref.watch(textProvider.notifier).state = '${ref.read(textProvider)}\n$text';
}
