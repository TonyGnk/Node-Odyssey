import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Services & Providers/constants.dart';
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
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      loadPackageInfo();
      aboutReturn(ref);
    });
  }

  Future<void> loadPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      appName = info.appName;
      //print('appName: $appName');
      packageName = info.packageName;
      //print('packageName: $packageName');
      version = 'App Version ${info.version}';
      //print('version: $version');
      buildNumber = info.buildNumber;
      log('buildNumber: $buildNumber');
    });
  }

  @override
  build(BuildContext context) => Row(
        children: [
          const SizedBox(width: 20),
          Expanded(flex: 3, child: customAboutLeftColumn()),
          const SizedBox(width: 20),
          customAboutRightColumn(),
          const SizedBox(width: 20),
        ],
      );

  customAboutLeftColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header1Text(aboutText[0]),
          const SizedBox(height: 20),
          header2Text(aboutText[1]),
          const SizedBox(height: 10),
          pText(aboutText[2]),
          const SizedBox(height: 20),
          header2Text(aboutText[3]),
          const SizedBox(height: 10),
          pText(aboutText[4]),
          // const SizedBox(height: 20),
          // header2Text(aboutText[5]),
          // const SizedBox(height: 10),
          // pText(aboutText[6]),
          //header2Text(aboutText[7]),
          //dotsText(aboutText[8]),
          //dotsText(aboutText[9]),
          //dotsText(aboutText[10]),
          //dotsText(aboutText[11]),
          //const Expanded(child: SizedBox()),
          const SizedBox(height: 20),
          aboutRowContents(version ?? ''),
        ],
      );

  customAboutRightColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          aboutContainer(
            Image.asset(
              filterQuality: FilterQuality.high,
              'assets/images/qrCodeT.png',
            ),
          ),
          const SizedBox(height: 20),
          aboutContainer(
            qrColumn1(),
          ),
          const Expanded(child: SizedBox()),
        ],
      );

  aboutContainer(Widget child) => Consumer(
        builder: (context, ref, _) => Container(
          width: 290,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).shadowColor.withOpacity(0.5),
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(cornerSize),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: child,
        ),
      );

  qrColumn1() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buttonForGithubCode(),
          buttonWebVersion(),
          licenseButton(),
        ],
      );

  Uri urlCode =
      Uri(scheme: 'https', host: 'github.com', path: 'TonyGnk/algorithms');

  buttonForGithubCode() => Row(
        children: [
          Expanded(
            child: aboutTextButton(
              () async {
                if (await canLaunchUrl(urlCode)) {
                  await launchUrl(urlCode);
                } else {
                  throw 'Could not launch $urlCode';
                }
              },
              //Button showing the open source code of the app
              'View code on Github',
              const Icon(Icons.code),
            ),
          ),
        ],
      );

//https://tonygnk.github.io/algorithms/
  Uri urlWebVersion =
      Uri(scheme: 'https', host: 'tonygnk.github.io', path: 'algorithms');

//In Github Pages is hosted the web version of the app
// This button will open the web version of the app
  buttonWebVersion() => Row(
        children: [
          Expanded(
            child: aboutTextButton(
              () async {
                if (await canLaunchUrl(urlWebVersion)) {
                  await launchUrl(urlWebVersion);
                } else {
                  throw 'Could not launch $urlWebVersion';
                }
              },
              //Button showing the open source code of the app
              'View web version',
              const Icon(Icons.web),
            ),
          ),
        ],
      );

  licenseButton() => Consumer(
        builder: (context, ref, child) => Row(
          children: [
            Expanded(
              child: aboutTextButton(
                () {
                  showLicensePage(
                    context: context,
                    applicationName: 'Node Odyssey',
                    applicationVersion: '1.0.0',
                    applicationLegalese: '© 2023 TonyGnk',
                  );
                },
                'View Open Source Licenses',
                //icon for licenses
                const Icon(Icons.feed_outlined),
              ),
            ),
          ],
        ),
      );
}

aboutTextButton(
  VoidCallback onPressed,
  String label,
  Widget icon, [
  AlignmentGeometry? alignment = Alignment.centerLeft,
]) =>
    Consumer(
      builder: (context, ref, _) => TextButton.icon(
        onPressed: onPressed,
        label: Text(
          label,
          style: TextStyle(fontFamily: 'Play'),
        ),
        icon: icon,
        style: ButtonStyle(
          alignment: alignment,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerSize - 2),
            ),
          ),
          //color #618CD3
          foregroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 149, 173, 214),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 149, 173, 214).withOpacity(0.2),
          ),
        ),
      ),
    );
