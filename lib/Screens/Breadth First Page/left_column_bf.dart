import 'package:flutter/material.dart';
import '../../Services & Providers/constants.dart';
import 'tracking_bf.dart';

Container c1(BuildContext context) => Container(
      //height: 300,
      //height: MediaQuery.of(context).size.height - 86,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(cornerSize)),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
      ),
      child: Column(
        children: [
          Expanded(child: trackingListBF()),
        ],
      ),
    );
