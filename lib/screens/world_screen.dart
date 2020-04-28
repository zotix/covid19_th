import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WorldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://www.worldometers.info/coronavirus/',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
