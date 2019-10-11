import 'package:flutter/material.dart';
import 'state_test1.dart';

class StateTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(
      title: 'StateTest',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('State交互测试'),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/1.jpg',
              width: 640,
              height: 240,
              fit: BoxFit.scaleDown,
            ),
            new FavoriteFullWidget(),
          ],
        ),
      ),
    );
  }
}
