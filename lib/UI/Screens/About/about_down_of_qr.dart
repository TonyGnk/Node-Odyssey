/// Implements the QR section in the About screen.
/// Includes buttons for GitHub code, web version, and open source licenses.
/// Buttons are styled using the `aboutTextButton` widget.
/// `aboutTextButton` is a custom widget that wraps `TextButton.icon` with a specific style.
/// Used as a child of `Column` widget in `qrColumn1` function.
/// `buttonForGithubCode`, `buttonWebVersion`, and `licenseButton` functions create individual buttons.
/// `aboutTextButton` is a consumer widget that takes a callback function, label, icon, and optional alignment as parameters.
/// Returns a styled `TextButton.icon` widget.
/// `Consumer` widget is used to access `context` and `ref` objects within `aboutTextButton` function.
/// `showLicensePage` function is called when "View Open Source Licenses" button is pressed, displaying open source licenses.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Services & Providers/constants.dart';

qrCodeColumn() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        githubButton(),
        webVersionButton(),
        licenseButton(),
      ],
    );

Uri urlCode =
    Uri(scheme: 'https', host: 'github.com', path: 'TonyGnk/algorithms');
githubButton() => qrButtonsTemplate(
      () async {
        if (await canLaunchUrl(urlCode)) {
          await launchUrl(urlCode);
        } else {
          throw 'Could not launch $urlCode';
        }
      },
      'View code on Github',
      const Icon(Icons.code),
    );

Uri urlWebVersion =
    Uri(scheme: 'https', host: 'tonygnk.github.io', path: 'algorithms');
webVersionButton() => qrButtonsTemplate(
      () async {
        if (await canLaunchUrl(urlWebVersion)) {
          await launchUrl(urlWebVersion);
        } else {
          throw 'Could not launch $urlWebVersion';
        }
      },
      'View web version',
      const Icon(Icons.web),
    );

licenseButton() => Consumer(
      builder: (context, ref, child) => qrButtonsTemplate(
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
    );

qrButtonsTemplate(
  VoidCallback onPressed,
  String label,
  Widget icon, [
  AlignmentGeometry? alignment = Alignment.centerLeft,
]) =>
    Consumer(
      builder: (context, ref, _) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              onPressed: onPressed,
              label: Text(
                label,
                style: const TextStyle(fontFamily: 'Play'),
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
          ),
        ],
      ),
    );