import 'package:flutter/material.dart';


class StateTouchTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return new MaterialApp(

    );
  }
}

class FavoriteFullWidget extends StatefulWidget {
  @override
//  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteFullWidget> {

  bool _hasFavorited = true;
  int _favoriteCont = 41;

  void _toggleFavorite() {
    setState(() {
      if (_hasFavorited) {
        _favoriteCont -= 1;
        _hasFavorited = false;
      } else {
        _favoriteCont += 1;
        _hasFavorited = true;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          margin: new EdgeInsets.all(0.0),
          color: Colors.grey,
          child: new IconButton(
              icon: new Icon(_hasFavorited ? Icons.favorite : Icons.favorite_border),
              onPressed: _toggleFavorite,
            color: Colors.red[500],

          ),

        ),
        new SizedBox(
          width: 18.0,
          height: 18.0,
          child: new Container(
            child: new Text('$_favoriteCont'),
            color: Colors.cyan,
          ),
        )
      ],

    );
  }
}