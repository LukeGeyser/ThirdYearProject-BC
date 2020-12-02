//import 'dart:js';
import 'dart:io';
// import 'package:file_picker/file_picker.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
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

int _selectedIndex;
List<dynamic> projects;

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
  Future<List<dynamic>> search(String search) async {
    var data = await service.searchProject(search);
    projects = data["patterns"];
    return projects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Ravelry'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<dynamic>(
            onSearch: search,
            onItemFound: (dynamic data, int index) {
              return ListTile(
                title: Text(data["name"]),
                subtitle: Text(data["free"] == "true"
                    ? "Free Item"
                    : "Item needs to be purchased"),
                onTap: () {
                  _selectedIndex = index;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => displayProjectDetails()));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class displayProjectDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Details to project'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text(projects[_selectedIndex]["name"]),
          RaisedButton(
            onPressed: () {},
            color: Colors.cyan,
            child: const Text('Add To Project'),
          ),
        ]),
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
          onPressed: () async {
            // FilePickerResult result =
            //     await FilePicker.platform.pickFiles(allowMultiple: true);
            //
            // if (result != null) {
            //   List<File> files =
            //       result.paths.map((path) => File(path)).toList();
            //   int d = 2;
            // } else {
            //   // User canceled the picker
            // }
          },
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
