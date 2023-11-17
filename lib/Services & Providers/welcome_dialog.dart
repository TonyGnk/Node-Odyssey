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
                  maxWidth: 450,
                ),
                child: const Text(
                    'Εκτελέστε τον αλγόριθμο που επιθυμείτε πληκτρολογώντας τον στο τερματικό ή προβάλλεται τον σε γραφική κλίμακα!'),
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
      : const SizedBox();
}
