import 'package:flutter/material.dart';

import '../../Arc/container_tree.dart';
import 'tree_container.dart';
import 'providers_tree.dart';
import 'tree_helpler.dart';

row6() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(nodeWidth + gapWidth), //
        const Leaf(type: LeafType.subtractionLeaf1),
        borderTree(),
        //
        cleanTreeBox(2 * nodeWidth + gapWidth),
        //
        borderTree(),
        const Leaf(type: LeafType.squareLeaf1),
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
        const Leaf(type: LeafType.subtractionLeaf6),
        borderTree(),
        //
        cleanTreeBox(2 * nodeWidth + gapWidth),
        //
        borderTree(),
        const Leaf(type: LeafType.squareLeaf6),
        cleanTreeBox(nodeWidth + gapWidth), //
      ],
    );

row7() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(2 * nodeWidth + 2 * gapWidth), //
        const Leaf(
          type: LeafType.multiplicationLeaf1,
        ),
        cleanTreeBox(gapWidth),
        const Leaf(
          type: LeafType.divisionLeaf1,
        ),
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
        const Leaf(
          type: LeafType.multiplicationLeaf6,
        ),
        cleanTreeBox(gapWidth),
        const Leaf(
          type: LeafType.divisionLeaf6,
        ),
        cleanTreeBox(2 * nodeWidth + 2 * gapWidth), //
      ],
    );

row8() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(7 * nodeWidth + 7 * gapWidth), //
        const Leaf(type: LeafType.subtractionLeaf),
        //
        cleanTreeBox(3 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),

        borderTree(),
        cleanTreeBox(3 * nodeWidth + 3 * gapWidth),
        //
        const Leaf(type: LeafType.squareLeaf),
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
