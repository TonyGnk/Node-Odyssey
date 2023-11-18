import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/text_editor_provider.dart';
import 'terminal_title.dart';
import 'text_viewer.dart';

Widget terminalSide(BuildContext context) {
  TerminalViewer te = const TerminalViewer();
  TextEditingController controller = TextEditingController();
  // ignore: prefer_expression_function_bodies
  return Consumer(builder: (_, WidgetRef ref, __) {
    //watch the list provider
    //final textList = ref.watch(textProvider);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          terminalTitle(context),
          const SizedBox(height: 20),

          //const Expanded(child: SizedBox()),
          te,
          // ElevatedButton(
          //   onPressed: () => addText('Text2', ref),
          //   child: Text('Προσθήκη Νέου Κειμένου'),
          // ),
          const SizedBox(height: 20),
          //Create a textfield
          const Text('Δοκιμαστικό Πεδίο'),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Προσθήκη Νέου Κειμένου στο TXT και Ender',
              border: OutlineInputBorder(),
            ),
            // addText και μηδενισμός του controller
            onSubmitted: (value) {
              addText(value, ref);

              controller.clear();
              //Also clear the provider
            },
          ),
          const Expanded(child: SizedBox()),
          Text(
            'Τερματικό Εκτός Λειτουργίας',
            style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  });
}
