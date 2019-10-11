import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'test6',
      home: new TestCardHome(),
    );
  }
}

class TestCardHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TestCardState();
  }
}

class _TestCardState extends State<TestCardHome> {
  @override
  Widget build(BuildContext context) {

    ListTile _createListTile(String tile, String subTile, IconData iconData) {
      return ListTile(
        title: new Text(
          tile,
          style: new TextStyle(
            fontWeight: FontWeight.w500
          ),
        ),
        subtitle: new Text(subTile),
        leading: new Icon(
          iconData,
          color: Colors.blue[500],
        ),
      );
    }
    
    var card = new SizedBox(
      height: 250.0,
      child: new Card(
        child: new Column(
          children: <Widget>[
            _createListTile('瑞和雅苑', '闵行区', Icons.restaurant_menu),
            new Divider(),
            _createListTile('手机', '17749757268', Icons.contact_phone),
            _createListTile('邮箱', '1067221279@qq.com',  Icons.contact_mail)
          ],
        ),

      ),
    );


    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Card'),
      ),
      body: new Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          card,
        ],
      ),
    );
  }
}