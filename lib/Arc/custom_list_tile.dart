import 'package:flutter/material.dart';

import '../Services/constants.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    required this.label,
    required this.onTap,
    required this.leftIcon,
    required this.type,
    super.key,
  });
  final String label;
  final VoidCallback onTap;
  final IconData leftIcon;
  final Type type;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  double? height = 0.0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(basicDuration, () => changeColor(context));
    return AnimatedContainer(
      height: height,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: _getBorderRadius(),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: delayedOnTap,
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() => Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(widget.leftIcon),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.label,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_right),
          ],
        ),
      );

  void delayedOnTap() =>
      Future.delayed(const Duration(milliseconds: 200), widget.onTap);

  BorderRadius _getBorderRadius() {
    switch (widget.type) {
      case Type.both:
        return BorderRadius.circular(14);
      case Type.top:
        return const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        );
      case Type.none:
        return const BorderRadius.only();
      case Type.bottom:
        return const BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        );
      default:
        return const BorderRadius.only();
    }
  }

  changeColor(BuildContext context) {
    if (mounted) {
      setState(() {
        height = 80;
      });
    }
    //showAlert(context, true);
  }
}

enum Type {
  both,
  top,
  none,
  bottom,
}
