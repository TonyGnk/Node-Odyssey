import 'package:flutter/material.dart';

import '../../Services & Providers/constants.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
    super.key,
    this.isSelected,
    this.selectedIcon,
    this.noBottomLeftCorner = false,
  });

  final String? tooltip;
  final Widget icon;
  final bool? isSelected;
  final void Function()? onPressed;
  final Widget? selectedIcon;
  final bool noBottomLeftCorner;

  @override
  Widget build(BuildContext context) => IconButton(
        tooltip: tooltip,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(noBottomLeftCorner ? 0 : cornerSize),
                topLeft: const Radius.circular(cornerSize),
                topRight: const Radius.circular(cornerSize),
                bottomRight: const Radius.circular(cornerSize),
              ),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
        ),
        isSelected: isSelected,
        onPressed: onPressed,
        icon: icon,
        selectedIcon: selectedIcon,
      );
}
