import 'package:flutter/material.dart';

Widget bodyWithAppBar({
  required Widget appBar,
  required Widget body,
}) =>
    Column(
      children: [
        appBar,
        Expanded(child: body),
      ],
    );
