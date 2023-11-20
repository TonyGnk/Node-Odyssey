import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../Arc/custom_list_tile.dart';
import '../Components/Buttons/elevated_button.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({
    super.key,
  });

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String? appName;
  String? packageName;
  String? version;
  String? buildNumber;

  //Initializer
  @override
  void initState() {
    super.initState();
    unawaited(loadPackageInfo());
  }

  //Load package info
  Future<void> loadPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      appName = info.appName;
      //print('appName: $appName');
      packageName = info.packageName;
      //print('packageName: $packageName');
      version = info.version;
      //print('version: $version');
      buildNumber = info.buildNumber;
      log('buildNumber: $buildNumber');
    });
  }

  @override
  Widget build(BuildContext context) => scaffoldAboutScreenType2(
        context,
        _defaultApplicationName(context),
        version ?? 'Loading',
      );

  // ProviderScope(
  //       child: uiSelector(
  //         scaffoldAboutScreenType1(
  //           context,
  //           _defaultApplicationName(context),
  //           version ?? 'Loading',
  //         ),
  //         scaffoldAboutScreenType2(
  //           context,
  //           _defaultApplicationName(context),
  //           version ?? 'Loading',
  //         ),
  //       ),
  //     );
}

Widget scaffoldAboutScreenType1(
        BuildContext context, String title, String version) =>
    Scaffold(
        appBar: AppBar(
            //title: const Text('Basic'),
            actions: [aboutAppIconButton]),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 28),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                version,
                style: const TextStyle(fontSize: 18),
              ),
              const Expanded(child: SizedBox()),
              licensesButton(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ));

Widget scaffoldAboutScreenType2(
        BuildContext context, String title, String version) =>
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomListTile(
            label: 'App Version: ${_defaultApplicationName(context)} $version',
            leftIcon: Icons.description_outlined,
            type: Type.top,
            onTap: () => log('App Version: $version'),
          ),
          CustomListTile(
            label: 'Operating System: ${Platform.operatingSystem}',
            leftIcon: getIconPlatform(Platform.operatingSystem),
            type: Type.none,
            onTap: () => log(Platform.operatingSystem),
          ),
          CustomListTile(
            label: 'Open Source Licenses',
            leftIcon: Icons.description_outlined,
            type: Type.bottom,
            onTap: () => showLicensePage(
              context: context,
            ),
          )

          // ListTile(
          //   title: const Text('Open Source Licenses'),
          //   leading: const Icon(Icons.description_outlined),
          //   onTap: () => showLicensePage(
          //     context: context,
          //   ),
          // ),
        ],
      ),
    );

Widget licensesButton(BuildContext context) => AdaptElevatedButton(
      label: 'Open Source Licenses',
      onPressed: () => showLicensePage(
        context: context,
        //applicationName: 'Αριθμομηχανή',
        //applicationVersion: '1.0.0',
        //applicationIcon: const Icon(Icons.settings),
        //applicationLegalese: '© 2021 Αριθμομηχανή',
        useRootNavigator: false,
      ),
    );

Widget aboutAppIconButton = IconButton(
  icon: const Icon(Icons.info_outline_rounded),
  onPressed: () {
    unawaited(AppSettings.openAppSettings());
  },
  iconSize: 26,
  padding: const EdgeInsets.all(12),
);

String _defaultApplicationName(BuildContext context) {
  final Title? ancestorTitle = context.findAncestorWidgetOfExactType<Title>();
  return ancestorTitle?.title ??
      Platform.resolvedExecutable.split(Platform.pathSeparator).last;
}

getIconPlatform(String operatingSystem) {
  log(operatingSystem);
  if (operatingSystem == 'android') {
    return Icons.android_outlined;
  } else if (operatingSystem == 'ios') {
    return Icons.phone_iphone_outlined;
  } else if (operatingSystem == 'linux') {
    return Icons.laptop_outlined;
  } else if (operatingSystem == 'macos') {
    return Icons.desktop_mac_outlined;
  } else if (operatingSystem == 'windows') {
    return Icons.desktop_windows_outlined;
  } else {
    return Icons.device_unknown_outlined;
  }
}
