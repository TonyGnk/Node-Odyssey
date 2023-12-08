import 'package:flutter/material.dart';

import '../container_tree.dart';
import 'new_tree.dart';
import 'providers_tree.dart';
import 'tree_helpler.dart';

row14() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(11 * nodeWidth + 11 * gapWidth), //
        const Leaf(type: LeafType.multiplicationLeaf),
        //
        cleanTreeBox(6 * nodeWidth + 7 * gapWidth),
        //
        const Leaf(type: LeafType.divisionLeaf),
        cleanTreeBox(11 * nodeWidth + 11 * gapWidth), //
      ],
    );
//await Future.delayed(Duration(seconds: speed + 1));

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
        const Leaf(type: LeafType.additionLeaf3),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        const Leaf(type: LeafType.squareRootLeaf3),
        //
        cleanTreeBox(gapWidth),
        //
        const Leaf(type: LeafType.additionLeaf4),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        const Leaf(type: LeafType.squareRootLeaf4),
        cleanTreeBox(8 * nodeWidth + 8 * gapWidth), //
      ],
    );

row18() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(9 * nodeWidth + 9 * gapWidth), //
        const Leaf(type: LeafType.subtractionLeaf3),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        const Leaf(type: LeafType.squareLeaf3),
        //
        cleanTreeBox(2 * nodeWidth + 3 * gapWidth),
        //
        const Leaf(type: LeafType.subtractionLeaf4),
        borderTree(),
        cleanTreeBox(2 * nodeWidth + gapWidth),
        borderTree(),
        const Leaf(type: LeafType.squareLeaf4),
        cleanTreeBox(9 * nodeWidth + 9 * gapWidth), //
      ],
    );

row19() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(10 * nodeWidth + 10 * gapWidth), //
        const Leaf(type: LeafType.multiplicationLeaf3),
        cleanTreeBox(gapWidth),
        const Leaf(type: LeafType.divisionLeaf3),
        //
        cleanTreeBox(4 * nodeWidth + 5 * gapWidth),
        //
        const Leaf(type: LeafType.multiplicationLeaf4),
        cleanTreeBox(gapWidth),
        const Leaf(type: LeafType.divisionLeaf4),
        cleanTreeBox(10 * nodeWidth + 10 * gapWidth), //
      ],
    );
