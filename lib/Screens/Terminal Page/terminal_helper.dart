// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services & Providers/text_editor_provider.dart';
import 'terminal_helpler2.dart';
import 'terminal_side.dart';

final controllerProvider = StateProvider<TextEditingController>(
  (ref) => TextEditingController(
    text: system32Text,
  ),
);

terminalText(String text) => Text(
      text,
      style: const TextStyle(
        fontFamily: 'Consolas',
        fontSize: 16,
      ),
    );

String windowsText =
    'Microsoft Windows [Version 10.0.19042.1165]\n(c) Microsoft Corporation. All rights reserved';

final textProvider = StateProvider<String>((ref) => '');

void addText(String text, WidgetRef ref) {
  ref.watch(textProvider.notifier).state = '${ref.read(textProvider)}\n$text';
}

String system32Text = 'C:\\Windows\\System32> ';

final terminalRowsProvider = StateProvider<List<Widget>>((ref) => []);

final justForRefreshProvider = StateProvider<bool>((ref) => false);
