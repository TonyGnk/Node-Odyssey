import 'package:flutter/material.dart';

header1Text(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 31,
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
//Κουκκίδες για απαρίθμηση Κείμενο πρόσθεσε στην αρχή
dotsText(String text) => Text(
      '• $text',
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Play',
      ),
      textAlign: TextAlign.left,
    );

const aboutText = [
  'Algorithm Visualizer',
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
