import 'package:flutter/material.dart';
import '../templates/settings_toggle.dart';
import 'stab/stab.dart';
import '../templates/custom_animated.dart';

class RoutedScreen extends StatelessWidget {
  /// A set of widgets that make up the screen.
  ///
  /// Each screen has a name and a outlined icon to display in the navigation bar/rail, essentially a not outlined icon when is selected.

  RoutedScreen({
    required this.mainChild,
    required this.icon,
    super.key,
    this.appBar,
    this.filledIcon = Icons.error,
    this.settingsPage,
    this.label = '',
  });

  /// Label in the navigation bar/rail and URL path
  final String label;

  /// The icon to display in the navigation bar/rail when the screen is selected
  final IconData filledIcon;

  /// The icon to display in the navigation bar/rail
  final IconData icon;

  /// The main widget to display the content of the screen
  final Widget mainChild;

  /// The custom settings page only for this screen different from the default
  late Widget? settingsPage;

  /// The app bar of the screen. If null no app bar is displayed
  late Stab? appBar;

  @override
  Widget build(BuildContext context) => customAnimatedBox(
      //padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      //width: MediaQuery.of(context).size.width - 80,
      height: MediaQuery.of(context).size.height,
      child: mainChild
      //   Column(
      //     children: [
      //       //const SizedBox(height: 5),
      //       appBar?.build(
      //               const SettingsToggle(darkThemeSwitcher: true), context) ??
      //           const SizedBox(),
      //       //const SizedBox(height: 10),
      //       mainChild,
      //       // ),
      //     ],
      //   ),

      );

  Widget buildSmall(BuildContext context, double width, double height) =>
      Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.background),
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(3),
        width: width,
        height: height,
        child: Column(
          children: [
            const SizedBox(height: 5),
            appBar?.build(
                    const SettingsToggle(darkThemeSwitcher: true), context) ??
                const SizedBox(),

            const SizedBox(height: 10),
            mainChild,
            // ),
          ],
        ),
      );

  String get getLabel => label;
  String get getLabelWithSlash => '/$label';
  IconData get getFilledIcon => filledIcon;
  IconData get getIcon => icon;
  Widget get getMainChild => mainChild;
  Widget? get getSettingsPage => settingsPage;
  Stab get getAppBar => appBar ?? Stab(true);
}
