import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

void showAlert(BuildContext context, bool disable) {
  disable
      ? unawaited(
          showAnimatedDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) => AlertDialog(
              icon: const Icon(Icons.info_outline),
              title: const Center(child: Text('Καλώς Ορίσατε')),
              content: ConstrainedBox(
                constraints: const BoxConstraints(
                  //maxHeight: 300,
                  maxWidth: 550,
                ),
                child: const Text(
                    "Παρακαλούμε διαβάστε προσεκτικά τις παρακάτω οδηγίες εκτέλεσης για τη χρήση της εφαρμογής\n-Εκκινήστε την εφαρμογή\n-Επιλέξτε τη μέθοδο επίλυσης (π.χ., 'breadth' για BFS, 'depth' για DFS, 'best' για τον αλγόριθμο best-first, 'astar' για τον αλγόριθμο A*)\n-Καθορίστε την αρχική τιμή, την τιμή στόχο και το όνομα του αρχείου λύσης.\nΕκτελέστε την εφαρμογή.\nsΗ λύση θα εμφανιστεί στο αρχείο λύσης, σύμφωνα με τη μορφή που περιγράφηκε στην εκφώνηση."),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Κλείσιμο'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 500),
          ),
        )
      : SizedBox();
}
