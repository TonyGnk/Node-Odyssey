import 'package:flutter/material.dart';
import '../../Services & Providers/constants.dart';
import 'tracking_bf.dart';

Container c1(BuildContext context) => Container(
      //height: 300,
      //height: MediaQuery.of(context).size.height - 86,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          //bottomRight: Radius.circular(cornerSize),
          bottomLeft: Radius.circular(cornerSize),
        ),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Expanded(child: trackingListBF()),
          const Divider(
            color: Colors.black,
          ),
          const Text('Χρόνος'),
          const SizedBox(height: 120),
        ],
      ),
    );
