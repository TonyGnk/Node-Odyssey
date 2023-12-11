import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_down_of_qr.dart';
import 'about_main.dart';

import '../../../Services & Providers/constants.dart';
import 'about_new_version.dart';

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
        aboutContainer(qrCodeColumn()),
        const Expanded(child: SizedBox()),
      ],
    );

aboutContainer(Widget child) => Consumer(
      builder: (context, ref, _) => Container(
        width: 270,
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

//
//
//
//
//
//
//
//
//
//

const aboutText = [
  'Node Odyssey',
  'Overview',
  'This Flutter app is designed to tackle problems through advanced algorithms, employing techniques like Breadth-First Search, Depth-First Search, Best First, and A*. It provides a versatile solution by taking a starting value, a target value, and allowing users to select the algorithm that best suits their needs.',
  'Functionality',
  'The core functionality revolves around exploring a path from the specified starting value to the target value. The app supports a variety of algorithms, each offering a unique approach to problem-solving. The allowed calculations include addition (+1), subtraction (-1), multiplication (*2), division (/2), and exponentiation (^2). This ensures flexibility in addressing different scenarios.',
  'Graphical User Interface (GUI)',
  "One of the standout features of this app is its intuitive Graphical User Interface (GUI). The GUI provides a visually appealing representation of the progress made by each algorithm during the search process. Users can observe and analyze the algorithm's steps, gaining insights into its decision-making process.",
  'Key Features',
  'Algorithm Selection: Choose from a range of algorithms, including Breadth-First Search, Depth-First Search, Best First, and A*.',
  'Input Flexibility: Input a starting value and a target value, allowing for a customizable problem-solving experience.',
  'Allowed Calculations: Define the rules of the exploration with permitted calculations (+1, -1, *2, /2, ^2).',
  "Visual Progress: The GUI visually illustrates the algorithm's progress, enhancing user understanding.",
];

//flutter url https://flutter.dev/
Uri flutterUrl = Uri(scheme: 'https', host: 'flutter.dev');

//flutter url https://flutter.dev/
Uri tonyGnkUrl = Uri(scheme: 'https', host: 'github.com', path: 'TonyGnk');

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

aboutContainer2(bool fill, Widget child) => Consumer(
      builder: (context, ref, _) => Container(
        //width: 290,
        height: 40,
        decoration: BoxDecoration(
          color: fill
              ? Theme.of(context).shadowColor.withOpacity(0.5)
              : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(cornerSize),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );
