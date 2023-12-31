import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/constants.dart';
import 'terminal_providers.dart';
import 'terminal_functions.dart';
import 'state_terminal.dart';

class TerminalSide extends ConsumerStatefulWidget {
  const TerminalSide({super.key});

  @override
  ConsumerState<TerminalSide> createState() => _TerminalSideState();
}

class _TerminalSideState extends ConsumerState<TerminalSide> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      terminalReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: animatedColumn(
          Column(
            children: [
              centerAppBarText('Terminal'),
              const SizedBox(height: 40),
              Expanded(child: textFieldContainer()),
              const SizedBox(height: 10),
              informationBox(),
            ],
          ),
        ),
      );
}

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
      color: Colors.grey.withOpacity(0.1),
      border: Border.all(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(14),
    );

contentOfTerminal() => Consumer(builder: (context, WidgetRef ref, __) {
      final terminalContent = ref.watch(terminalOutput);
      return ListView(
        dragStartBehavior: DragStartBehavior.down,
        children: [
          terminalText(terminalContent),
          textField(),
        ],
      );
    });

textField() => Consumer(
      builder: (context, WidgetRef ref, __) => TextField(
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
          fontSize: 15,
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
}

informationBox() => Consumer(
      builder: (context, WidgetRef ref, __) => Container(
        height: 42,
        decoration: boxDecoration(context),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SelectionArea(
            child: Row(
              children: [
                const SizedBox(width: 10),
                //Icon info
                Icon(
                  Icons.help_outline_outlined,
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 22,
                ),
                const SizedBox(width: 10),
                //Text info
                // ignore: prefer_const_constructors

                const Text(
                  'Try to run ',
                  style: TextStyle(fontSize: 14, fontFamily: 'Play'),
                ),

                Text(
                  'breadth 10 150',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Play',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const Text(
                  ' or ',
                  style: TextStyle(fontSize: 14, fontFamily: 'Play'),
                ),
                Text(
                  'register.exe depth 5 30',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Play',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
