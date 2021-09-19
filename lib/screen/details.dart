import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {


  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detais'),
        flexibleSpace: Container(
          decoration:BoxDecoration(
            gradient: LinearGradient(
              colors:[Colors.blue,Colors.cyanAccent],
              begin: Alignment.bottomRight,
              end:Alignment.topLeft,


            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('storage').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            //   DocumentSnapshot ds=snapshot.data.documents[index];
            return Text("no value");
          }

          return  new ListView(children: getExpenseItems(snapshot));
        },
      ),
      
    );
  }

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {

    return snapshot.data.documents
        .map((doc) => new Card(
      child:  ListTile(
        title: new Text(doc["location"]),
        subtitle: new Text(doc["url"]),



      ),

    ),

    )
        .toList();
  }
}
