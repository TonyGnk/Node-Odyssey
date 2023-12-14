// ModernCaption(
//                     label: 'Breadth First',
//                     onTap: () =>
//                         buttonGo(ref, ScreenDestination.breadthFirstAlg),
//                     icon: Icons.radar_outlined,
//                   ),
//                   ModernCaption(
//                     // label: 'Αλγόριθμος Πρώτα σε Βάθος' in English,
//                     label: 'Depth First',
//                     onTap: () => buttonGo(ref, ScreenDestination.depthFirstAlg),
//                     icon: Icons.grid_goldenratio,
//                   ),
//                   ModernCaption(
//                     // label: 'Πρώτα στο καλύτερο' in English,
//                     label: 'Best First',
//                     onTap: () => buttonGo(ref, ScreenDestination.bestFirstAlg),
//                     icon: Icons.filter_tilt_shift_outlined,
//                   ),
//                   ModernCaption(
//                     // label: 'Α*' in English,
//                     label: 'A*',
//                     onTap: () => buttonGo(ref, ScreenDestination.aStarAlg),
//                     icon: Icons.star_border_outlined,
//                   ),

import 'package:flutter/material.dart';

import '../screen_list.dart';
import 'button_template.dart';

const bfButton = ButtonTemplate(
  title: 'Breadth First',
  slogan: 'Explore all Horizons!',
  description:
      'Explore breadth before depth, uncovering solutions layer by layer',
  icon: Icons.radar_outlined,
  screenDestination: ScreenDestination.breadthFirstAlg,
);

const dfButton = ButtonTemplate(
  title: 'Depth First',
  slogan: 'Go Deep!',
  description:
      'Delve deep into possibilities, prioritizing depth for efficient solving',
  icon: Icons.grid_goldenratio,
  screenDestination: ScreenDestination.depthFirstAlg,
);

const bestButton = ButtonTemplate(
  title: 'Best First',
  slogan: 'Optimized and Fast!',
  description:
      'Navigate to the optimal solution with intelligent heuristic selection',
  icon: Icons.filter_tilt_shift_outlined,
  screenDestination: ScreenDestination.bestFirstAlg,
);

const aStarButton = ButtonTemplate(
  title: 'A*',
  slogan: 'Aim for Perfection!',
  description:
      'Achieve perfection in pathfinding, balancing cost and heuristic precision',
  icon: Icons.star_border_outlined,
  screenDestination: ScreenDestination.aStarAlg,
);

//Compare button going to compare screen. Compare every algorithm with each other.
const compareButton = ButtonTemplate(
  title: 'Compare',
  //Ας κερδίσει ο καλύτερος
  slogan: 'Let the best one win!',
  description:
      'Check and compare algorithms to find the best fit for your needs',
  icon: Icons.compare_arrows_outlined,
  screenDestination: ScreenDestination.compare,
);
