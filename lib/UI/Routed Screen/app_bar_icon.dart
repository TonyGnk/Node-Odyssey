import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
    super.key,
    this.isSelected,
    this.selectedIcon,
  });

  final String? tooltip;
  final Widget icon;
  final bool? isSelected;
  final void Function()? onPressed;
  final Widget? selectedIcon;

  @override
  Widget build(BuildContext context) => IconButton(
        tooltip: tooltip,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
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
