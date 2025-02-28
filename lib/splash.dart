import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pilot18/web_to_app.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const WebToApp(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "images/logo.png",
                width: 200,
                height: 200,
              ),
            )
          ],
        )

        // Container(
        //   width: double.infinity,
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: <Color>[
        //         //Color.fromARGB(255, 54, 1, 63),
        //         Color.fromARGB(255, 54, 1, 63),
        //         //  Color.fromARGB(255, 54, 1, 63),
        //         Color.fromARGB(255, 54, 1, 63),
        //       ],
        //     ),
        //   ),
        //   child: const Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Padding(
        //         padding: EdgeInsets.all(26.0),
        //         child: Image(
        //           image: AssetImage('images/logo.png'),
        //           width: 300,
        //           height: 300,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
