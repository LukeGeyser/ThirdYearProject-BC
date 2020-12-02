import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knitwit_feature_module/APIService.dart';
import 'package:social_share/social_share.dart';
import 'package:social_share_plugin/social_share_plugin.dart';

APIService service = new APIService();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
                      onPressed: () {},
                      child: const Text('Share To Facebook',
                          style: TextStyle(fontSize: 20)),
                    )),
                    Expanded(
                        child: RaisedButton(
                      color: Colors.lightBlue,
                      onPressed: () {},
                      child: const Text('Search Ravelry',
                          style: TextStyle(fontSize: 20)),
                    )),
                    Expanded(
                        child: RaisedButton(
                      color: Colors.cyan,
                      onPressed: () async {
                        // var data = await service.searchProject("cowl");

                        // List<dynamic> projects = data["patterns"];

                        var fbResponse;

                        ImagePicker picker = new ImagePicker();
                        File file = await ImagePicker.pickImage(
                            source: ImageSource.camera);
                        // SocialShare.shareFacebookStory(file.path, "#ffffff",
                        //         "#000000", "https://deep-link-url")
                        //     .then((value) => fbResponse = value);

                        // await SocialSharePlugin.shareToFeedFacebook(
                        //     path: file.path);

                        // for (int i; i < data["patterns"])
                        int d = 2;
                      },
                      child: const Text('Add To Project',
                          style: TextStyle(fontSize: 20)),
                    )),
                    Expanded(
                        child: RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: () {},
                      child: const Text('Upload Photo',
                          style: TextStyle(fontSize: 20)),
                    )),
                  ]),
            )));
  }
}
