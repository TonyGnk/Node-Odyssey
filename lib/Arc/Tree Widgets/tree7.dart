import 'package:flutter/material.dart';

import '../container_tree.dart';
import 'new_tree.dart';
import 'providers_tree.dart';
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
        const Leaf(type: LeafType.additionLeaf2),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        const Leaf(type: LeafType.squareRootLeaf2),
        //
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
        //
        const Leaf(type: LeafType.additionLeaf5),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        const Leaf(type: LeafType.squareRootLeaf5),
        cleanTreeBox(4 * nodeWidth + 4 * gapWidth), //
      ],
    );

row12() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(5 * nodeWidth + 5 * gapWidth), //
        const Leaf(type: LeafType.subtractionLeaf2),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        const Leaf(type: LeafType.squareLeaf2),
        cleanTreeBox(nodeWidth + gapWidth),
        //
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
        //
        cleanTreeBox(nodeWidth + gapWidth),
        const Leaf(type: LeafType.subtractionLeaf5),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        const Leaf(type: LeafType.squareLeaf5),
        cleanTreeBox(5 * nodeWidth + 5 * gapWidth), //
      ],
    );

row13() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(6 * nodeWidth + 6 * gapWidth), //
        const Leaf(type: LeafType.multiplicationLeaf2),
        cleanTreeBox(gapWidth),
        const Leaf(type: LeafType.divisionLeaf2),
        cleanTreeBox(2 * nodeWidth + 2 * gapWidth),
        //
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
        //
        cleanTreeBox(2 * nodeWidth + 2 * gapWidth),
        const Leaf(type: LeafType.multiplicationLeaf5),
        cleanTreeBox(gapWidth),
        const Leaf(type: LeafType.divisionLeaf5),
        cleanTreeBox(6 * nodeWidth + 6 * gapWidth), //
      ],
    );
