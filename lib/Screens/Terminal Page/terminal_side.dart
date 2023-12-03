// ignore_for_file: unused_import

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/text_editor_provider.dart';
import 'terminal_helper.dart';
import 'terminal_helpler2.dart';
import 'terminal_state.dart';

Widget terminalSide() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: animatedColumn(
        Column(
          children: [
            terminalTitle(),
            const SizedBox(height: 16),
            Expanded(child: textFieldContainer()),
          ],
        ),
      ),
    );

terminalTitle() => const Text(
      'Terminal',
      style: TextStyle(
        fontSize: 26,
        fontFamily: 'AdventoPro',
      ),
    );

textFieldContainer() => Consumer(
      builder: (context, WidgetRef ref, __) => DecoratedBox(
        decoration: boxDecoration(context),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SelectionArea(
            child: contentOfTerminal(),
          ),
        ),
      ),
    );

boxDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
      border: Border.all(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(14),
    );

contentOfTerminal() => Consumer(builder: (context, WidgetRef ref, __) {
      final terminalContent = ref.watch(terminalContentProvider);
      final scrollController = ref.watch(scrollControllerProvider);
      return ListView(
        //controller: scrollController,
        dragStartBehavior: DragStartBehavior.down,
        children: [
          terminalText(terminalContent),
          textField(),
        ],
      );
    });

textField() => Consumer(
      builder: (context, WidgetRef ref, __) => TextField(
        //autofocus: true,
        focusNode: myFocusNode,
        autocorrect: false,
        enableSuggestions: false,
        showCursor: true,
        textAlignVertical: TextAlignVertical.center,
        cursorWidth: 1,
        scrollPadding: const EdgeInsets.all(0),
        cursorColor:
            Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
        style: const TextStyle(
          fontFamily: 'Consolas',
          fontSize: 16,
        ),
        controller: ref.watch(controllerProvider),
        decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(0),
            isDense: true),
        onSubmitted: (value) => onSubmittedTextField(ref, value),
      ),
    );

onSubmittedTextField(WidgetRef ref, String value) async {
  ref.read(controllerProvider.notifier).state.text = value;
  analyzeTheText(ref);
  addText(value, ref);
  //controller.clear();
}
