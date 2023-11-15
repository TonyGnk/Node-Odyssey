import 'package:flutter/material.dart';
import 'result_panel.dart';

Widget c2(BuildContext context) => Column(
      children: [
        Expanded(
          flex: 8,
          child: Container(),
        ),
        Expanded(flex: 3, child: resultPanel(context)),
      ],
    );
