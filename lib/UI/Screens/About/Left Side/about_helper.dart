import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Services & Providers/constants.dart';
import '../about_constants.dart';
import '../Right Side/about_down_of_qr.dart';
import 'about_actions_row.dart';

leftColumnAbout(String? version) => Column(
      children: [
        headerText(aboutText[0], AboutTextSize.large),
        const SizedBox(height: 20),
        headerText(aboutText[1], AboutTextSize.medium),
        const SizedBox(height: 10),
        headerText(aboutText[2], AboutTextSize.small),
        const SizedBox(height: 20),
        headerText(aboutText[3], AboutTextSize.medium),
        const SizedBox(height: 10),
        headerText(aboutText[4], AboutTextSize.small),
        const SizedBox(height: 20),
        aboutRowContents(version ?? ''),
      ],
    );
headerText(String text, AboutTextSize textType) => Text(
      text,
      style: TextStyle(
        fontSize: findFontSize(textType),
        fontFamily: 'Play',
      ),
      textAlign: TextAlign.left,
    );

//Provider for a Uri with name updateLink
final updateLinkProvider = StateProvider<Uri>((ref) => Uri(
      scheme: 'https',
      host: 'github.com',
      path: 'TonyGnk/algorithms/releases/latest',
    ));

//Update Button
aboutUpdateButton() => Consumer(builder: (context, ref, _) {
      final updateLink = ref.watch(updateLinkProvider);
      return qrButtonsTemplate(
        () async {
          if (await canLaunchUrl(updateLink)) {
            await launchUrl(updateLink);
          } else {
            throw 'Could not launch $updateLink';
          }
        },
        'Update',
        const Icon(Icons.system_update_outlined),
        Alignment.center,
      );
    });

snackBar(
  BuildContext context,
  String message,
  bool showAction,
  Uri updateLink,
) =>
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'Play',
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      action: SnackBarAction(
        textColor: Theme.of(context).colorScheme.onBackground,
        label: 'Update',
        onPressed: () async {
          if (await canLaunchUrl(updateLink)) {
            await launchUrl(updateLink);
          } else {
            throw 'Could not launch $updateLink';
          }
        },
      ),
      //round corners
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerSize),
      ),
      showCloseIcon: true,
      closeIconColor: Theme.of(context).colorScheme.onBackground,
      backgroundColor: Theme.of(context).shadowColor,
    );
