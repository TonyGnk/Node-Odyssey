import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_tree.dart';
import 'providers_tree.dart';
import '../constants.dart';

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(0.7),
        decoration: tag != null ? decoration(context) : decorationNull(context),
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

decoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
      borderRadius: const BorderRadius.all(Radius.circular(cornerSize)),
    );
decorationNull(BuildContext context) => BoxDecoration(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
      borderRadius: const BorderRadius.all(Radius.circular(cornerSize)),
      border: Border.all(
        width: 1,
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      ),
    );
