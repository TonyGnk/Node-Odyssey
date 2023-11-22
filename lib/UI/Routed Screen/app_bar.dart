import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Screens/Breadth First Page/Archive BF/result_providers.dart';
import '../../Services & Providers/constants.dart';
import '../Services2/navigator_fun.dart';
import 'app_bar_icon.dart';
import 'info_icon.dart';
import 'theme_icon.dart';

class AdaptAppBar extends StatelessWidget {
  const AdaptAppBar({
    this.showThemeIcon = false,
    this.showInfoIcon = false,
    this.showBackButton = true,
    this.filled = true,
    this.label,
    this.enable = true,
    super.key,
    this.noTopLeftCornerBack = false,
  });

  final bool enable;
  final bool filled;

  ///The label at the top left corner of the app bar. If null rooted screen sets to label of the screen.
  final String? label;

  final bool showThemeIcon;
  final bool showInfoIcon;
  final bool showBackButton;

  final bool noTopLeftCornerBack;

  bool get getEnable => enable;

  @override
  Widget build(BuildContext context) => enable
      ? DecoratedBox(
          decoration: filled
              ? BoxDecoration(
                  border: Border.all(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(cornerSize),
                  ),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(cornerSize),
                ),
          child: row(context),
        )
      : const SizedBox();

