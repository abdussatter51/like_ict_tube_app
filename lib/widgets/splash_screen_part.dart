import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

import '../main.dart';

class SplashScreenPart extends StatefulWidget {
  @override
  _SplashScreenPartState createState() => _SplashScreenPartState();
}

class _SplashScreenPartState extends State<SplashScreenPart> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    final mediaQueryData = MediaQuery.of(context);
    if(mediaQueryData.orientation == Orientation.portrait)
      {
        return SplashScreen(
          seconds: 5,
          navigateAfterSeconds: MyHomePage(),
          image: Image.asset(
            "assets/images/logo.png",
          ),
          gradientBackground: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.green]),
          styleTextUnderTheLoader: new TextStyle(
              fontSize: 18, color: Colors.white, fontStyle: FontStyle.italic),
          loadingText: Text(
            'This is an educational app',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontStyle: FontStyle.italic),
          ),
          photoSize: 200.0,
          loaderColor: Colors.white,
          backgroundColor: Colors.white,
        );
      }
        return SplashScreen(
      seconds: 5,
          navigateAfterSeconds: MyHomePage(),
          image: Image.asset(
            "assets/images/logo.png",
          ),
          gradientBackground: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.green]),
          styleTextUnderTheLoader: new TextStyle(
              fontSize: 10, color: Colors.white, fontStyle: FontStyle.italic),
          loadingText: Text(
            'This is an educational app',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontStyle: FontStyle.italic),
          ),
          photoSize: 100.0,
          loaderColor: Colors.white,
          backgroundColor: Colors.white,
    );
  }
}
