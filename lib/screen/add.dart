
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../main.dart';
import 'login_screen.dart';

class ADD extends StatefulWidget {
  const ADD() : super();

  @override
  _ADDState createState() => _ADDState();
}

class _ADDState extends State<ADD> {
  TextEditingController title=TextEditingController();
  TextEditingController count=TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  String getval;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add your certificate"),
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
      body: Padding(
        padding:EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
                child:Text("Posting your certificate"),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller:count,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  hintText: 'Enter Your description',
                ),
              ),
            ),
            Container(
              width: 400.0,
              padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('Post'),
                onPressed: (){
                  getImage();
                },
              ),
            ),
               Container(
                 width: 400.0,
                 padding: const EdgeInsets.only(top: 16.0),
                 child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('SignOut'),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Login()));
                    Fluttertoast.showToast(
                        msg: "Sucessfully Logout!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  // _signOut();
                  },
              ),
               ),

          ],

        ),
      ),
    );


  }



  Future<void> _signOut() async {

    await _auth.signOut();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Login()));
  }
  Future getImage() async {
    // Get image from gallery.
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _uploadImageToFirebase(image);
  }

  Future<void> _uploadImageToFirebase(File image) async {
    try {
      // Make random image name.
      getval=count.text;
 //    int randomNumber = Random().nextInt(100000);
   //   String imageLocation = 'images/image${randomNumber}.jpg';

      // Upload image to firebase.
      final StorageReference storageReference = FirebaseStorage().ref().child(getval);
      final StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;
      _addPathToDatabase(getval);
      Fluttertoast.showToast(
          msg:"sucessfully Complete",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }catch(e){
      print(e.message);
    }
  }


}

Future<void> _addPathToDatabase(String text) async {
  try {
    // Get image URL from firebase
    final ref = FirebaseStorage().ref().child(text);
    var imageString = await ref.getDownloadURL();

    // Add location and url to database
    await Firestore.instance.collection('storage').document().setData({'url':imageString , 'location':text});
  }catch(e){
    print(e.message);

  }
}
