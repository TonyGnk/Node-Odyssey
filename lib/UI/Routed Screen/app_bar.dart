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
final appBarLabelOpacity = StateProvider<double>((ref) => 0);
final appBarCurrentScreen = StateProvider<ScreenDestination?>((ref) => null);
final appBarPreviousScreen = StateProvider<ScreenDestination?>((ref) => null);

final appBarCustomIcon1 = StateProvider<IconButton?>((ref) => null);

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
        final labelOpacity = ref.watch(appBarLabelOpacity);
        final isEnableThemeButton =
            ref.watch(appBarIsEnableThemeButtonProvider);
        final isEnableInfoButton = ref.watch(appBarIsEnableInfoButtonProvider);
        final currentScreen = ref.watch(appBarCurrentScreen);
        final previousScreen = ref.watch(appBarPreviousScreen);
        final customIcon1 = ref.watch(appBarCustomIcon1);
        return Row(
          children: [
            const SizedBox(width: 2),
            isEnableBackButton
                ? appBarIcon(
                    ref,
                    const Icon(Icons.arrow_back_ios_new_outlined),
                    () => backButtonReturn(ref, currentScreen, previousScreen),
                  )
                : const SizedBox(),
            AnimatedOpacity(
              opacity: labelOpacity,
              duration: basicDuration,
              child: Text(
                label ?? '',
                style: const TextStyle(fontSize: 21, fontFamily: 'Play'),
              ),
            ),
            const Expanded(child: SizedBox()),
            customIcon1 ?? const SizedBox(),
            themeIcon(context, ref, isEnableThemeButton),
            infoIcon(context, ref, isEnableInfoButton),
            const SizedBox(width: 2),
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
  WidgetRef ref,
  Icon icon,
  void Function() onPressed, [
  String s = '',
  Icon? selectedIcon,
  bool? isSelected,
]) =>
    IconButton(
      tooltip: s != '' ? s : null,
      selectedIcon: selectedIcon,
      isSelected: isSelected,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
      ),
      onPressed: onPressed,
      icon: icon,
      highlightColor: Colors.grey.withOpacity(0.2),
    );

updateAppBarLabel(WidgetRef ref, String label, bool isReturn) {
  ref.read(appBarLabel.notifier).state = isReturn ? label : null;
  ref.read(appBarLabelOpacity.notifier).state = isReturn ? 1 : 0;
}
