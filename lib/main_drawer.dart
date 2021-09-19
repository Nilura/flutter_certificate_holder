import 'package:firebasestore/screen/add.dart';
import 'package:firebasestore/screen/feedbacks.dart';
import 'package:firebasestore/screen/show.dart';
import 'package:firebasestore/screen/slider.dart';
import 'package:flutter/material.dart';

import 'screen/barchart.dart';
import 'screen/charts.dart';
import 'screen/piechart.dart';

class MainDrawer extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/logo.jpg'),
                fit: BoxFit.cover,
              ),


            ),
            color: Theme.of(context).accentColor,
            child: Center(
              child:Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top:30,
                      bottom:10,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(

                            image: AssetImage('assets/logo.jpg'),
                            fit:BoxFit.fill
                        )

                    ),


                  ),
                  Text('Ashen Nilura' ,style:TextStyle(fontSize: 22,color:Colors.white),
                  ),
              Text('ashennilura@gmail.com' ,style:TextStyle(color:Colors.white),)
                ],
              ),

            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title:Text('Search', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>CloudFirestoreSearch()));
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title:Text('Add Image', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ADD()));
            } ,
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings_rounded ),
            title:Text('Manage Data', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>alldata()));
            } ,
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title:Text('Chart', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>TaskHomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_bubble_outlined),
            title:Text('Feedback', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ReachUs()));
            },
          ),
          ListTile(
            leading: Icon(Icons.burst_mode),
            title:Text('Slider', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>FirestoreSlideshow()));
            },
          ),

        ],
      ),
    );
  }
}