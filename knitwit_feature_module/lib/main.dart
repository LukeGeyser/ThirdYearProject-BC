//import 'dart:js';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knitwit_feature_module/APIService.dart';
import 'package:social_share/social_share.dart';
import 'package:social_share_plugin/social_share_plugin.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

APIService service = new APIService();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new MyHomePage(),
      //routes: ,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("KnitWit Module Test"),
            ),
            body: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      color: Colors.white38,
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => fbShare()));
                      },
                      child: const Text('Share To Facebook',
                          style: TextStyle(fontSize: 20)),
                    )),
                    Expanded(
                        child: RaisedButton(
                      color: Colors.lightBlue,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => searchRav()));
                      },
                      child: const Text('Search Ravelry',
                          style: TextStyle(fontSize: 20)),
                    )),
                    Expanded(
                        child: RaisedButton(
                      color: Colors.cyan,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => addPhotoToProject()));
                      },
                      child: const Text('Add To Project',
                          style: TextStyle(fontSize: 20)),
                    )),
                    Expanded(
                        child: RaisedButton(
                      color: Colors.blueAccent,
                      //
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => uploadPhoto()));
                      },
                      child: const Text('Upload Photo',
                          style: TextStyle(fontSize: 20)),
                    )),
                  ]),
            )));
  }
}

class fbShare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FB share'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class searchRav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Ravelry'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class addPhotoToProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Photo to project'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class uploadPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Photo'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
        ),
      ),
    );
  }
}
