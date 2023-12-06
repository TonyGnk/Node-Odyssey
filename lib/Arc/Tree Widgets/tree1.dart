import 'package:flutter/material.dart';

import '../container_tree.dart';
import 'new_tree.dart';

row1() => const Row(
      children: [
        TreeBox(width: nodeWidth * 3, rightSide: true),
        TreeBox(width: nodeWidth * 3, leftSide: true, rightSide: true),
        TreeBox(width: nodeWidth * 3, leftSide: true, rightSide: true),
        TreeBox(width: nodeWidth * 6, leftSide: true, rightSide: true),
        TreeBox(width: nodeWidth * 3, leftSide: true, rightSide: true),
        TreeBox(width: nodeWidth * 3, leftSide: true, rightSide: true),
        TreeBox(width: nodeWidth * 3, leftSide: true),
      ],
    );
