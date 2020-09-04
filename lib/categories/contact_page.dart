import 'package:flutter/material.dart';
import 'package:like_ict_tube_app/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: ('Contact Us\n'),
              style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold, letterSpacing: 4.0, ),
              children:[
                TextSpan(
                  text: ( '( Like ICT-Tube Admin )' ),
                  style: TextStyle(color: Colors.white70,fontSize: 18,fontStyle: FontStyle.italic, letterSpacing: 1.50),
                ),
              ]
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 35,),
          onPressed: () async {
            Navigator.of(context).pop();

          },
        ),
        flexibleSpace: appBarContainer,
      ),
      //categoryAppBar('Contact Us','Like ICT-Tube Admin'),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/asatter_profile.png', width: MediaQuery.of(context).size.width * 0.80, alignment: Alignment.center,)
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Text('Abdus Satter', style: TextStyle(fontFamily: 'Ranchers', letterSpacing: 2,fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),),
                      SizedBox(height: 5,),
                      Text('Web and Mobile Apps Developer,', style: TextStyle(fontFamily: 'Lato', fontStyle: FontStyle.italic, fontSize: 20, color: Colors.grey.shade800),textAlign: TextAlign.center,),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: ()async {
                          const url = 'http://arifcollege.info';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'Lecturer in ', style: TextStyle(fontFamily: 'Lato',fontSize: 20, color: Colors.grey.shade900, fontStyle: FontStyle.italic),
                              children: [
                                TextSpan(
                                  text: 'MEH Arif College', style: TextStyle(fontFamily: 'Lato', fontStyle: FontStyle.italic, fontSize: 20, color: Colors.blue.shade500),
                                ),
                              ]
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: ()async {
                          const url = 'tel: +8801912343530';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'Mobile: ', style: TextStyle(fontFamily: 'Lato', fontSize: 18, color: Colors.grey.shade900, fontStyle: FontStyle.italic),
                            children: [
                              TextSpan(
                                text: '+88 01912 34 35 30', style: TextStyle(fontFamily: 'Lato', fontStyle: FontStyle.italic, fontSize: 20, color: Colors.blue.shade500),
                              ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: ()async {
                          const url = 'https://www.facebook.com/abdussatter111';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'FB: ', style: TextStyle(fontFamily: 'Lato', fontSize: 18, color: Colors.grey.shade900, fontStyle: FontStyle.italic),
                              children: [
                                TextSpan(
                                  text: 'fb.me/abdussatter111', style: TextStyle(fontFamily: 'Lato', fontStyle: FontStyle.italic, fontSize: 20, color: Colors.blue.shade500),
                                ),
                              ]
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: ()async {
                          const url = 'https://www.youtube.com/abdussatter';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'Youtube: ', style: TextStyle(fontFamily: 'Lato', fontSize: 18, color: Colors.grey.shade900, fontStyle: FontStyle.italic),
                              children: [
                                TextSpan(
                                  text: 'yt.com/abdussatter', style: TextStyle(fontFamily: 'Lato', fontStyle: FontStyle.italic, fontSize: 20, color: Colors.blue.shade500),
                                ),
                              ]
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: ()async {
                          const url = 'mailto:abdussatter51@gmail.com?subject=News&body=New%20plugin';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'Email: ', style: TextStyle(fontFamily: 'Lato', fontSize: 18, color: Colors.grey.shade900, fontStyle: FontStyle.italic),
                              children: [
                                TextSpan(
                                  text: 'abdussatter51@gmail.com', style: TextStyle(fontFamily: 'Lato', fontStyle: FontStyle.italic, fontSize: 20, color: Colors.blue.shade500),
                                ),
                              ]
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: ()async {
                          const url = 'http://abdussatter.com';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'Website: ', style: TextStyle(fontFamily: 'Lato', fontSize: 18, color: Colors.grey.shade900, fontStyle: FontStyle.italic),
                            children: [
                              TextSpan(
                                text: 'www.abdussatter.com', style: TextStyle(fontFamily: 'Lato', fontStyle: FontStyle.italic, fontSize: 20, color: Colors.blue.shade500),
                              ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      )
    );
  }
}
