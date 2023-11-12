import 'package:flutter/material.dart';

class terminalTitle extends StatefulWidget {
  terminalTitle(this.context, {super.key});

  BuildContext context;

  @override
  State<terminalTitle> createState() => _terminalTitleState();
}

class _terminalTitleState extends State<terminalTitle> {
  Color? color;
  bool z = true;

  @override
  initState() {
    super.initState();
    color = Theme.of(widget.context).colorScheme.background;
    z = true;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(milliseconds: 300), () => changeColor(context));
    return Column(
      children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 400), height: z ? 30 : 0),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 800),
          style: TextStyle(
            fontSize: 20,
            color: z
                ? Theme.of(widget.context).colorScheme.background
                : Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
          child: const Text('Εργασία Αλγορίθμων 2023-2024'),
        ),
        // ElevatedButton(
        //     onPressed: () => setState(() => z = false), child: Text('Click'))
      ],
    );
  }

  changeColor(BuildContext context) {
    setState(() => z = false);
  }
}
