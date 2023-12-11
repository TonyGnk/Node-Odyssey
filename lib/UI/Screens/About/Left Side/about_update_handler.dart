import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../about_constants.dart';
import 'about_helper.dart';

Future<bool> getLatestVersion(
    WidgetRef ref, String currentVersion, Uri updateLink) async {
  final String latestVersion;
  final String latestLinkVersion;
  log(currentVersion);
  //Find the latest version
  final response = await http.get(Uri.parse(githubApiUrl));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    log(jsonResponse['tag_name']);
    latestVersion = jsonResponse['tag_name'];
    latestLinkVersion = jsonResponse['html_url'];
    //Set the latest version provider  updateLinkProvider
    ref.read(updateLinkProvider.notifier).state = Uri.parse(
      latestLinkVersion.toString(),
    );
  } else {
    throw Exception('Failed to fetch version from GitHub');
  }

  // Split versions by '.' and '+'
  List<String> latestVersionParts =
      latestVersion.toString().split(RegExp('[.+]+'));
  //remove the last part of the version
  latestVersionParts.removeLast();
  List<String> currentVersionParts = currentVersion.split(RegExp('[.+]+'));

  // Compare parts
  int latestPart = int.parse(latestVersionParts[0]);
  int currentPart = int.parse(currentVersionParts[0]);

  if (latestPart > currentPart) {
    log('A major update is available');
    ScaffoldMessenger.of(ref.context).showSnackBar(
      snackBar(ref.context, 'A major update is available', true, updateLink),
    );
    return false;
  } else {
    latestPart = int.parse(latestVersionParts[1]);
    currentPart = int.parse(currentVersionParts[1]);
    if (latestPart > currentPart) {
      log('A minor update is available');
      ScaffoldMessenger.of(ref.context).showSnackBar(
        snackBar(ref.context, 'A minor update is available', true, updateLink),
      );
      return false;
    } else {
      latestPart = int.parse(latestVersionParts[2]);
      currentPart = int.parse(currentVersionParts[2]);

      if (latestPart > currentPart) {
        log('A patch update is available');
        ScaffoldMessenger.of(ref.context).showSnackBar(
          snackBar(
              ref.context, 'A patch update is available', true, updateLink),
        );
        return false;
      } else {
        log('No update is available');
        ScaffoldMessenger.of(ref.context).showSnackBar(
          snackBar(
            ref.context,
            'No update is available',
            false,
            updateLink,
          ),
        );
        return true;
      }
    }
  }
}
