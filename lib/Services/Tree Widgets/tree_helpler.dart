import 'package:flutter/material.dart';

import '../../Arc/container_tree.dart';
import 'main_tree.dart';
import 'providers_tree.dart';

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
        const Leaf(type: LeafType.throne),
        //
        cleanTreeBox(15 * nodeWidth + 15 * gapWidth), //
      ],
    );

setKingLeafs(List<int?> list, ref) {
  ref.read(additionLeafProvider.notifier).state = list[0];
  ref.read(subtractionLeafProvider.notifier).state = list[1];
  ref.read(multiplicationLeafProvider.notifier).state = list[2];
  ref.read(divisionLeafProvider.notifier).state = list[3];
  ref.read(squareLeafProvider.notifier).state = list[4];
  ref.read(squareRootLeafProvider.notifier).state = list[5];
}

setLeafs(List<List<int?>> list, ref) {
  ref.read(additionLeaf1Provider.notifier).state = list[0][0];
  ref.read(additionLeaf2Provider.notifier).state = list[0][1];
  ref.read(additionLeaf3Provider.notifier).state = list[0][2];
  ref.read(additionLeaf4Provider.notifier).state = list[0][3];
  ref.read(additionLeaf5Provider.notifier).state = list[0][4];
  ref.read(additionLeaf6Provider.notifier).state = list[0][5];

  ref.read(subtractionLeaf1Provider.notifier).state = list[1][0];
  ref.read(subtractionLeaf2Provider.notifier).state = list[1][1];
  ref.read(subtractionLeaf3Provider.notifier).state = list[1][2];
  ref.read(subtractionLeaf4Provider.notifier).state = list[1][3];
  ref.read(subtractionLeaf5Provider.notifier).state = list[1][4];
  ref.read(subtractionLeaf6Provider.notifier).state = list[1][5];

  ref.read(multiplicationLeaf1Provider.notifier).state = list[2][0];
  ref.read(multiplicationLeaf2Provider.notifier).state = list[2][1];
  ref.read(multiplicationLeaf3Provider.notifier).state = list[2][2];
  ref.read(multiplicationLeaf4Provider.notifier).state = list[2][3];
  ref.read(multiplicationLeaf5Provider.notifier).state = list[2][4];
  ref.read(multiplicationLeaf6Provider.notifier).state = list[2][5];

  ref.read(divisionLeaf1Provider.notifier).state = list[3][0];
  ref.read(divisionLeaf2Provider.notifier).state = list[3][1];
  ref.read(divisionLeaf3Provider.notifier).state = list[3][2];
  ref.read(divisionLeaf4Provider.notifier).state = list[3][3];
  ref.read(divisionLeaf5Provider.notifier).state = list[3][4];
  ref.read(divisionLeaf6Provider.notifier).state = list[3][5];

  ref.read(squareLeaf1Provider.notifier).state = list[4][0];
  ref.read(squareLeaf2Provider.notifier).state = list[4][1];
  ref.read(squareLeaf3Provider.notifier).state = list[4][2];
  ref.read(squareLeaf4Provider.notifier).state = list[4][3];
  ref.read(squareLeaf5Provider.notifier).state = list[4][4];
  ref.read(squareLeaf6Provider.notifier).state = list[4][5];

  ref.read(squareRootLeaf1Provider.notifier).state = list[5][0];
  ref.read(squareRootLeaf2Provider.notifier).state = list[5][1];
  ref.read(squareRootLeaf3Provider.notifier).state = list[5][2];
  ref.read(squareRootLeaf4Provider.notifier).state = list[5][3];
  ref.read(squareRootLeaf5Provider.notifier).state = list[5][4];
  ref.read(squareRootLeaf6Provider.notifier).state = list[5][5];
}

clearLeafs(ref) {
  ref.read(additionLeaf1Provider.notifier).state = null;
  ref.read(additionLeaf2Provider.notifier).state = null;
  ref.read(additionLeaf3Provider.notifier).state = null;
  ref.read(additionLeaf4Provider.notifier).state = null;
  ref.read(additionLeaf5Provider.notifier).state = null;
  ref.read(additionLeaf6Provider.notifier).state = null;

  ref.read(subtractionLeaf1Provider.notifier).state = null;
  ref.read(subtractionLeaf2Provider.notifier).state = null;
  ref.read(subtractionLeaf3Provider.notifier).state = null;
  ref.read(subtractionLeaf4Provider.notifier).state = null;
  ref.read(subtractionLeaf5Provider.notifier).state = null;
  ref.read(subtractionLeaf6Provider.notifier).state = null;

  ref.read(multiplicationLeaf1Provider.notifier).state = null;
  ref.read(multiplicationLeaf2Provider.notifier).state = null;
  ref.read(multiplicationLeaf3Provider.notifier).state = null;
  ref.read(multiplicationLeaf4Provider.notifier).state = null;
  ref.read(multiplicationLeaf5Provider.notifier).state = null;
  ref.read(multiplicationLeaf6Provider.notifier).state = null;

  ref.read(divisionLeaf1Provider.notifier).state = null;
  ref.read(divisionLeaf2Provider.notifier).state = null;
  ref.read(divisionLeaf3Provider.notifier).state = null;
  ref.read(divisionLeaf4Provider.notifier).state = null;
  ref.read(divisionLeaf5Provider.notifier).state = null;
  ref.read(divisionLeaf6Provider.notifier).state = null;

  ref.read(squareLeaf1Provider.notifier).state = null;
  ref.read(squareLeaf2Provider.notifier).state = null;
  ref.read(squareLeaf3Provider.notifier).state = null;
  ref.read(squareLeaf4Provider.notifier).state = null;
  ref.read(squareLeaf5Provider.notifier).state = null;
  ref.read(squareLeaf6Provider.notifier).state = null;

  ref.read(squareRootLeaf1Provider.notifier).state = null;
  ref.read(squareRootLeaf2Provider.notifier).state = null;
  ref.read(squareRootLeaf3Provider.notifier).state = null;
  ref.read(squareRootLeaf4Provider.notifier).state = null;
  ref.read(squareRootLeaf5Provider.notifier).state = null;
  ref.read(squareRootLeaf6Provider.notifier).state = null;
}
