import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'HomePage',
      home: new MyHomePageBuilder(),
    );
  }
}

class MyHomePageBuilder extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePageBuilder> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 20.0,
    );

    var starRow = new Row(
      children: <Widget>[
        new Icon(Icons.star, color: Colors.black,),
        new Icon(Icons.star, color: Colors.black,),
        new Icon(Icons.star, color: Colors.black,),
        new Icon(Icons.star, color: Colors.black,),
        new Icon(Icons.star, color: Colors.black,),
      ],
    );

    Column _bottomColumn(IconData iconData, String iconTitle, String time) {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(iconData, color: Colors.green[500],),
          new Text(iconTitle),
          new Text(time),
        ],
      );
    }

    // DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其
    // 所有的子节点继承
    var iconList = DefaultTextStyle.merge(
        style: new TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',

        ),
        child: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Icon(Icons.kitchen, color: Colors.green[500],),
                  new Text('PREP:'),
                  new Text('25 min'),
                ],
              ),
              _bottomColumn(Icons.timer, 'COOK', '1 hr'),
              _bottomColumn(Icons.restaurant, 'FEEDS', '4-6'),
            ],
          ),
        )
    );


    var ratings = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
//        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          starRow,
          new Text(
            '170 Reviews',
            style: descTextStyle,
          ),

        ],
      ),
    );


    var leftColumn = new Container(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      color: Colors.yellow,
      child: new Column(
        children: <Widget>[
          new Text('Strawberry Pavlova', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),),
          new Text('提示: 为了最大限度地减少由嵌套严重的布局代码导致的视觉混淆，可以在变量和函数中实现UI的各个部分。'),
          ratings,
          iconList,
        ],
      ),
    );




    return new Scaffold(
      appBar: AppBar(
        title: new Text('Home'),
      ),
      body: new Container(
        child: new Container(
          margin: new EdgeInsets.fromLTRB(20, 20, 20, 37),
          padding: new EdgeInsets.all(0),
          height: 600,
          width: 350,
          color: Colors.blueGrey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(child:  new Container(
                width: 350,
                height: 300,
                color: Colors.cyan,
                child: new Image.asset('images/1.jpg', fit: BoxFit.cover,),
              ),),
              new Expanded(child:  leftColumn,),

            ],
          ),
        ),
      ),
    );
  }
}