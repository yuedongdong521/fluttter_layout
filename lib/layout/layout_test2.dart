import 'package:flutter/material.dart';

class costomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.fromLTRB(10, 88, 10, 44),

      decoration: new BoxDecoration(
        color: Colors.green,
      ),
      child: new Row(
        children: <Widget>[
          new Text('Hello world', style: new TextStyle(fontSize: 40, color: Colors.red),),
          new Image.asset('images/3.jpg', fit: BoxFit.cover, width: 100, height: 200,),
          new Icon(Icons.star, color: Colors.red[500],),
        ],
      ),

    );
  }
}