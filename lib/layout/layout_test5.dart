import 'package:flutter/material.dart';


class ContainerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Container',
      home: new ContainerBulider(),
    );
  }
}


class ContainerBulider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContainerTestStatus();
  }
}

class ContainerTestStatus extends State<ContainerBulider> {

  Container _createImageItem(Image image, double size, EdgeInsets marginInset) {
    return new Container(
      padding: new EdgeInsets.all(0),
      margin: marginInset,
      width: size,
      height: size,
      decoration: new BoxDecoration(
        border: new Border.all(width: 10, color: Colors.black38),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),
      child: image,
    );
  }


  Container _createContent() {

    return new Container(
      padding: new EdgeInsets.all(0),
      margin: new EdgeInsets.fromLTRB(20, 10, 20, 0),
      // width = padding.t + padding.b + margin.l + margin.r + content.width
      height: 230,
      width: 230,
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              _createImageItem(new Image.asset('images/1.jpg', fit: BoxFit.fill,), 100, new EdgeInsets.fromLTRB(10, 10, 5, 5)),
              _createImageItem(new Image.asset('images/3.jpg', fit: BoxFit.fill,), 100, new EdgeInsets.fromLTRB(5, 10, 10, 5)),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              _createImageItem(new Image.asset('images/4.jpg', fit: BoxFit.fill,), 100, new EdgeInsets.fromLTRB(10, 5, 5, 10)),
              _createImageItem(new Image.asset('images/1.jpg', fit: BoxFit.fill,), 100, new EdgeInsets.fromLTRB(5, 5, 10, 10)),
            ],
          ),
        ],
      ),
    );
  }
  var listImage = ['1', '3', '4'];
  List<Container> _buildGridTileList(int count) {
    return new List<Container>.generate(
        count,
            (int index) => new Container(
              child: new Image.asset('images/' + listImage[index % listImage.length] + '.jpg', fit: BoxFit.cover,),
            )
    );
  }

  Widget buildGrid() {
    return new GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(30),

    );
  }

  Widget _createGrid() {
    return new Container(
      padding: new EdgeInsets.all(0),
      margin: new EdgeInsets.fromLTRB(20, 0, 20, 0),
//      width: 300,
      height: 200,
      child: buildGrid(),
    );
  }

  
  List<Widget> list = <Widget>[
    new ListTile(
      title: new Text('CineArts at the Empire'),
      subtitle: new Text('85 W Portal Ave'),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue[500],
      ),
      
    ),
    new ListTile(
      title: new Text('List title 2'),
      subtitle: new Text('sub title 2'),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue,
      ),
    )
  ];

  Widget _addListTitle(){
    return Container(
      padding: new EdgeInsets.all(10),
      margin: new EdgeInsets.all(10),
      height: 100,
      color: Colors.grey,
      child: new ListView(
        children: list,
      ),
    );
  }
  
  var _stack = new Stack(
    alignment: const Alignment(0, 0), // alignment设置偏移量 (使重叠Widget居中显示)
    children: <Widget>[
      new CircleAvatar(
        backgroundImage: new AssetImage('images/1.jpg'),
        radius: 50,
      ),
      new Container(
        decoration: new BoxDecoration(
          color: Colors.black45,
        ),
        child: new Text(
          'stack',
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
        ),
      )
    ],
  );

  Widget _addStack() {
    return Container(
      height: 120,
      width: 120,
      color: Colors.blueGrey,
      child: _stack,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

      return Scaffold(
        appBar: new AppBar(
          title: new Text('Container'),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Text('Container'),
            _createContent(),
            new Text('GridView'),
            _createGrid(),
            new Text('ListView'),
            _addListTitle(),
            new Text('stack'),
            _addStack()
          ],
        ),
      );
    }

}