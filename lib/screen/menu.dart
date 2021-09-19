
import 'package:firebasestore/screen/show.dart';
import 'package:firebasestore/screen/slider.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'add.dart';
import 'details.dart';


class MenuScreen extends StatefulWidget {
  MenuScreen();
  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  MenuScreenState();
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Scaffold(
              backgroundColor: Colors.lightBlueAccent,
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.home),),
                    Tab(icon: Icon(Icons.insert_drive_file),),
                    Tab(icon: Icon(Icons.account_circle),),
                  ],
                  labelColor: Color(0xff8c52ff),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Color(0xff8c52ff), width: 4.0),
                    insets: EdgeInsets.only(bottom: 44),
                  ),
                  unselectedLabelColor: Colors.cyanAccent,



                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  MyHomePage(),
                  alldata(),
                  FirestoreSlideshow(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}