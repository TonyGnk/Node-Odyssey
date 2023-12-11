import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_main.dart';

import '../../../Services & Providers/constants.dart';

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

aboutRowContents(String version) => aboutContainer(
    false,
    Row(
      children: [
        aboutTextButton(
          () {},
          version,
          const Icon(Icons.info_outline_rounded),
          Alignment.center,
        ),
        aboutTextButton(
          () async {
            if (await canLaunchUrl(tonyGnkUrl)) {
              await launchUrl(tonyGnkUrl);
            } else {
              throw 'Could not launch $tonyGnkUrl';
            }
          },
          'Create by TonyGnk',
          const Icon(Icons.person_outline_rounded),
          Alignment.center,
        ),
        aboutTextButton(
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
        aboutTextButton(
          () async {},
          'Check for updates',
          const Icon(Icons.update_outlined),
          Alignment.center,
        ),
      ],
    ));

aboutContainer(bool fill, Widget child) => Consumer(
      builder: (context, ref, _) => Container(
        //width: 290,
        height: 40,
        padding: const EdgeInsets.all(4),
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
