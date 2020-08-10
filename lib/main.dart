import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:like_ict_tube_app/utilities/keys.dart';
import 'package:like_ict_tube_app/widgets/multidrawer_part.dart';
import 'package:like_ict_tube_app/widgets/splash_screen_part.dart';
void main(){
  Admob.initialize(getAppId());
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Like ICT Youtube Channel',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
     return new SplashScreenPart();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultidrawerPart();

  }
}