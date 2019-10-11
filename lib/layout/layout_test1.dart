import 'package:flutter/material.dart';

class layout_test1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Layout',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new Scaffold(
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/1.jpg',
              width: 640,
              height: 240,
              fit: BoxFit.cover,
            ),
            _titleSection(),
            _buttonSection(context),
            _textSection(),
          ],
        ),
      ),
    );
  }

  Widget _titleSection() {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );

    return titleSection;
  }

  Column _buildButtonColumn(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(  // 列布局
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          icon,
          color: color,
        ),
        new Container(
          margin: const EdgeInsets.only(top: 18.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w100,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonSection(BuildContext context) {
    Widget buttonSection = new Container( // 自定义button widget
      child: new Row(  // 行布局
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(context, Icons.call, 'CALL'),
          _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );
    return buttonSection;
  }

  Widget _textSection() {
    Widget textSection = new Container(
      padding: const EdgeInsets.all(50.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    return textSection;
  }

}