import 'dart:convert';
import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:like_ict_tube_app/cloud_message/message_model.dart';
import 'package:like_ict_tube_app/models/channel_model.dart';
import 'package:like_ict_tube_app/models/video_model.dart';
import 'package:like_ict_tube_app/screens/video_screen.dart';
import 'package:like_ict_tube_app/utilities/constant.dart';
import 'package:like_ict_tube_app/utilities/keys.dart';
import 'package:route_transitions/route_transitions.dart';

class NumberSystem2020 extends StatefulWidget {
  @override
  _NumberSystem2020State createState() => _NumberSystem2020State();
}

class _NumberSystem2020State extends State<NumberSystem2020> {
  AdmobInterstitial interstitialAd;
  Channel _channel;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    _initChannel();
    interstitialAd = AdmobInterstitial(
      adUnitId: getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
      },
    );

    interstitialAd.load();
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

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: CHANNEL_ID);
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
    );
  }

  _buildVideo(Video video) {
    final mediaQueryData = MediaQuery.of(context);
    if(mediaQueryData.orientation == Orientation.portrait)
    {
      return
        GestureDetector(
          onTap: () async{
            Navigator.of(context).push(PageRouteTransition(
                animationType: AnimationType.slide_left,
                builder: (_) => VideoScreen(id: video.id, video: video,))
            );
            if (await interstitialAd.isLoaded) {
              interstitialAd.show();
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  offset: Offset(3, 3),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image(
                    image: NetworkImage(video.thumbnailUrl ,),
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  ),
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    video.title,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16.0,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

              ],
            ),
          ),
        );
    }
    return GestureDetector(
      onTap: () async{
        Navigator.of(context).push(PageRouteTransition(
            animationType: AnimationType.slide_left,
            builder: (_) => VideoScreen(id: video.id, video: video,))
        );
        if (await interstitialAd.isLoaded) {
          interstitialAd.show();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .70,
        margin: EdgeInsets.only(top: 15.0, bottom: 10, left: 15, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              offset: Offset(-3, 3),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image(
                  image: NetworkImage(video.thumbnailUrl ,),
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .65,
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  video.title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 19.0,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }
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
              text: ('CHAPTER - 3\n'),
              style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold, letterSpacing: 4.0, ),
              children:[
                TextSpan(
                  text: ( '( Number System )' ),
                  style: TextStyle(color: Colors.white70,fontSize: 18,fontStyle: FontStyle.italic, letterSpacing: 1.50),
                ),
              ]
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 35,),
          onPressed: () async {
            Navigator.of(context).pop();
            if (await interstitialAd.isLoaded) {
              interstitialAd.show();
            }
          },
        ),
        flexibleSpace: appBarContainer,
      ),
      //categoryAppBar('CHAPTER-5', 'C-Programing'),
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              child: ListView.builder(
                scrollDirection: MediaQuery.of(context).orientation == Orientation.portrait ? Axis.vertical : Axis.horizontal,
                itemCount: 1 + _channel.videos.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _buildProfileInfo();
                  }
                  Video video = _channel.videos[index - 1];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor, // Red
                ),
              ),
            ),
    );
  }

}


//==================================Api Services=====================================//
class APIService {APIService._instantiate();
static final APIService instance = APIService._instantiate();

final String _baseUrl = 'www.googleapis.com';
String _nextPageToken = '';

Future<Channel> fetchChannel({String channelId}) async {
  Map<String, String> parameters = {
    'part': 'snippet, contentDetails, statistics',
    'id': channelId,
    'key': API_KEY,
  };
  Uri uri = Uri.https(
    _baseUrl,
    '/youtube/v3/channels',
    parameters,
  );
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  // Get Channel
  var response = await http.get(uri, headers: headers);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body)['items'][0];
    Channel channel = Channel.fromMap(data);

    // Fetch first batch of videos from uploads playlist
    channel.videos = await fetchVideosFromPlaylist(
      playlistId: NUMBER_SYSTEM_2020,
    );
    return channel;
  } else {
    throw json.decode(response.body)['error']['message'];
  }
}

Future<List<Video>> fetchVideosFromPlaylist({String playlistId}) async {
  Map<String, String> parameters = {
    'part': 'snippet',
    'playlistId': playlistId,
    'maxResults': '200',
    'pageToken': _nextPageToken,
    'key': API_KEY,
  };
  Uri uri = Uri.https(
    _baseUrl,
    '/youtube/v3/playlistItems',
    parameters,
  );
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  // Get Playlist Videos
  var response = await http.get(uri, headers: headers);
  if (response.statusCode == 200) {
    var data = json.decode(response.body);

    _nextPageToken = data['nextPageToken'] ?? '';
    List<dynamic> videosJson = data['items'];

    // Fetch first eight videos from uploads playlist
    List<Video> videos = [];
    videosJson.forEach(
          (json) => videos.add(
        Video.fromMap(json['snippet']),
      ),
    );
    return videos;
  } else {
    throw json.decode(response.body)['error']['message'];
  }
}

}
