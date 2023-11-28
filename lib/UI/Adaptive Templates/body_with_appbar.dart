// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

Widget bodyWithAppBar({
  required BuildContext context,
  required Widget appBar,
  required Widget body,
}) =>
    Stack(children: [
      backgroundWallWithRandShapes(context),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Column(
          children: [
            appBar,
            Expanded(child: body),
          ],
        ),
      ),
    ]);

Widget backgroundWallWithRandShapes(BuildContext context) => Row(
      children: [
        Column(
          children: [
            Expanded(child: SizedBox()),
            Expanded(child: SizedBox()),
            Container(
              height: 400 * MediaQuery.of(context).size.height / 620,
              width: 400 * MediaQuery.of(context).size.height / 620,
              decoration: BoxDecoration(
                //Gradient color light blue to dark
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(32, 102, 224, 0.2),
                    Color.fromRGBO(32, 112, 194, 0.2),
                    Color.fromRGBO(52, 112, 234, 0.2),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(1400),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
