import 'package:flutter/material.dart';
import 'package:knitwit_feature_module/APIService.dart';

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
        body:
        Container(
          child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
        Expanded(
          child: RaisedButton(
            color: Colors.white38,
              onPressed: () {},
          child: const Text('Share To Facebook', style: TextStyle(fontSize: 20)),
        )
      ),
                Expanded(
                    child: RaisedButton(
                      color: Colors.lightBlue,
                      onPressed: () {},

                      child: const Text('Search Ravelry', style: TextStyle(fontSize: 20)),
                    )
                ),
                Expanded(
                    child: RaisedButton(
                      color: Colors.cyan,
                      onPressed: () {},
                      child: const Text('Add To Project', style: TextStyle(fontSize: 20)),
                    )
                ),
                Expanded(
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: () {},
                      child: const Text('Upload Photo', style: TextStyle(fontSize: 20)),
                    )
                ),
      ]
    ),

    )
        )
    );
  }
}

