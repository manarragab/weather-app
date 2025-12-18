import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';

import '../toast_utils.dart';

class CustomLauncher {
  Future<bool> checkUrl(Uri url) async {
    return launcher.canLaunchUrl(url);
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      showToast('Could not launch $url', MessageErrorType.error);
    }
  }

  Future<void> launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration:
          const WebViewConfiguration(headers: <String, String>{}),
    )) {
      showToast('Could not launch $url', MessageErrorType.error);
    }
  }

  Future<void> launchInWebViewWithoutJavaScript(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      showToast('Could not launch $url', MessageErrorType.error);
    }
  }

  Future<void> launchInWebViewWithoutDomStorage(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
    )) {
      showToast('Could not launch $url', MessageErrorType.error);
    }
  }

  Future<void> launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  Widget launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  launchWhatsApp({required String phone, String message = ""}) async {
    try {
      launchInBrowser(Uri.parse(
          "https://api.whatsapp.com/send/?phone=$phone&text=$message"));
    } catch (e) {
      showToast("can't open whatsapp", MessageErrorType.error);
    }
  }

  void moveToLocations({String? lat, String? lon}) {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    launchInBrowser(Uri.parse(googleUrl));
  }
}
