import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Services & Providers/constants.dart';
import 'about_state.dart';

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
  build(BuildContext context) => Row(
        children: [
          Expanded(flex: 3, child: customAboutLeftColumn()),
          customAboutRightColumn(),
          const SizedBox(width: 20),
        ],
      );
}

customAboutLeftColumn() => const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Κείμενο'),
        Expanded(child: SizedBox()),
      ],
    );
customAboutRightColumn() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        aboutContainer(
          290,
          Image.asset(
            filterQuality: FilterQuality.high,
            'assets/images/qrCodeT.png',
          ),
        ),
        const SizedBox(height: 20),
        aboutContainer(
          290,
          qrColumn(),
        ),
        const Expanded(child: SizedBox()),
      ],
    );

aboutContainer(double width, Widget child) => Consumer(
      builder: (context, ref, _) => Container(
        width: width,
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

qrColumn() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        buttonForGithubCode(),
        licenseButton()
        //Open Source Flutter licenses
      ],
    );

Uri url = Uri(scheme: 'https', host: 'github.com', path: 'TonyGnk/algorithms');

buttonForGithubCode() => Row(
      children: [
        Expanded(
          child: aboutTextButton(
            () async {
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            //Button showing the open source code of the app
            const Text('View code on Github'),
            const Icon(Icons.code),
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
              const Text('View Open Source Licenses'),
              //icon for licenses
              const Icon(Icons.feed_outlined),
            ),
          ),
        ],
      ),
    );

aboutTextButton(
  VoidCallback onPressed,
  Widget label,
  Widget icon,
) =>
    Consumer(
      builder: (context, ref, _) => TextButton.icon(
        onPressed: onPressed,
        label: label,
        icon: icon,
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
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
