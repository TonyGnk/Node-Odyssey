import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import '../Screens/styles.dart';
import '../Themes/material_theme_data.dart';
import 'synthesizer.dart';
import '../Screens/about_page.dart';
import '../Archive/screen/Settings Items/ap.dart';
import '../Routed Screen/routed_screen.dart';

Widget rootConfig(
  BuildContext context,
  TotalTheme theme,
  AdaptiveThemeMode? savedThemeMode,
  String appTitle,
  bool debugShowFloatingThemeButton,
  List<RoutedScreen> screens, [
  List<RoutedScreen>? nonNavigationScreens,
]) =>
    AdaptiveTheme(
      light: theme.light(),
      dark: theme.dark(),
      debugShowFloatingThemeButton: debugShowFloatingThemeButton,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        onGenerateTitle: (context) => appTitle,
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: Synthesizer(screens: screens),
        routes: generateRoutes(
            mergeScreenLists(screens, nonNavigationScreens ?? [])),
      ),
    );

Map<String, WidgetBuilder> generateRoutes(List<RoutedScreen> screens) {
  Map<String, WidgetBuilder> routes = {};

  for (int i = 0; i < screens.length; i++) {
    String labelWithSlash = screens[i].getLabelWithSlash;
    routes[labelWithSlash] =
        (BuildContext context) => screens[i].build(context);
  }

  // Manually specify routes
  routes['/settings/appearance'] =
      (BuildContext context) => const BasicScreen();
  routes['/settings/about'] = (BuildContext context) => const AboutScreen();
  //add /settings/customization
  routes['/settings/customization'] =
      (BuildContext context) => const StyleScreen();

  return routes;
}

List<RoutedScreen> mergeScreenLists(
    List<RoutedScreen> a, List<RoutedScreen> b) {
  List<RoutedScreen> c = [];
  for (int i = 0; i < a.length; i++) {
    c.add(a[i]);
  }
  for (int i = 0; i < b.length; i++) {
    c.add(b[i]);
  }
  return c;
}
