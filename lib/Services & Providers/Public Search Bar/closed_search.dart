import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import 'main_search_bf.dart';
import 'submit_function.dart';

closedSearch(BuildContext context, AlgorithmType type) => Row(
      children: [
        inPutFieldBf(context, inputControllerBf, 'Αρχική Τιμή'),
        const SizedBox(width: 6),
        inPutFieldBf(context, targetControllerBf, 'Τελική Τιμή'),
        const SizedBox(width: 6),
        extraButtonBf(),
        const SizedBox(width: 3),
        submitButtonBf(type),
      ],
    );

TextEditingController inputControllerBf = TextEditingController();
TextEditingController targetControllerBf = TextEditingController();

inPutFieldBf(
  BuildContext context,
  TextEditingController controller,
  String hint,
) =>
    Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize - 1),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        ),
        padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
        child: Center(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
      ),
    );

extraButtonBf() => Consumer(builder: (context, WidgetRef ref, __) {
      final makeContainerTaller = ref.watch(makeContainerTallerProvider);
      final showTheExtraOptions = ref.watch(showTheExtraOptionsProvider);
      return IconButton(
        style: modernButtonStyle(context),
        icon: makeContainerTaller
            ? const Icon(Icons.close)
            : const Icon(Icons.tune_outlined),
        onPressed: () {
          makeContainerTaller
              ? ref.watch(makeContainerTallerProvider.notifier).state = false
              : moreOptionsFun(ref);
          showTheExtraOptions
              ? ref.read(showTheExtraOptionsProvider.notifier).state = false
              : null;
        },
      );
    });

modernButtonStyle(BuildContext context) => ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerSize - 1),
        ),
      ),
    );

moreOptionsFun(WidgetRef ref) async {
  ref.read(makeContainerTallerProvider.notifier).state = true;
  await Future.delayed(const Duration(milliseconds: 200));
  ref.read(showTheExtraOptionsProvider.notifier).state = true;
}

Widget submitButtonBf(AlgorithmType type) => Consumer(
      builder: (context, WidgetRef ref, __) => IconButton.filled(
        style: modernButtonStyle(context),
        icon: const Icon(Icons.auto_awesome_outlined),
        onPressed: () => onButtonPressed(ref, type),
      ),
    );
