import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:like_ict_tube_app/utilities/constant.dart';
import 'package:like_ict_tube_app/utilities/keys.dart';

class MultidrawerBodyPart extends StatefulWidget {
  @override
  _MultidrawerBodyPartState createState() => _MultidrawerBodyPartState();
}

class _MultidrawerBodyPartState extends State<MultidrawerBodyPart> {
  AdmobBannerSize bannerSize;

  @override
  void initState() {
    super.initState();
    bannerSize = AdmobBannerSize.LARGE_BANNER;

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        decoration: BoxDecoration(
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: size.width,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),

                  gradient: new LinearGradient(
                      colors: [
                        Colors.green,
                        Colors.deepPurple,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp
                  ),
                ),
                child: Text('প্রারম্ভিক কথা',
                  style: TextStyle(fontFamily: 'Lato', fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold)),),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Text(para1, style: paraStyle, textAlign: TextAlign.justify,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Text(para2, style: paraStyle, textAlign: TextAlign.justify,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Text(para3, style: paraStyle, textAlign: TextAlign.justify,),
                ),
              ),
              /*Container(
                child: AdmobBanner(
                  adUnitId: getBannerAdUnitId(),
                  adSize: bannerSize,
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Text(para4, style: paraStyle, textAlign: TextAlign.justify,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Text(para5, style: paraStyle, textAlign: TextAlign.justify,),
                ),
              ),
              Container(
                child: AdmobBanner(
                  adUnitId: getBannerAdUnitId(),
                  adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
                ),
              ),
              SizedBox(height: 100,)
            ],
          ),
        )
    );
  }
}
