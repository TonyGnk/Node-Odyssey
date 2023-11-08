import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screen/screen.dart';
import '../templates/custom_animated.dart';
import '../templates/nav_bar.dart';

class Synthesizer extends StatefulWidget {
  const Synthesizer({
    required this.screens,
    super.key,
  });

  final List<RoutedScreen> screens;

  @override
  State<Synthesizer> createState() => _SynthesizerState();
}

class _SynthesizerState extends State<Synthesizer> {
  int currentPageIndex = 0;

  void updateCurrentPageIndex(int value) {
    setState(() {
      currentPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: widget.screens.length == 1
            ? MediaQuery.of(context).size.width < 700
                ? singleScreenTab()
                : singleScreen()
            : MediaQuery.of(context).size.width < 700
                ? multiScreen()
                : multiScreenTab(),
      );

  Scaffold singleScreen() => Scaffold(
        body: widget.screens[0].build(context),
      );

  Scaffold singleScreenTab() => Scaffold(
        body: widget.screens[0].build(context),
      );

  Scaffold multiScreen() => Scaffold(
        bottomNavigationBar: BottomNavBar(
          index: currentPageIndex,
          onTap: updateCurrentPageIndex,
          labels: List.generate(
            widget.screens.length,
            (i) => widget.screens[i].getLabel,
          ),
          icons: List.generate(
            widget.screens.length,
            (i) => widget.screens[i].getFilledIcon,
          ),
          iconsOutlined: List.generate(
            widget.screens.length,
            (i) => widget.screens[i].getIcon,
          ),
        ).build(currentPageIndex),
        body: widget.screens[currentPageIndex].build(context),
      );

  Scaffold multiScreenTab() => Scaffold(
        body: customAnimatedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              NavigationRail(
                  onDestinationSelected: updateCurrentPageIndex,
                  destinations: List.generate(
                    widget.screens.length,
                    (i) => NavigationRailDestination(
                      icon: Icon(
                        widget.screens[i].getIcon,
                      ),
                      label: Text(widget.screens[i].getLabel),
                    ),
                  ),
                  selectedIndex: currentPageIndex),
              widget.screens[currentPageIndex].build(context),
            ],
          ),
        ),
      );
}
