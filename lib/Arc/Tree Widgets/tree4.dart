import 'package:flutter/material.dart';

import '../container_tree.dart';
import 'new_tree.dart';
import 'tree_helpler.dart';

row6() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(nodeWidth + gapWidth), //
        const Leaf(),
        borderTree(),
        //
        cleanTreeBox(2 * nodeWidth + gapWidth),
        //
        borderTree(),
        const Leaf(),
        cleanTreeBox(nodeWidth + gapWidth),
        //
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        //
        cleanTreeBox(nodeWidth + gapWidth),
        const Leaf(),
        borderTree(),
        //
        cleanTreeBox(2 * nodeWidth + gapWidth),
        //
        borderTree(),
        const Leaf(),
        cleanTreeBox(nodeWidth + gapWidth), //
      ],
    );

row7() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(2 * nodeWidth + 2 * gapWidth), //
        const Leaf(),
        cleanTreeBox(gapWidth),
        const Leaf(),
        cleanTreeBox(2 * nodeWidth + 2 * gapWidth),
        //
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        //
        cleanTreeBox(2 * nodeWidth + 2 * gapWidth),
        const Leaf(),
        cleanTreeBox(gapWidth),

        const Leaf(),
        cleanTreeBox(2 * nodeWidth + 2 * gapWidth), //
      ],
    );

row8() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(7 * nodeWidth + 7 * gapWidth), //
        const Leaf(),
        //
        cleanTreeBox(3 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),

        borderTree(),
        cleanTreeBox(3 * nodeWidth + 3 * gapWidth),
        //
        const Leaf(),
        cleanTreeBox(7 * nodeWidth + 7 * gapWidth), //
      ],
    );

row9() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
        //
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        //
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
      ],
    );
