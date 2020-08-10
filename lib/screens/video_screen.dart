import 'package:flutter/material.dart';
import 'package:like_ict_tube_app/models/video_model.dart';
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.80,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {

                },
              ),
            ),
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
                      text: 'CopyRight ', style: TextStyle(fontFamily: 'Lato', fontSize: 18, color: Colors.grey.shade900, fontStyle: FontStyle.italic),
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
}