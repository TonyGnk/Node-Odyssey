import 'package:flutter/material.dart';

import '../container_tree.dart';
import 'new_tree.dart';
import 'tree_helpler.dart';

row10() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(5 * nodeWidth + 4 * gapWidth), //
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
        cleanTreeBox(nodeWidth),
        borderTree(),
        //
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        //
        borderTree(),
        cleanTreeBox(nodeWidth),
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
        cleanTreeBox(5 * nodeWidth + 4 * gapWidth), //
      ],
    );

row11() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(4 * nodeWidth + 4 * gapWidth), //
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
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
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
        cleanTreeBox(4 * nodeWidth + 4 * gapWidth), //
      ],
    );

row12() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(5 * nodeWidth + 5 * gapWidth), //
        const Leaf(),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        const Leaf(),
        cleanTreeBox(nodeWidth + gapWidth),
        //
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
        //
        cleanTreeBox(nodeWidth + gapWidth),
        const Leaf(),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        const Leaf(),
        cleanTreeBox(5 * nodeWidth + 5 * gapWidth), //
      ],
    );

row13() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(6 * nodeWidth + 6 * gapWidth), //
        const Leaf(),
        cleanTreeBox(gapWidth),
        const Leaf(),
        cleanTreeBox(2 * nodeWidth + 2 * gapWidth),
        //
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
        //
        cleanTreeBox(2 * nodeWidth + 2 * gapWidth),
        const Leaf(),
        cleanTreeBox(gapWidth),
        const Leaf(),
        cleanTreeBox(6 * nodeWidth + 6 * gapWidth), //
      ],
    );
