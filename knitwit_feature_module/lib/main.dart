//import 'dart:js';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knitwit_feature_module/APIService.dart';
import 'package:social_share/social_share.dart';
import 'package:social_share_plugin/social_share_plugin.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

APIService service = new APIService();

void main() async {
  runApp(MyApp());
}


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
                            builder: (context) => Home()));
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
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Column(
        children: <Widget>[
          (imageUrl != null)
              ? Image.network(imageUrl)
              : Placeholder(fallbackHeight: 200.0,fallbackWidth: double.infinity),
          SizedBox(height: 20.0,),
          RaisedButton(
            child: Text('Upload Image'),
            color: Colors.lightBlue,
            onPressed: () => uploadImage(),
          )
        ],
      ),
    );
  }

  uploadImage() async {

    final FirebaseStorage _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;


    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _storage.ref()
            .child('folderName/imageName')
            .putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }

    } else {
      print('Grant Permissions and try again');
    }




  }

}