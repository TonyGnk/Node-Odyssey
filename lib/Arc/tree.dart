// import 'package:flutter/material.dart';

// import 'container_tree.dart';

// //Create a const variable width 30
// const double circleWidth = 32;

// class Tree extends StatelessWidget {
//   const Tree({super.key});

//   @override
//   Widget build(BuildContext context) => AnimatedContainer(
//         duration: const Duration(seconds: 1),
//         color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.03),
//         child: const Leaf(),
//       );
// }

// class Leaf extends StatelessWidget {
//   const Leaf({super.key});

//   @override
//   Widget build(BuildContext context) => Column(children: [
//         node,
//         Container(
//           child: row2(context),
//         ),
//         Container(
//           child: row3(context),
//         ),
//         Container(
//           child: row4(context),
//         ),
//         Container(
//           child: row5(context),
//         ),
//         Container(
//           child: row6,
//         ),
//         Container(
//           child: row7,
//         ),
//       ]);
// }

// Row row2(BuildContext context) => const Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TreeBox(
//           width: circleWidth / 2,
//           height: circleWidth,
//           rightSide: true,
//           number: 1,
//         ),
//         TreeBox(
//           width: circleWidth / 2,
//           height: circleWidth,
//           leftSide: true,
//           number: 2,
//         ),
//       ],
//     );

// Row row3(BuildContext context) => const Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TreeBox(
//           width: circleWidth * 6 + circleWidth + circleWidth / 4 * 5,
//           height: circleWidth,
//           rightSide: true,
//           leftSide: true,
//           topSide: true,
//           number: 3,
//         ),
//         TreeBox(
//           width: circleWidth * 6 + circleWidth + circleWidth / 4 * 5,
//           height: circleWidth,
//           rightSide: true,
//           leftSide: true,
//           topSide: true,
//           number: 4,
//         ),
//         TreeBox(
//           width: circleWidth * 6 + circleWidth + circleWidth / 4 * 5,
//           height: circleWidth,
//           leftSide: true,
//           rightSide: true,
//           topSide: true,
//           number: 5,
//         ),
//         TreeBox(
//           width: circleWidth * 6 + circleWidth + circleWidth / 4 * 5,
//           height: circleWidth,
//           leftSide: true,
//           rightSide: true,
//           topSide: true,
//           number: 6,
//         ),
//         TreeBox(
//           width: circleWidth * 6 + circleWidth + circleWidth / 4 * 5,
//           height: circleWidth,
//           rightSide: true,
//           leftSide: true,
//           topSide: true,
//           number: 7,
//         ),
//       ],
//     );

// Row row4(BuildContext context) => Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         node,
//         const TreeBox(
//           width: circleWidth * 6 + circleWidth / 4 * 5,
//           height: circleWidth,
//           number: 8,
//         ),
//         node,
//         const TreeBox(
//           width: circleWidth * 6 + circleWidth / 4 * 5,
//           height: circleWidth,
//           number: 9,
//         ),
//         node,
//         const TreeBox(
//           width: circleWidth * 6 + circleWidth / 4 * 5,
//           height: circleWidth,
//           number: 10,
//         ),
//         node,
//         const TreeBox(
//           width: circleWidth * 6 + circleWidth / 4 * 5,
//           height: circleWidth,
//           number: 11,
//         ),
//         node,
//         const TreeBox(
//           width: circleWidth * 6 + circleWidth / 4 * 5,
//           height: circleWidth,
//           number: 12,
//         ),
//         node,
//       ],
//     );

