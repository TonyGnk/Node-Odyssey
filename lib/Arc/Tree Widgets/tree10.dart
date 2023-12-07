import 'package:flutter/material.dart';

import '../container_tree.dart';
import 'new_tree.dart';
import 'tree_helpler.dart';

row14() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(11 * nodeWidth + 11 * gapWidth), //
        const Leaf(),
        //
        cleanTreeBox(6 * nodeWidth + 7 * gapWidth),
        //
        const Leaf(),
        cleanTreeBox(11 * nodeWidth + 11 * gapWidth), //
      ],
    );

row15() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(12 * nodeWidth + 11 * gapWidth), //
        borderTree(),
        //
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        //
        borderTree(),
        cleanTreeBox(12 * nodeWidth + 11 * gapWidth), //
      ],
    );

row16() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(9 * nodeWidth + 8 * gapWidth), //
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(2 * nodeWidth + gapWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        //
        cleanTreeBox(2 * nodeWidth + gapWidth),
        //
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(2 * nodeWidth + gapWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBox(9 * nodeWidth + 8 * gapWidth), //
      ],
    );

row17() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(8 * nodeWidth + 8 * gapWidth), //
        const Leaf(),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        const Leaf(),
        //
        cleanTreeBox(gapWidth),
        //
        const Leaf(),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        const Leaf(),
        cleanTreeBox(8 * nodeWidth + 8 * gapWidth), //
      ],
    );

row18() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(9 * nodeWidth + 9 * gapWidth), //
        const Leaf(),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        const Leaf(),
        //
        cleanTreeBox(2 * nodeWidth + 3 * gapWidth),
        //
        const Leaf(),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        const Leaf(),
        cleanTreeBox(9 * nodeWidth + 9 * gapWidth), //
      ],
    );

row19() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(10 * nodeWidth + 10 * gapWidth), //
        const Leaf(),
        cleanTreeBox(gapWidth),
        const Leaf(),
        //
        cleanTreeBox(4 * nodeWidth + 5 * gapWidth),
        //
        const Leaf(),
        cleanTreeBox(gapWidth),
        const Leaf(),
        cleanTreeBox(10 * nodeWidth + 10 * gapWidth), //
      ],
    );