  Widget row(BuildContext context) => Consumer(
        builder: (context, ref, _) {
          final textButton = ref.watch(textButtonProviderR);
          return Row(
            children: [
              showBackButton
                  ? AppBarIcon(
                      tooltip: 'Πίσω',
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                      onPressed: () async => navigateBack(context),
                      noBottomLeftCorner: noTopLeftCornerBack,
                    )
                  : const SizedBox(),
              const SizedBox(width: 6),
              Text(
                label ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const Expanded(child: SizedBox()),
              textButton,
              themeIcon(context, showThemeIcon),
              infoIcon(context, showInfoIcon)
            ],
          );
        },
      );
}






// Column(children: [

//   onlyAppBar
//       ? AppBar(
//           actions: [
//             Tooltip(
//               message: 'Toggle Ui Theme',
//               child: IconButton(
//                 isSelected: ref.watch(OneUi.notifier).state == true,
//                 onPressed: () async {
//                   ref
//                               .read(selectedStateProviderType.notifier)
//                               .state
//                               .toString() ==
//                           'StateProviderType.oneUi'
//                       ? {
//                           ref
//                               .read(selectedStateProviderType.notifier)
//                               .state = StateProviderType.material,
//                           toggleUI(context, 'material'),
//                         }
//                       : {
//                           ref
//                               .read(selectedStateProviderType.notifier)
//                               .state = StateProviderType.oneUi,
//                           toggleUI(context, 'oneUi'),
//                         };
//                 },
//                 icon: const Icon(Icons.science_outlined),
//                 selectedIcon: const Icon(Icons.science),
//               ),
//             ),
//             // IconButton(
//             //   onPressed: () async {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //         builder: (context) => ProviderScope(
//             //           child: SettingsScreen(toggles: toggles),
//             //         ),
//             //       ),
//             //     );
//             //   },
//             //   icon: const Icon(Icons.settings),
//             // ),
//           ],
//         )
//       : SearchAnchor(
//           viewHintText: 'Αναζήτηση στις επαφές',
//           builder:
//               (BuildContext context, SearchController controller) =>
//                   SearchBar(
//             trailing: <Widget>[
//               Row(
//                 children: [
//                   Tooltip(
//                     message: 'Toggle Ui Theme',
//                     child: IconButton(
//                       isSelected:
//                           ref.watch(OneUi.notifier).state == true,
//                       onPressed: () async {
//                         ref
//                                     .read(selectedStateProviderType
//                                         .notifier)
//                                     .state
//                                     .toString() ==
//                                 'StateProviderType.oneUi'
//                             ? {
//                                 ref
//                                     .read(selectedStateProviderType
//                                         .notifier)
//                                     .state = StateProviderType.material,
//                                 toggleUI(context, 'material'),
//                               }
//                             : {
//                                 ref
//                                     .read(selectedStateProviderType
//                                         .notifier)
//                                     .state = StateProviderType.oneUi,
//                                 toggleUI(context, 'oneUi'),
//                               };
//                       },
//                       icon: const Icon(Icons.science_outlined),
//                       selectedIcon: const Icon(Icons.science),
//                     ),
//                   ),
//                   Tooltip(
//                     message: 'Enable/Disable Dark Mode',
//                     child: IconButton(
//                       isSelected:
//                           AdaptiveTheme.of(context).mode.toString() ==
//                               'AdaptiveThemeMode.dark',
//                       onPressed: () {
//                         AdaptiveTheme.of(context).mode.toString() ==
//                                 'AdaptiveThemeMode.dark'
//                             ? {
//                                 AdaptiveTheme.of(context).setLight(),
//                                 AdaptiveTheme.of(context).updateState()
//                               }
//                             : {
//                                 AdaptiveTheme.of(context).setDark(),
//                                 AdaptiveTheme.of(context).updateState()
//                               };
//                       },
//                       icon: const Icon(Icons.wb_sunny_outlined),
//                       selectedIcon:
//                           const Icon(Icons.dark_mode_outlined),
//                     ),
//                   ),

// ? CustomPopupMenu(
//     menuItemText: [
//       menuItemText1!,
//       menuItemText2!,
//       menuItemText3!,
//       menuItemText4!,
//       menuItemText5!,
//       'Ρυθμίσεις'
//     ],
//     menuItemFunctions: [
//       () {
//         menuItemFunction1!();
//         if (menuScreen1 != null) {
//           ref.read(inScreen.notifier).state =
//               menuScreen1!;
//           ref.read(inScreenName.notifier).state =
//               ref.read(inScreen.notifier).state.getName;
//         }
//       },
//       () {
//         menuItemFunction2!();
//         if (menuScreen2 != null) {
//           ref.read(inScreen.notifier).state =
//               menuScreen2!;
//           ref.read(inScreenName.notifier).state =
//               ref.read(inScreen.notifier).state.getName;
//         }
//       },
//       () {
//         menuItemFunction3!();
//         if (menuScreen3 != null) {
//           ref.read(inScreen.notifier).state =
//               menuScreen3!;
//           ref.read(inScreenName.notifier).state =
//               ref.read(inScreen.notifier).state.getName;
//         }
//       },
//       () {
//         if (menuScreen4 != null) {
//           ref.read(inScreen.notifier).state =
//               menuScreen4!;
//           ref.read(inScreenName.notifier).state =
//               ref.read(inScreen.notifier).state.getName;
//         }
//       },
//       () {
//         menuItemFunction5!();
//         if (menuScreen5 != null) {
//           ref.read(inScreen.notifier).state =
//               menuScreen5!;
//           ref.read(inScreenName.notifier).state =
//               ref.read(inScreen.notifier).state.getName;
//         }
//       },
//       //Create an option for settings
//       () async {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 SettingsScreen(toggles: toggles),
//           ),
//         );
//       }
//     ],
//     context: context,
//   )
//If there are no menu items then display an icon setting going to the settings screen using the push method

// IconButton(
//   onPressed: () async {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProviderScope(
//           child: SettingsScreen(toggles: toggles),
//         ),
//       ),
//     );
//   },
//   icon: const Icon(Icons.settings),
// ),
//         ],
//       ),
//     ],
//     hintText: 'Αναζήτηση στις επαφές',
//     controller: controller,
//     padding: const MaterialStatePropertyAll<EdgeInsets>(
//         EdgeInsets.symmetric(horizontal: 16.0)),
//     onTap: () {
//       controller.openView();
//     },
//     onChanged: (_) {
//       controller.openView();
//     },
//     leading: const Icon(Icons.search),
//   ),
//   suggestionsBuilder:
//       (BuildContext context, SearchController controller) =>
//           List<ListTile>.generate(
//     5,
//     (int index) {
//       final String item = 'item $index';
//       return ListTile(
//         title: Text(item),
//         onTap: () {},
//       );
//     },
//   ),
// ),
// GestureDetector(
//   onTap: () {
//     null;
//   },
//   child: customAnimatedBox(
//     padding: ui
//         ? const EdgeInsets.fromLTRB(18, 0, 18, 0)
//         : const EdgeInsets.fromLTRB(18, 3, 18, 3),
//     child: customAnimatedBox(
//       width: MediaQuery.of(context).size.width,
//       height: 50,
//       decoration: BoxDecoration(
//         color: ui
//             ? Theme.of(context).colorScheme.onPrimaryContainer
//             : Theme.of(context).colorScheme.primaryContainer,
//         borderRadius: const BorderRadius.all(Radius.circular(40)),
//       ),
//       child: Row(
//         children: [
//           //Display the back button when inScreenNameProvider is not null
//           inScreenNameProvider != ''
//               ? customIconButton(
//                   name: 'Back',
//                   icon: Icons.arrow_back,
//                   onFunction: () =>
//                       ref.read(inScreenName.notifier).state = '')
//               : const SizedBox(),
//           !ui
//               ? stabIcon(
//                   icon: 'assets/icons/search.svg',
//                   onFunction: () => null,
//                   number: 9,
//                 )
//               : const SizedBox(),
//           Expanded(
//             child: !ui
//                 ? Container(color: Colors.black.withOpacity(0.6))

//                 // TextField(
//                 //     decoration: InputDecoration(
//                 //       hintText: "Αναζήτηση στις επαφές",
//                 //       hintStyle: TextStyle(
//                 //         color: Theme.of(context)
//                 //             .textTheme
//                 //             .displayLarge!
//                 //             .color
//                 //             ?.withOpacity(0.7),
//                 //       ),
//                 //       border: InputBorder.none,
//                 //     ),
//                 //   )
//                 : const SizedBox(),
//           ),
//           ui
//               ? customIconButton(
//                   name: 'Αναζήτηση',
//                   icon: Icons.search,
//                   onFunction: () => null,
//                 )
//               : const SizedBox(),
//           favoriteActionIcon != Icons.error
//               ? customIconButton(
//                   icon: favoriteActionIcon,
//                   onFunction: () => favoriteActionFunction!(),
//                   name: 'Αγαπημένα',
//                 )
//               : const SizedBox(),
//           if (uiToggle)
//             customIconButton(
//               icon: Icons.science_outlined,
//               onFunction: () {
//                 ui
//                     ? ref.read(OneUi.notifier).state = false
//                     : ref.read(OneUi.notifier).state = true;
//               },
//               name: 'UI',
//             ),
//           if (darkToggle)
//             customIconButton(
//               icon: Icons.dark_mode_outlined,
//               onFunction: () {
//                 AdaptiveTheme.of(context).mode.toString() ==
//                         'AdaptiveThemeMode.dark'
//                     ? AdaptiveTheme.of(context).setLight()
//                     : AdaptiveTheme.of(context).setDark();
//               },
//               name: 'Dark Theme Toggle',
//             ),
//           existMenuItems
//               ? CustomPopupMenu(
//                   menuItemText: [
//                     menuItemText1!,
//                     menuItemText2!,
//                     menuItemText3!,
//                     menuItemText4!,
//                     menuItemText5!
//                   ],
//                   menuItemFunctions: [
//                     () {
//                       menuItemFunction1!();
//                       if (menuScreen1 != null) {
//                         ref.read(inScreen.notifier).state =
//                             menuScreen1!;
//                         ref.read(inScreenName.notifier).state =
//                             ref.read(inScreen.notifier).state.getName;
//                       }
//                     },
//                     () {
//                       menuItemFunction2!();
//                       if (menuScreen2 != null) {
//                         ref.read(inScreen.notifier).state =
//                             menuScreen2!;
//                         ref.read(inScreenName.notifier).state =
//                             ref.read(inScreen.notifier).state.getName;
//                       }
//                     },
//                     () {
//                       menuItemFunction3!();
//                       if (menuScreen3 != null) {
//                         ref.read(inScreen.notifier).state =
//                             menuScreen3!;
//                         ref.read(inScreenName.notifier).state =
//                             ref.read(inScreen.notifier).state.getName;
//                       }
//                     },
//                     () {
//                       if (menuScreen4 != null) {
//                         ref.read(inScreen.notifier).state =
//                             menuScreen4!;
//                         ref.read(inScreenName.notifier).state =
//                             ref.read(inScreen.notifier).state.getName;
//                       }
//                     },
//                     () {
//                       menuItemFunction5!();
//                       if (menuScreen5 != null) {
//                         ref.read(inScreen.notifier).state =
//                             menuScreen5!;
//                         ref.read(inScreenName.notifier).state =
//                             ref.read(inScreen.notifier).state.getName;
//                       }
//                     }
//                   ],
//                   context: context,
//                 )
//               : const SizedBox(),

//           // PopupMenuButton<String>(
//           //   itemBuilder: (BuildContext context) =>
//           //       <PopupMenuEntry<String>>[
//           //     PopupMenuItem<String>(
//           //       value: 'Option1',
//           //       child: Text('Option1'),
//           //       onTap: () => print('Option1'),
//           //     ),
//           //     PopupMenuItem<String>(
//           //       value: 'Option2',
//           //       child: Text('Option2'),
//           //       onTap: () => print('Option2'),
//           //     ),
//           //   ],
//           //   onSelected: (String value) {
//           //     //Αυτό μπαίνει για
//           //     // Handle option selection
//           //   },
//           // ),
//         ],
//       ),
//     ),
//   ),
// ),
//   ]);
// });

// Future<void> toggleUI(BuildContext context, String action) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('UITHEME', action);
//   if (action == 'oneUi') {
//     AdaptiveTheme.of(context).setTheme(
//         light: OneUIThemeData.getLightTheme(),
//         dark: OneUIThemeData.getDarkTheme());
//   } else {
//     AdaptiveTheme.of(context).setTheme(
//         light: MaterialThemeData.getLightTheme(),
//         dark: MaterialThemeData.getDarkTheme());
//   }
// }