// Row row5(BuildContext context) => const Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TreeBox(
//           width: circleWidth + circleWidth * 6 + circleWidth / 4 * 5,
//           height: circleWidth,
//           rightSide: true,
//           leftSide: true,
//           number: 13,
//         ),
//         TreeBox(
//           width: circleWidth + circleWidth * 6 + circleWidth / 4 * 5,
//           height: circleWidth,
//           rightSide: true,
//           leftSide: true,
//           number: 14,
//         ),
//         TreeBox(
//           width: circleWidth + circleWidth * 6 + circleWidth / 4 * 5,
//           height: circleWidth,
//           leftSide: true,
//           rightSide: true,
//           number: 15,
//         ),
//         TreeBox(
//           width: circleWidth + circleWidth * 6 + circleWidth / 4 * 5,
//           height: circleWidth,
//           leftSide: true,
//           rightSide: true,
//           number: 16,
//         ),
//         TreeBox(
//           width: circleWidth + circleWidth * 6 + circleWidth / 4 * 5,
//           height: circleWidth,
//           rightSide: true,
//           leftSide: true,
//           number: 17,
//         ),
//       ],
//     );

// Row row6 = const Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
// //-----------------
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         leftSide: true,
//         rightSide: true,
//         topSide: true,
//         number: 18),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 19),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 20),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 21),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 22),
//     //+
//     TreeBox(
//         width: circleWidth * 2,
//         height: circleWidth,
//         rightSide: true,
//         number: 23),
//     //----------
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 24),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 25),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 26),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 27),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 28),
//     //+
//     TreeBox(
//         width: circleWidth * 2,
//         height: circleWidth,
//         rightSide: true,
//         number: 29),
//     //----------
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 30),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 31),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 32),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 33),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 34),
//     //+
//     TreeBox(
//         width: circleWidth * 2,
//         height: circleWidth,
//         rightSide: true,
//         number: 35),
//     //----------
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 36),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 37),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 38),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 39),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 40),
//     //+
//     TreeBox(
//         width: circleWidth * 2,
//         height: circleWidth,
//         rightSide: true,
//         number: 41),
//     //----------
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 42),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 43),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 44),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 45),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 46),
//     //+
//     TreeBox(
//         width: circleWidth * 2,
//         height: circleWidth,
//         rightSide: true,
//         number: 47),
//     //----------
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 48),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 49),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 50),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 51),
//     TreeBox(
//         width: circleWidth + circleWidth / 4,
//         height: circleWidth,
//         rightSide: true,
//         topSide: true,
//         number: 52),
//     //+
//     //----------
//   ],
// );

// Row row7 = Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     semiRow(),
//     //
//     const TreeBox(width: circleWidth, number: 59),
//     semiRow(),
//     const TreeBox(width: circleWidth, number: 66),
//     semiRow(),
//     const TreeBox(width: circleWidth, number: 73),
//     semiRow(),
//     const TreeBox(width: circleWidth, number: 80),
//     semiRow(),
//     const TreeBox(width: circleWidth, number: 87),
//     semiRow(),
//   ],
// );

// semiRow() => Row(children: [
//       Container(
//         height: circleWidth * 4,
//         color: Colors.black,
//         alignment: Alignment.topCenter,
//         child: node,
//       ),
//       const TreeBox(width: circleWidth / 4, height: circleWidth, number: 53),
//       Container(
//         height: circleWidth * 4,
//         color: Colors.black,
//         alignment: Alignment.center,
//         child: node,
//       ),
//       const TreeBox(width: circleWidth / 4, height: circleWidth, number: 54),
//       Container(
//         height: circleWidth * 4,
//         color: Colors.black,
//         alignment: Alignment.bottomCenter,
//         child: node,
//       ),
//       const TreeBox(width: circleWidth / 4, height: circleWidth, number: 55),
//       Container(
//         height: circleWidth * 4,
//         color: Colors.black,
//         alignment: Alignment.bottomCenter,
//         child: node,
//       ),
//       const TreeBox(width: circleWidth / 4, height: circleWidth, number: 57),
//       Container(
//         height: circleWidth * 4,
//         color: Colors.black,
//         alignment: Alignment.center,
//         child: node,
//       ),
//       const TreeBox(width: circleWidth / 4, height: circleWidth, number: 58),
//       Container(
//         height: circleWidth * 4,
//         color: Colors.black,
//         alignment: Alignment.topCenter,
//         child: node,
//       )
//     ]);
