import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class alldata  extends StatefulWidget{
  @override
  _alldataState createState() => _alldataState();
}

class _alldataState  extends State<alldata>{
  CollectionReference certificate=Firestore.instance.collection('storage');
  int count;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Manage Data"),
        actions: [
          IconButton(icon:Icon(Icons.auto_delete_sharp),
            onPressed:() async {
             // final int documents = await Firestore.instance.collection('storage').snapshots().length;
              CollectionReference documentReference=Firestore.instance.collection("storage");
              QuerySnapshot snapshot=await documentReference.getDocuments();
              snapshot.documents[0].reference.delete();
              Fluttertoast.showToast(
                  msg: "deleted top record",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },
          ),
          IconButton(icon:Icon(Icons.ad_units),
            onPressed:(){
             // final int documents = await Firestore.instance.collection('storage').snapshots().length;

              Fluttertoast.showToast(
                  msg: "Number of documents={$count}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },
          ),
        ],
        flexibleSpace: Container(
          decoration:BoxDecoration(
            gradient: LinearGradient(
              colors:[Colors.blue,Colors.cyanAccent],
              begin: Alignment.bottomRight,
              end:Alignment.topLeft,


            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('storage').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
         count= snapshot.data.documents.length;
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
      elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(30),

            ),
            child:Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,vertical: 10
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue,Colors.cyanAccent],
                )
              ),
              child:  ListTile(
                title: new Text(doc["location"]),
                subtitle: new Text(doc["url"]),

                onLongPress:(){
                  doc.reference.delete();
                } ,

              ),
            )


          ),

        )
        .toList();
  }



}

