import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  final WebViewController controller;
  const MyWebView({super.key, required this.controller});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  var loadingPercentage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(
              () {
                loadingPercentage = 0;
              },
            );
          },
          onProgress: (progress) {
            setState(
              () {
                loadingPercentage = progress;
              },
            );
          },
          onPageFinished: (url) {
            loadingPercentage = 100;
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        "SnackBar",
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message.message),
            ),
          );
        },
      );
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: widget.controller),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
