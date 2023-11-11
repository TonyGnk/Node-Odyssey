import 'package:flutter/material.dart';

import 'container_tree.dart';

//Create a const variable width 30
const double circleWidth = 40;

class Tree extends StatelessWidget {
  const Tree({super.key});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.03),
        child: const Node(),
      );
}

class Node extends StatelessWidget {
  const Node({super.key});

  @override
  Widget build(BuildContext context) => Column(children: [
        node,
        Container(
          child: row2(context),
        ),
        Container(
          child: row3(context),
        ),
        Container(
          child: row4(context),
        ),
        Container(
          child: row5(context),
        ),
        Container(
          child: row6,
        ),
      ]);
}

Row row2(BuildContext context) => const Row(
      children: [
        TreeBox(
          width: circleWidth / 2,
          height: circleWidth,
          rightSide: true,
          number: 1,
        ),
        TreeBox(
          width: circleWidth / 2,
          height: circleWidth,
          leftSide: true,
          number: 2,
        ),
      ],
    );

Row row3(BuildContext context) => const Row(
      children: [
        TreeBox(
          width: circleWidth * 6 + circleWidth + circleWidth / 4 * 5,
          height: circleWidth,
          rightSide: true,
          leftSide: true,
          topSide: true,
          number: 3,
        ),
        TreeBox(
          width: circleWidth * 6 + circleWidth + circleWidth / 4 * 5,
          height: circleWidth,
          rightSide: true,
          leftSide: true,
          topSide: true,
          number: 4,
        ),
        TreeBox(
          width: circleWidth * 6 + circleWidth + circleWidth / 4 * 5,
          height: circleWidth,
          leftSide: true,
          rightSide: true,
          topSide: true,
          number: 5,
        ),
        TreeBox(
          width: circleWidth * 6 + circleWidth + circleWidth / 4 * 5,
          height: circleWidth,
          leftSide: true,
          rightSide: true,
          topSide: true,
          number: 6,
        ),
        TreeBox(
          width: circleWidth * 6 + circleWidth + circleWidth / 4 * 5,
          height: circleWidth,
          rightSide: true,
          leftSide: true,
          topSide: true,
          number: 7,
        ),
      ],
    );

Row row4(BuildContext context) => Row(
      children: [
        node,
        const TreeBox(
          width: circleWidth * 6 + circleWidth / 4 * 5,
          height: circleWidth,
          number: 8,
        ),
        node,
        const TreeBox(
          width: circleWidth * 6 + circleWidth / 4 * 5,
          height: circleWidth,
          number: 9,
        ),
        node,
        const TreeBox(
          width: circleWidth * 6 + circleWidth / 4 * 5,
          height: circleWidth,
          number: 10,
        ),
        node,
        const TreeBox(
          width: circleWidth * 6 + circleWidth / 4 * 5,
          height: circleWidth,
          number: 11,
        ),
        node,
        const TreeBox(
          width: circleWidth * 6 + circleWidth / 4 * 5,
          height: circleWidth,
          number: 12,
        ),
        node,
      ],
    );

Row row5(BuildContext context) => const Row(
      children: [
        TreeBox(
          width: circleWidth + circleWidth * 6 + circleWidth / 4 * 5,
          height: circleWidth,
          rightSide: true,
          leftSide: true,
          number: 13,
        ),
        TreeBox(
          width: circleWidth + circleWidth * 6 + circleWidth / 4 * 5,
          height: circleWidth,
          rightSide: true,
          leftSide: true,
          number: 14,
        ),
        TreeBox(
          width: circleWidth + circleWidth * 6 + circleWidth / 4 * 5,
          height: circleWidth,
          leftSide: true,
          rightSide: true,
          number: 15,
        ),
        TreeBox(
          width: circleWidth + circleWidth * 6 + circleWidth / 4 * 5,
          height: circleWidth,
          leftSide: true,
          rightSide: true,
          number: 16,
        ),
        TreeBox(
          width: circleWidth + circleWidth * 6 + circleWidth / 4 * 5,
          height: circleWidth,
          rightSide: true,
          leftSide: true,
          number: 17,
        ),
      ],
    );

Row row6 = Row(children: [
  Container(
    child: nRow1(),
  ),
  Container(
    child: nRow1(),
  ),
  Container(
    child: nRow1(),
  ),
  Container(
    child: nRow1(),
  ),
  Container(
    child: nRow1(),
  ),
]);

Row nRow1() => Row(children: [
      const TreeBox(width: circleWidth / 8, number: 20),
      node,
      const TreeBox(width: circleWidth / 4, number: 20),
      node,
      const TreeBox(width: circleWidth / 4, number: 20),
      node,
      const TreeBox(width: circleWidth, number: 20),
      node,
      const TreeBox(width: circleWidth / 4, number: 20),
      node,
      const TreeBox(width: circleWidth / 4, number: 20),
      node,
      const TreeBox(width: circleWidth / 8, number: 20),
    ]);
