import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pilot18/splash.dart';
import 'package:pilot18/web_to_app.dart';

void main() {
  // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  // OneSignal.Debug.setAlertLevel(OSLogLevel.none);

  // // NOTE: Replace with your own app ID from https://www.onesignal.com
  // OneSignal.initialize("c74eb003-3b35-4cf8-8d36-6da3931f85e9");

  // OneSignal.Notifications.requestPermission(true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize('c74eb003-3b35-4cf8-8d36-6da3931f85e9');
    OneSignal.Notifications.requestPermission(true).then((value) {
      print('signal value: $value');
    });
  }

  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
