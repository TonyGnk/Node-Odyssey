import 'package:flutter/material.dart';

import '../container_tree.dart';
import 'new_tree.dart';

cleanTreeBox(double width) => Expanded(
      flex: width.toInt(),
      child: const SizedBox(
          //width: width,
          //height: 30,
          //color: getRandomColor(),
          ),
    );

borderTree() => Expanded(
      flex: gapWidth.toInt(),
      child: Container(
        //width: gapWidth,
        //height: 30,
        color: Colors.white,
      ),
    );

cleanTreeBoxTop(double width) => Expanded(
      flex: width.toInt(),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white, width: 1),
          ),
        ),
      ),
    );

row0() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(16 * nodeWidth + 15 * gapWidth), //
        //
        borderTree(),
        //
        cleanTreeBox(16 * nodeWidth + 15 * gapWidth), //
      ],
    );

row00() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(15 * nodeWidth + 15 * gapWidth), //
        //
        const Leaf(),
        //
        cleanTreeBox(15 * nodeWidth + 15 * gapWidth), //
      ],
    );
