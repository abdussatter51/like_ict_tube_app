import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'message_model.dart';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _getToken() {
    _firebaseMessaging.getToken().then((token) {
      print("Device Token: $token");
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

}
