import 'package:flutter/material.dart';
import 'app_bar.dart';

class RoutedScreen extends StatelessWidget {
  /// A set of widgets that make up the screen.
  ///
  /// Each screen has a name and a outlined icon to display in the navigation bar/rail, essentially a not outlined icon when is selected.

  const RoutedScreen({
    required this.mainChild,
    required this.icon,
    required this.appBar,
    this.labelRoute,
    super.key,
    this.filledIcon = Icons.error,
    this.label = '',
    this.noMargin = false,
  });

  /// Label in the navigation bar/rail and URL path
  final String label;

  /// The URL path of the screen
  final String? labelRoute;

  /// The icon to display in the navigation bar/rail when the screen is selected
  final IconData filledIcon;

  /// The icon to display in the navigation bar/rail
  final IconData icon;

  /// The main widget to display the content of the screen
  final Widget mainChild;

  /// The app bar of the screen. If null no app bar is displayed
  final AdaptAppBar appBar;

  final bool noMargin;

  @override
  Widget build(BuildContext context) => col(context);

  Column col(BuildContext context) => Column(
        children: [
          appBar,
          //Container(width: 40, height: 40, color: Colors.red),
          noMargin ? const SizedBox() : const SizedBox(height: 8),
          //Expanded(child: Container(width: 40, height: 40, color: Colors.pink)),
          // Expanded(
          //   child: Container(
          //     height: MediaQuery.of(context).size.height,
          //     child: Column(
          //       children: [
          //         Expanded(child: mainChild),
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(child: mainChild),
        ],
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
            appBar.build(context),

            const SizedBox(height: 10),
            mainChild,
            // ),
          ],
        ),
      );

  String get getLabel => label;
  String get getLabelWithSlash => labelRoute ?? '/$label';
  IconData get getFilledIcon => filledIcon;
  IconData get getIcon => icon;
  Widget get getMainChild => mainChild;
}
