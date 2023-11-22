import 'package:flutter/material.dart';

import '../../Services & Providers/constants.dart';
import '../../UI/Adaptive Templates/body_with_appbar.dart';
import '../../UI/Routed Screen/app_bar.dart';
import 'Chart BF/main_right_column_bf.dart';
import 'Stopwatch BF/time.dart';
import 'Create & Tracking List/main_tracking_list_bf.dart';

class BreadthFirstAlg extends StatelessWidget {
  const BreadthFirstAlg({super.key});

  @override
  Widget build(BuildContext context) => bodyWithAppBar(
        appBar: appBarBf(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: body(context),
        ),
      );
}

// Αυτή είναι η γραμμή τίτλου της οθόνης
// Περιλαμβάνει το όνομα του αλγορίθμου και τα εικονίδια θέματος και πληροφοριών
Widget appBarBf(BuildContext context) => const AdaptAppBar(
      filled: false,
      label: 'Αλγόριθμος Πρώτα σε Βάθος',
      showThemeIcon: true,
      showInfoIcon: true,
    );

// Αυτή είναι το κεντρικό σώμα της οθόνης
// Περιλαμβάνει την αριστερή και την δεξιά στήλη
Widget body(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: leftColumnBf(context),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 14,
          child: rightColumnBf(context),
        ),
      ],
    );

// Αυτή είναι η αριστερή στήλη της οθόνης
// Περιλαμβάνει την φόρμα αναζήτησης-οθόνη παρακολούθησης και το χρονόμετρο
Widget leftColumnBf(BuildContext context) => Column(
      children: [
        Expanded(
          child: trackingListAndButton(context),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: algorithmTimeDisplay(context),
        ),
      ],
    );

// Αυτή είναι η δεξιά στήλη της οθόνης
// Περιλαμβάνει την γραφική παράσταση και την οθόνη αποτελεσμάτων
Widget rightColumnBf(BuildContext context) => Column(
      children: [
        Expanded(
          child: containerZ(context),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: resultPanel(
            context,
          ),
        ),
      ],
    );

// Κάθε βασικό στοιχείο της οθόνης είναι ένα Container
// Περιλαμβάνει ένα πρότυπο στυλ για τα Container
Container containerWithStyleBF(
  Color color,
  Color borderColor,
  Widget child,
) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize),
        color: color,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
