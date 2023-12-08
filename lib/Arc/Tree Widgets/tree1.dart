// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../container_tree.dart';
import 'new_tree.dart';
import 'providers_tree.dart';
import 'tree_helpler.dart';

row1() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth), //
        borderTree(),
        cleanTreeBoxTop(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBoxTop(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        //
        cleanTreeBoxTop(8 * nodeWidth + 7 * gapWidth),
        //
        borderTree(),
        cleanTreeBoxTop(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBoxTop(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth), //
      ],
    );

row2() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(3 * nodeWidth + 3 * gapWidth), //
        Leaf(
          type: LeafType.additionLeaf,
        ),
        cleanTreeBox(3 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        //
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        //
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(3 * nodeWidth + 3 * gapWidth),
        Leaf(type: LeafType.squareRootLeaf),
        cleanTreeBox(3 * nodeWidth + 3 * gapWidth), //
      ],
    );

row3() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth), //
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        //
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        //
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth), //
      ],
    );

row4() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cleanTreeBox(nodeWidth), //
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        //
        cleanTreeBoxTop(2 * nodeWidth + gapWidth),
        //
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        //
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        //
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        //
        cleanTreeBoxTop(2 * nodeWidth + gapWidth),
        //
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBoxTop(nodeWidth),
        borderTree(),
        cleanTreeBox(nodeWidth), //
      ],
    );

row5() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Leaf(type: LeafType.additionLeaf1),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        //
        cleanTreeBox(2 * nodeWidth + gapWidth),
        //
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        Leaf(type: LeafType.squareRootLeaf1),
        //
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        cleanTreeBox(8 * nodeWidth + 7 * gapWidth),
        borderTree(),
        cleanTreeBox(4 * nodeWidth + 3 * gapWidth),
        borderTree(),
        //
        Leaf(type: LeafType.additionLeaf6),
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        //
        cleanTreeBox(2 * nodeWidth + gapWidth),
        //
        borderTree(),
        cleanTreeBox(nodeWidth),
        borderTree(),
        Leaf(type: LeafType.squareRootLeaf6),
      ],
    );
