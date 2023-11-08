// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'stab.dart';
// import '../../template.dart';
// import '../../templates/custom_animated.dart';

// class stabIcon extends StatelessWidget {
//   const stabIcon(
//       {required this.icon, super.key, this.onFunction, this.number = 0});

//   const stabIcon.empty({super.key})
//       : icon = '',
//         onFunction = null,
//         number = 0;
//   final String icon;
//   final Function? onFunction;
//   final int number;

//   @override
//   Widget build(BuildContext context) =>
//       Consumer(builder: (_, WidgetRef ref, __) {
//         bool ui = ref.watch(OneUi);
//         bool equalHover = getStatus(ref);
//         return GestureDetector(
//           onTap: () {
//             updateHoverItem(number, ref);
//             updateHoverBarFalse(ref);
//             onFunction != null ? onFunction!() : null;
//           },
//           onTapDown: (TapDownDetails details) {
//             updateHoverItem(number, ref);
//           },
//           child: customAnimatedBox(
//             duration: const Duration(milliseconds: 150),
//             width: 48,
//             height: 48,
//             padding:
//                 equalHover ? const EdgeInsets.all(0) : const EdgeInsets.all(4),
//             child: customAnimatedBox(
//               duration: const Duration(milliseconds: 150),
//               decoration: BoxDecoration(
//                   color: equalHover
//                       ? const Color.fromARGB(90, 137, 137, 137)
//                       : const Color.fromARGB(0, 137, 137, 137),
//                   borderRadius: BorderRadius.circular(100)),
//               padding: equalHover
//                   ? const EdgeInsets.all(4)
//                   : const EdgeInsets.all(0),
//               margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
//               child: customAnimatedBox(
//                 padding: const EdgeInsets.all(7),
//                 child: SvgPicture.asset(
//                   icon,
//                   colorFilter: ColorFilter.mode(
//                     Theme.of(context)
//                         .textTheme
//                         .bodySmall!
//                         .color!
//                         .withOpacity(0.8),
//                     BlendMode.srcIn,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       });

//   String IconBold(String icon) {
//     String iconBold = '${icon.substring(0, icon.length - 4)}bold.svg';
//     return iconBold;
//   }

//   void updateHoverItem(
//     int number,
//     WidgetRef ref,
//   ) {
//     ref.read(hoverBar1.notifier).state = (0 == number);
//     ref.read(hoverBar2.notifier).state = (1 == number);
//     ref.read(hoverBar3.notifier).state = (2 == number);
//     ref.read(hoverBar4.notifier).state = (3 == number);
//     ref.read(hoverBar5.notifier).state = (4 == number);
//   }

//   Future<void> updateHoverBarFalse(WidgetRef ref) async {
//     await Future.delayed(
//         const Duration(milliseconds: 100)); // Add a 1-second delay

//     ref.read(hoverBar1.notifier).state = false;
//     ref.read(hoverBar2.notifier).state = false;
//     ref.read(hoverBar3.notifier).state = false;
//     ref.read(hoverBar4.notifier).state = false;
//     ref.read(hoverBar5.notifier).state = false;
//   }

//   bool getStatus(WidgetRef ref) {
//     bool HoverBar1 = ref.watch(hoverBar1);
//     bool HoverBar2 = ref.watch(hoverBar2);
//     bool HoverBar3 = ref.watch(hoverBar3);
//     bool HoverBar4 = ref.watch(hoverBar4);
//     bool HoverBar5 = ref.watch(hoverBar5);

//     bool EqualNumberHover = (HoverBar1 && (0 == number)) ||
//         (HoverBar2 && (1 == number)) ||
//         (HoverBar3 && (2 == number)) ||
//         (HoverBar4 && (3 == number)) ||
//         (HoverBar5 && (4 == number));
//     return EqualNumberHover;
//   }
// }
