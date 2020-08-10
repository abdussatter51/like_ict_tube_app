
import 'package:flutter/material.dart';
import 'package:like_ict_tube_app/utilities/constant.dart';

categoryAppBar ([String firstTitle, String secondTitle]){

  return AppBar(
      centerTitle: true,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: (firstTitle+'\n'),
            style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold, letterSpacing: 4.0, ),
            children:[
              TextSpan(
                text: '( '+secondTitle+' )',
                style: TextStyle(color: Colors.white70,fontSize: 18,fontStyle: FontStyle.italic, letterSpacing: 1.50),
              ),
            ]
        ),
      ),
      flexibleSpace: appBarContainer
  );
}