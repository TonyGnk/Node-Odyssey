import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Tree Widgets/new_tree.dart';

class Leaf extends StatelessWidget {
  const Leaf({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        flex: (nodeWidth * 2 + gapWidth).toInt(),
        child: Container(
          decoration: decoration(),
        ),
      );
}

decoration() => const BoxDecoration(
      color: Colors.yellow,
      shape: BoxShape.circle,
    );

class LeafThrone extends ConsumerWidget {
  const LeafThrone({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final throne = ref.watch(throneProvider);
    return Expanded(
      flex: (nodeWidth * 2 + gapWidth).toInt(),
      child: Container(
          decoration: decoration(),
          child: Center(
            child: Text(
              throne != null ? throne.toString() : '',
              style: const TextStyle(
                color: Colors.black,
                //fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
    );
  }
}

//Integer Provider
final throneProvider = StateProvider<int?>((ref) => null);
