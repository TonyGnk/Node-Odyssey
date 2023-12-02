import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/screen_list.dart';
import '../../Services & Providers/constants.dart';
import 'info_icon.dart';
import 'theme_icon.dart';

final appBarIsEnableProvider = StateProvider<bool>((ref) => true);
final appBarIsFilledProvider = StateProvider<bool>((ref) => false);
final appBarIsEnableBackButtonProvider = StateProvider<bool>((ref) => false);
final appBarIsEnableThemeButtonProvider = StateProvider<bool>((ref) => true);
final appBarIsEnableInfoButtonProvider = StateProvider<bool>((ref) => false);
final appBarLabel = StateProvider<String?>((ref) => null);
final appBarCurrentScreen = StateProvider<ScreenDestination?>((ref) => null);
final appBarPreviousScreen = StateProvider<ScreenDestination?>((ref) => null);

Widget adaptAppBar() => Consumer(builder: (context, ref, _) {
      final isEnable = ref.watch(appBarIsEnableProvider);
      final filled = ref.watch(appBarIsFilledProvider);
      return isEnable
          ? DecoratedBox(
              decoration: filled
                  ? filledBoxDecoration(context)
                  : boxDecoration(context),
              child: row(context),
            )
          : const SizedBox();
    });

Widget row(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final isEnableBackButton = ref.watch(appBarIsEnableBackButtonProvider);
        final label = ref.watch(appBarLabel);
        final isEnableThemeButton =
            ref.watch(appBarIsEnableThemeButtonProvider);
        final isEnableInfoButton = ref.watch(appBarIsEnableInfoButtonProvider);
        final currentScreen = ref.watch(appBarCurrentScreen);
        final previousScreen = ref.watch(appBarPreviousScreen);
        return Row(
          children: [
            isEnableBackButton
                ? appBarIcon(
                    const Icon(Icons.arrow_back_ios_new_outlined),
                    () => backButtonReturn(ref, currentScreen, previousScreen),
                  )
                : const SizedBox(),
            Text(
              label ?? '',
              style: const TextStyle(fontSize: 16),
            ),
            const Expanded(child: SizedBox()),
            themeIcon(context, isEnableThemeButton),
            infoIcon(context, isEnableInfoButton),
          ],
        );
      },
    );

filledBoxDecoration(BuildContext context) => BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        width: 1,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(cornerSize),
      ),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    );

boxDecoration(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(cornerSize),
    );

appBarIcon(
  Icon icon,
  void Function() onPressed, [
  String s = '',
  Icon? selectedIcon,
  bool? isSelected,
]) =>
    Consumer(
      builder: (context, ref, _) => IconButton(
        tooltip: s != '' ? s : null,
        selectedIcon: selectedIcon,
        isSelected: isSelected,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(cornerSize),
                topLeft: Radius.circular(cornerSize),
                topRight: Radius.circular(cornerSize),
                bottomRight: Radius.circular(cornerSize),
              ),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
        ),
        onPressed: onPressed,
        icon: icon,
      ),
    );
