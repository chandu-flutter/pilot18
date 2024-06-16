import 'package:flutter/material.dart';
import 'package:pilot18/my_web_view.dart';
import 'package:share_plus/share_plus.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebToApp extends StatefulWidget {
  const WebToApp({super.key});

  @override
  State<WebToApp> createState() => _WebToAppState();
}

class _WebToAppState extends State<WebToApp> {
  late final WebViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.pilot18.com/'),
      );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PILOT 18",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 2, 9, 134),
        foregroundColor: Colors.white,
        actions: [
          InkWell(
              onTap: () {
                Share.share(
                    'https://play.google.com/store/apps/details?id=com.training.pilot18');
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 26.0, right: 8.0),
                child: Icon(Icons.share),
              )),
        ],
      ),
      body: MyWebView(controller: controller),
    );
  }
}
