import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Tree Widgets/new_tree.dart';
import 'Tree Widgets/providers_tree.dart';

class Leaf extends ConsumerWidget {
  const Leaf({
    required this.type,
    super.key,
  });

  final LeafType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tag = getTheRightProvider(ref, type);
    return Expanded(
      flex: (nodeWidth * 2 + gapWidth).toInt(),
      child: DecoratedBox(
        decoration: tag != null ? decoration() : decorationNull(),
        child: Center(
          child: Text(
            tag != null ? tag.toString() : '',
            style: const TextStyle(
              color: Colors.black,
              //fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

decoration() => const BoxDecoration(
      color: Colors.yellow,
      shape: BoxShape.circle,
    );
decorationNull() => BoxDecoration(
      color: Colors.yellow.withOpacity(0.2),
      shape: BoxShape.circle,
    );
