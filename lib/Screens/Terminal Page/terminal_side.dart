// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/text_editor_provider.dart';
import 'terminal_helper.dart';
import 'terminal_helpler2.dart';

Widget terminalSide() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          terminalTitle(),
          const SizedBox(height: 16),
          Expanded(child: textFieldContainer()),
        ],
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
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
      border: Border.all(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(14),
    );

contentOfTerminal() => Consumer(builder: (context, WidgetRef ref, __) {
      //final terminalRows = ref.watch(terminalRowsProvider);
      // ignore: unused_local_variable
      final refresh = ref.watch(justForRefreshProvider);
      return ListView(
        children: [
          terminalText(windowsText),
          textField(),
        ],
      );
    });

textField() => Consumer(
      builder: (context, WidgetRef ref, __) => TextField(
        autofocus: true,
        autocorrect: false,
        enableSuggestions: false,
        showCursor: true,
        textAlignVertical: TextAlignVertical.center,
        cursorWidth: 1,
        cursorColor:
            Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
        style: const TextStyle(
          fontFamily: 'Consolas',
          fontSize: 16,
        ),
        controller: ref.watch(controllerProvider),
        decoration: const InputDecoration(border: InputBorder.none),
        onSubmitted: (value) => onSubmittedTextField(ref, value),
      ),
    );

onSubmittedTextField(WidgetRef ref, String value) async {
  ref.read(controllerProvider.notifier).state.text = value;
  analyzeTheText(ref);
  addText(value, ref);
  //controller.clear();
}
