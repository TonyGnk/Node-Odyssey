import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Services & Providers/constants.dart';
import 'about_down_of_qr.dart';
import 'about_main.dart';
import 'about_new_version.dart';
import 'about_text.dart';

leftColumnAbout(BuildContext context, String? version) => Column(
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
        const SizedBox(height: 20),
        aboutRowContents(context, version ?? ''),
      ],
    );

aboutRowContents(BuildContext context, String version) => Consumer(
      builder: (context, ref, _) {
        final updateLink = ref.watch(updateLinkProvider);
        return aboutContainer2(
          false,
          Row(
            children: [
              aboutTextButton2(
                () {},
                'Version $version',
                const Icon(Icons.info_outline_rounded),
                Alignment.center,
              ),
              aboutTextButton2(
                () async {
                  if (await canLaunchUrl(tonyGnkUrl)) {
                    await launchUrl(tonyGnkUrl);
                  } else {
                    throw 'Could not launch $tonyGnkUrl';
                  }
                },
                //developed by TonyGnk
                'Created by TonyGnk',
                const Icon(Icons.person_outline_rounded),
                Alignment.center,
              ),
              aboutTextButton2(
                () async {
                  if (await canLaunchUrl(flutterUrl)) {
                    await launchUrl(flutterUrl);
                  } else {
                    throw 'Could not launch $flutterUrl';
                  }
                },
                'Build With Flutter',
                const Icon(Icons.handyman_outlined),
                Alignment.center,
              ),
              aboutTextButton2(
                () async {
                  getLatestVersion(
                    ref,
                    version,
                    updateLink,
                  );
                },
                'Check for updates',
                const Icon(Icons.update_outlined),
                Alignment.center,
              ),
            ],
          ),
        );
      },
    );

header1Text(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 27,
        fontFamily: 'Play',
      ),
      textAlign: TextAlign.left,
    );

header2Text(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontFamily: 'Play',
      ),
      textAlign: TextAlign.left,
    );

pText(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Play',
      ),
      textAlign: TextAlign.left,
    );

dotsText(String text) => Text(
      '• $text',
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Play',
      ),
      textAlign: TextAlign.left,
    );

aboutTextButton2(
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
          style: const TextStyle(
            fontFamily: 'Play',
            // fontSize: 13,
          ),
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
