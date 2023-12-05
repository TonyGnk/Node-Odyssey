import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/screen_list.dart';
import '../Adaptive Templates/body_with_appbar.dart';
import '../Routed Screen/app_bar.dart';

Widget home() => Consumer(builder: (context, ref, _) {
      final currentScreen = ref.watch(currentScreenProvider);
      return bodyWithAppBarGlass(
        appBar: appBar(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: getCurrentScreen(currentScreen),
        ),
      );
    });

Widget appBar(BuildContext context) => Consumer(
      builder: (context, ref, _) => adaptAppBar(),
    );

final currentScreenProvider = StateProvider<ScreenDestination>(
  (ref) => ScreenDestination.home,
);




// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../Screens/screen_list.dart';
// import '../Routed Screen/routed_screen.dart';
// import '../Archive/templates/nav_bar.dart';
// class Synthesizer extends StatefulWidget {
//   const Synthesizer({super.key});
//   @override
//   State<Synthesizer> createState() => _SynthesizerState();
// }
// class _SynthesizerState extends State<Synthesizer> {
//   int currentPageIndex = 0;
//   void updateCurrentPageIndex(int value) {
//     setState(() {
//       currentPageIndex = value;
//     });
//   }
//   @override
//   Widget build(BuildContext context) => Consumer(builder: (context, ref, _) {
//         final screenList = ref.watch(screensProvider);
//         return screenList.length == 1
//             ? MediaQuery.of(context).size.width < 700
//                 ? singleScreenTab(screenList[0])
//                 : singleScreen(screenList[0])
//             : MediaQuery.of(context).size.width < 700
//                 ? multiScreen(screenList)
//                 : multiScreenTab(screenList);
//       });
//   Scaffold singleScreen(RoutedScreen screen) => Scaffold(
//         body: screen.build(context),
//       );
//   Scaffold singleScreenTab(RoutedScreen screen) => Scaffold(
//         body: screen.build(context),
//       );
//   Scaffold multiScreen(List<RoutedScreen> screenList) => Scaffold(
//         bottomNavigationBar: BottomNavBar(
//           index: currentPageIndex,
//           onTap: updateCurrentPageIndex,
//           labels: List.generate(
//             screenList.length,
//             (i) => screenList[i].getLabel,
//           ),
//           icons: List.generate(
//             screenList.length,
//             (i) => screenList[i].getFilledIcon,
//           ),
//           iconsOutlined: List.generate(
//             screenList.length,
//             (i) => screenList[i].getIcon,
//           ),
//         ).build(currentPageIndex),
//         body: screenList[currentPageIndex].build(context),
//       );
//   Scaffold multiScreenTab(List<RoutedScreen> screenList) => Scaffold(
//         body: Row(
//           children: [
//             NavigationRail(
//               onDestinationSelected: updateCurrentPageIndex,
//               destinations: List.generate(
//                 screenList.length,
//                 (i) => NavigationRailDestination(
//                   icon: Icon(
//                     screenList[i].getIcon,
//                   ),
//                   label: Text(
//                     screenList[i].getLabel,
//                   ),
//                 ),
//               ),
//               selectedIndex: currentPageIndex,
//             ),
//             Expanded(
//               child: screenList[currentPageIndex].build(context),
//             ),
//           ],
//         ),
//       );
// }
