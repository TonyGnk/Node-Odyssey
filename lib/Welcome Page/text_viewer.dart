import 'package:flutter/material.dart';

class terminalViewer extends StatefulWidget {
  terminalViewer({
    required this.textList,
    super.key,
  });

  List<String> textList;

  @override
  State<terminalViewer> createState() => _terminalViewerState();
}

class _terminalViewerState extends State<terminalViewer> {
  @override
  Widget build(BuildContext context) => Container(
        child: Expanded(
          child: ListView.builder(
            itemCount: widget.textList.length,
            itemBuilder: (context, index) => Text(widget.textList[index]),
          ),
        ),
      );

  //Create the adder for the text widget
  void addText(String text) {
    setState(
      () {
        widget.textList.add(text);
      },
    );
  }
}

//This is a terminal, is a listview of all Text table. Has a method to add a new text widget and then setState and vouala 
