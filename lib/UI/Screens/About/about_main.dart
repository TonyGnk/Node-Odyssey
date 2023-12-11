import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Services & Providers/constants.dart';
import 'about_helper.dart';
import 'about_state.dart';
import 'about_text.dart';

class AboutScreen extends ConsumerStatefulWidget {
  const AboutScreen({super.key});

  @override
  ConsumerState<AboutScreen> createState() => _AboutState();
}

class _AboutState extends ConsumerState<AboutScreen> {
  String? appName;
  String? packageName;
  String? version;
  String? buildNumber;
  bool? thereIsNewVersionAvailable;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      loadPackageInfo();
      aboutReturn(ref);
    });
  }

  //Function to load the app info
  Future<void> loadPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      appName = info.appName;
      packageName = info.packageName;
      version = info.version;
      buildNumber = info.buildNumber;
      log('buildNumber: $buildNumber');
    });
  }

  @override
  build(BuildContext context) => Row(
        children: [
          const SizedBox(width: 20),
          Expanded(child: leftColumnAbout(context, version)),
          const SizedBox(width: 20),
          customAboutRightColumn(),
          const SizedBox(width: 20),
        ],
      );
}

//Create a function given a tree and return a Uri object
//"https://github.com/TonyGnk/algorithms/releases/tag/0.8.7%2B2",
stringToUri(String url) => Uri.parse(url);

//https://tonygnk.github.io/algorithms/

