import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_ict_tube_app/models/video_model.dart';
import 'package:like_ict_tube_app/utilities/keys.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {

  final String id;
  final Video video;

  VideoScreen({this.id, this.video});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  Video video;

  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    if(mediaQueryData.orientation == Orientation.portrait)
    {
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text(widget.video.title, maxLines: 2, style: TextStyle(fontSize: 19, color: Colors.white),),),
            flexibleSpace: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF00CCFF),
                      const Color(0xFF3366FF),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 35,),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ),
          /*AppBar(
        title: Text(widget.video.title,
        ),
      ),*/
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Container(
                  child: AdmobBanner(
                    adUnitId: getBannerAdUnitId(),
                    adSize: AdmobBannerSize.BANNER,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      onReady: () {

                      },
                    ),
                  ),
                ),
                //SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Connect and Share by', style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic,
                    color: Colors.grey.shade600, fontFamily: 'Roboto',),),
                ),
            Container(
              width: 180,
              height: 2,
              color: Colors.purpleAccent,
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Tooltip(
                      message: 'Call Admin',
                      child: GestureDetector(
                        onTap: ()async {
                          const url = 'tel: +8801912343530';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Image.asset('assets/images/call.png',)
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 3,
                      color: Colors.green,
                    ),
                    Tooltip(
                      message: 'Send Message',
                      child: GestureDetector(
                          onTap: ()async {
                            const url = 'sms: +8801912343530';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Image.asset('assets/images/message.png',)
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 3,
                      color: Colors.green,
                    ),
                    Tooltip(
                      message: 'Facebook Messenger',
                      child: GestureDetector(
                          onTap: ()async {
                            const url = 'http://www.facebook.com/messages/t/60000010100191';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Image.asset('assets/images/messenger.png',)
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 3,
                      color: Colors.green,
                    ),
                    Tooltip(
                      message: 'Visit Website',
                      child: GestureDetector(
                          onTap: ()async {
                            const url = 'http://abdussatter.com/contact-us.html';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Image.asset('assets/images/website.png',)
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 3,
                      color: Colors.green,
                    ),
                    Tooltip(
                      message: 'Share this video',
                      child: GestureDetector(
                          onTap: () {
                            Share.share('https://www.youtube.com/watch?v='+widget.video.id);
                          },
                          child: Image.asset('assets/images/share.png',)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
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
                          text: '\u00a9 Copyright-2020 by ', style: TextStyle(fontFamily: 'Lato', fontSize: 18, color: Colors.grey.shade900, fontStyle: FontStyle.italic),
                          children: [
                            TextSpan(
                              text: 'Abdus Satter', style: TextStyle(fontFamily: 'Lato', fontStyle: FontStyle.italic, fontSize: 20, color: Colors.blue.shade500),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


        );
      }
        return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}