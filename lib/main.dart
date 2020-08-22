import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:like_ict_tube_app/utilities/keys.dart';
import 'package:like_ict_tube_app/widgets/multidrawer_part.dart';
import 'package:like_ict_tube_app/widgets/splash_screen_part.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'cloud_message/message_model.dart';

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

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print("onMessage: $message");
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: ListTile(
                title: Text(message['notification']['title']),
                subtitle: Text(message['notification']['body']),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        },
        onLaunch: (Map<String, dynamic> message) async{
          print("onLaunch: $message");
          final notification = message['data'];
          setState(() {
            messages.add(Message(
              title: '${notification['title']}',
              body: '${notification['body']}',
            ));
          });
        },
        onResume: (Map<String, dynamic> message) async{
          print("onResume: $message");
        }
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true)
    );
  }
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