import 'package:flutter/material.dart';

import '../Archive/templates/custom_animated.dart';

Widget circularProgressScreen(BuildContext context, String snackBarMessage) =>
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: customAnimatedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
                Text(snackBarMessage),
              ],
            ),
          ),
        ),
      ),
    );
