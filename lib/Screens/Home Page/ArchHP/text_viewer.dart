import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/text_editor_provider.dart';

class TerminalViewer extends StatefulWidget {
  const TerminalViewer({
    //required this.textList,
    super.key,
  });

  //List<String> textList;

  @override
  State<TerminalViewer> createState() => _TerminalViewerState();
}

class _TerminalViewerState extends State<TerminalViewer> {
  @override
  Widget build(BuildContext context) => Consumer(
        builder: (_, WidgetRef ref, __) {
          String textList = ref.watch(textProvider);
          return Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text('Περιεχόμενο Αρχείου TXT'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () =>
                          ref.read(textProvider.notifier).state = '',
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListView(
                  children: [
                    Text(textList),
                  ],
                ),
              ),
            ],
          );
        },
      );
}