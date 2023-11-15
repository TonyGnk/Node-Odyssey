import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Themes/oneui_theme_data.dart';
import 'services/uiChange.dart';
import 'services/ui_handler.dart';
import 'Archive/templates/settings_toggle.dart';
import 'routed_screen.dart';
import 'Routes/settings.dart';
import 'template.dart';

class Stab extends StatelessWidget {
  const Stab({
    required this.appBar,
    super.key,
    this.uiToggle = false,
    this.darkToggle = false,
    this.enable = true,
    this.viewText = '',
    this.favoriteActionIcon = Icons.error,
    this.favoriteActionFunction,
    this.menuItemText1 = '',
    this.menuItemFunction1,
    this.menuScreen1,
    this.menuItemText2 = '',
    this.menuItemFunction2,
    this.menuScreen2,
    this.menuItemText3 = '',
    this.menuItemFunction3,
    this.menuScreen3,
    this.menuItemText4 = '',
    this.menuItemFunction4,
    this.menuScreen4,
    this.menuItemText5 = '',
    this.menuItemFunction5,
    this.menuScreen5,
  });

  final AppBar appBar;

  final bool uiToggle;
  final bool darkToggle;
  final bool enable;
  final String viewText;
  final IconData favoriteActionIcon;
  final Function? favoriteActionFunction;
  final String? menuItemText1;
  final Function? menuItemFunction1;
  final RoutedScreen? menuScreen1;
  final String? menuItemText2;
  final Function? menuItemFunction2;
  final RoutedScreen? menuScreen2;
  final String? menuItemText3;
  final Function? menuItemFunction3;
  final RoutedScreen? menuScreen3;
  final String? menuItemText4;
  final Function? menuItemFunction4;
  final RoutedScreen? menuScreen4;
  final String? menuItemText5;
  final Function? menuItemFunction5;
  final RoutedScreen? menuScreen5;

  //create a getter for the enable
  bool get getEnable => enable;

  @override
  Widget build(BuildContext context) => appBar;
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

