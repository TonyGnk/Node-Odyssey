import 'package:flutter/material.dart';
import '../../Services & Providers/constants.dart';
import 'result_panel.dart';
import 'tracking_bf.dart';

Container c2(BuildContext context) => Container(
      //height: 300,
      //height: MediaQuery.of(context).size.height - 86,
      //padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                ),
              ),
            ),
          ),
          Expanded(flex: 3, child: resultPanel(context)),
        ],
      ),
    );
