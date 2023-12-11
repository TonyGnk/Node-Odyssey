import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Services & Providers/constants.dart';
import '../about_constants.dart';
import 'about_helper.dart';
import 'about_update_handler.dart';

aboutRowContents(String version) => Consumer(
      builder: (context, ref, _) {
        final updateLink = ref.watch(updateLinkProvider);
        return SizedBox(
          height: 40,
          child: Row(
            children: [
              aboutTextButton2(
                () {},
                'Version $version',
                const Icon(Icons.info_outline_rounded),
              ),
              aboutTextButton2(
                () async {
                  if (await canLaunchUrl(tonyGnkUrl)) {
                    await launchUrl(tonyGnkUrl);
                  } else {
                    throw 'Could not launch $tonyGnkUrl';
                  }
                },
                'Created by TonyGnk',
                const Icon(Icons.person_outline_rounded),
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
              ),
            ],
          ),
        );
      },
    );

aboutTextButton2(
  VoidCallback onPressed,
  String label,
  Widget icon,
) =>
    TextButton.icon(
      onPressed: onPressed,
      label: Text(
        label,
        style: const TextStyle(fontFamily: 'Play'),
      ),
      icon: icon,
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerSize - 2),
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 149, 173, 214),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 149, 173, 214).withOpacity(0.2),
        ),
      ),
    );
