import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services & Providers/constants.dart';
import '../Services/List Panel/list_provider.dart';
import 'create_stage.dart';
import 'list_and_button.dart';

// This a the left column of the Breadth First Algorithm page.
Widget leftColumnBf(BuildContext context) => Column(
      children: [
        Expanded(
          child: trackingListAndButton(context),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 222,
          child: algorithmTimeDisplay(
            context,
          ),
        ),
      ],
    );

Widget trackingListAndButton(BuildContext context) =>
    Consumer(builder: (context, ref, _) {
      final isCreating = ref.watch(isCreatingProvider);
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornerSize),
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
              Container(
                //  color: Colors.red,
                child: trackingListConsumerBF(),
              ),
              // Transform(
              //   transform: Matrix4.identity()
              //     ..setEntry(3, 2, 0.001), // perspective
              //   //..rotateX(0.01) // rotated around the x-axis a little
              //   // ..translate(0.0, 20.0, 0.0), // moved up vertically
              //   alignment: FractionalOffset.center,
              //   child: Container(
              //     color: isCreating
              //         ? Colors.blue.withOpacity(0.4)
              //         : Colors.blue.withOpacity(0),
              //     //  child: Selector2(),
              //   ),
              // ),
            ],
          )

          // Column(
          //   children: [
          //     isCreating
          //         ? const Expanded(child: Selector2())
          //         : Expanded(child: trackingListConsumerBF()),
          //     const SizedBox(height: 4),
          //     isCreating ? const SizedBox() : buttonArea(context),
          //   ],
          // ),
          );
    });

// This is is the left and bottom container counting the time of the algorithm.
Widget algorithmTimeDisplay(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
      child: Center(
        child: Text(
          'Κάτι για τους Χρόνους Εκτέλεσης...',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ),
    );
