import 'package:flutter/material.dart';
import 'result_panel.dart';

Container c2(BuildContext context) => Container(
      //height: 300,
      //height: MediaQuery.of(context).size.height - 86,
      //padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(),
          ),
          Expanded(flex: 3, child: resultPanel(context)),
        ],
      ),
    );
