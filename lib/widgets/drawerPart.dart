import 'package:admob_flutter/admob_flutter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_ict_tube_app/board_question/communication_networking_board_question_page.dart';
import 'package:like_ict_tube_app/categories/contact_page.dart';
import 'package:like_ict_tube_app/categories/cprogram_2019_page.dart';
import 'package:like_ict_tube_app/categories/cprogram_2020_page.dart';
import 'package:like_ict_tube_app/categories/data_communication_2020_page.dart';
import 'package:like_ict_tube_app/categories/database_management_2020_page.dart';
import 'package:like_ict_tube_app/board_question/database_management_board_question_page.dart';
import 'package:like_ict_tube_app/categories/fc_and_alg_2020_page.dart';
import 'package:like_ict_tube_app/categories/html_2019_page.dart';
import 'package:like_ict_tube_app/categories/html_2020_page.dart';
import 'package:like_ict_tube_app/categories/ict_world_and_bangladesh_2020_page.dart';
import 'package:like_ict_tube_app/categories/logic_gate_2020_page.dart';
import 'package:like_ict_tube_app/board_question/number_and_logic_gate_board_question_page.dart';
import 'package:like_ict_tube_app/categories/networking_2020_page.dart';
import 'package:like_ict_tube_app/categories/number_system_2020_page.dart';
import 'package:like_ict_tube_app/board_question/programing_board_question_page.dart';
import 'package:like_ict_tube_app/board_question/web_design_board_question_page.dart';
import 'package:like_ict_tube_app/cloud_message/cloud_messag.dart';
import 'package:like_ict_tube_app/utilities/constant.dart';
import 'package:like_ict_tube_app/utilities/keys.dart';
import 'package:like_ict_tube_app/widgets/mulitidrawer_body_part.dart';

class DrawerPart extends StatefulWidget {
  @override
  _DrawerPartState createState() => _DrawerPartState();
}

class _DrawerPartState extends State<DrawerPart> {
  AdmobBannerSize bannerSize;
  String result = '';
  connectionDialog(){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('No Internet!!', style: TextStyle(color: Colors.red, fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 2),),
            content: Text('Please check your internet connection. Turn on your MOBILE data or WIFI connection.', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontFamily: 'Lato'),),
            actions: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text('Ok', style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.only(top: 56),


      width: (mediaQueryData.orientation == Orientation.portrait)? size.width * .80 : size.width * .60,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/images/logo.png',),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: new LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp
                  ),
                ),
                alignment: Alignment.center,
                child: Text('HSC ICT COURSE', style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    wordSpacing: 2,
                    fontFamily: 'Roboto'
                ),
                textAlign: TextAlign.center,),
              ),
            ),
            //SizedBox(height: 10,),
            ExpansionTile(
              title: Row(
                children: [
                  Image.asset('assets/images/chapter_six.png', width: 30, height: 30,),
                  SizedBox(width: 10),
                  Text("Chapter - 6",style: menuStyle),
                ],
              ),
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Database - 2020",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: () async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DatabaseManagement2020()));
                    }
                  },
                ),
                SizedBox(height: 10,),
              ],
            ),
            //SizedBox(height: 5,),
            ExpansionTile(
              title: Row(
                children: [
                  Image.asset('assets/images/chapter_five.png', width: 30, height: 30,),
                  SizedBox(width: 10),
                  Text("Chapter - 5",style: menuStyle),
                ],
              ),
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("C-Programming - 2020",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: () async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CProgram2020()));
                    }
                    /*Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CProgram2020()));*/
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Flowchart - 2020",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlowchartAndAlgorithm2020()));
                    }
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("C-Programming - 2019",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CProgram2019()));
                    }
                  },
                ),
                SizedBox(height: 10,),
              ],
            ),
            //SizedBox(height: 5,),
            ExpansionTile(
              title: Row(
                children: [
                  Image.asset('assets/images/chapter_four.png', width: 30, height: 30,),
                  SizedBox(width: 10),
                  Text("Chapter - 4",style: menuStyle),
                ],
              ),
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("HTML - 2020",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Html2020()));
                    }
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("HTML - 2019",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Html2019()));
                    }
                  },
                ),
                SizedBox(height: 10,),
              ],
            ),
            //SizedBox(height: 10,),
            ExpansionTile(
              title: Row(
                children: [
                  Image.asset('assets/images/chapter_three.png', width: 30, height: 30,),
                  SizedBox(width: 10),
                  Text("Chapter - 3",style: menuStyle),
                ],
              ),
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Logic Gate - 2020",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogicGate2020()));
                    }
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Number System - 2020",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NumberSystem2020()));
                    }
                  },
                ),
                SizedBox(height: 10,),
              ],
            ),
            //SizedBox(height: 10,),
            ExpansionTile(
              title: Row(
                children: [
                  Image.asset('assets/images/chapter_two.png', width: 30, height: 30,),
                  SizedBox(width: 10),
                  Text("Chapter - 2",style: menuStyle),
                ],
              ),
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Communication Systems",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataCommunication2020()));
                    }
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Networking",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Networking2020()));
                    }
                  },
                ),
                SizedBox(height: 10,),
              ],
            ),
            //SizedBox(height: 10,),
            ExpansionTile(
              title: Row(
                children: [
                  Image.asset('assets/images/chapter_one.png', width: 30, height: 30,),
                  SizedBox(width: 10),
                  Text("Chapter - 1",style: menuStyle),
                ],
              ),
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("ICT : World and Bangladesh\nPerspective",style: menuStyle2, textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ICTWorldAndBangladesh2020()));
                    }
                  },
                ),
                SizedBox(height: 10,),
              ],
            ),
            //SizedBox(height: 10,),
            ExpansionTile(
              title: Row(
                children: [
                  Image.asset('assets/images/board_questions.png', width: 30, height: 30,),
                  SizedBox(width: 10),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.purple,
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp
                          ),
                          color: Colors.green,
                          border: Border.all(color: Colors.lightBlueAccent, width: 2),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Board Question",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white, fontStyle: FontStyle.italic))
                  ),
                ],
              ),
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Chapter - 6",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DatabaseManagementBQ()));
                    }
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Chapter - 5",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProgramingBQ()));
                    }
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Chapter - 4",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebDesignBQ()));
                    }
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Chapter - 3",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NumAndLogicBQ()));
                    }
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/youtube.png', width: 25, height: 25,),
                        SizedBox(width: 10),
                        Text("Chapter - 2",style: menuStyle2),
                      ],
                    ),
                  ),
                  onTap: ()async{
                    var result = await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      connectionDialog();
                    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommunicationNetworkingBQ()));
                    }
                  },
                ),
                SizedBox(height: 10,),
              ],
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactUs()));
              },
              title: Row(
                children: [
                  Image.asset('assets/images/contact_us.png', width: 30, height: 30,),
                  SizedBox(width: 10),
                  Text("Contact With Me",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue.shade700)),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
