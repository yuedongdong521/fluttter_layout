import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);
  /** Widget自己管理自己的State */
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TapboxAState();
  }
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Text(
          _active ? 'Active' : 'Inactive',
          style: new TextStyle(
            fontSize: 32.0,
            color: Colors.white
          ),
        ),
        width: 200.0,
        height: 200.0,
        alignment: new Alignment(0, 0),
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class StateManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Widget state 管理'),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new TapboxA(),
            new ParentWidget(),
            new FatherWidget()

          ],
        ),
      ),
    );
  }
}


class ParentWidget extends StatefulWidget {
  @override 
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ParentWidget();
  }
}

class _ParentWidget extends State<ParentWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: TapboxB(onChanged: _handleTapboxChanged, active: _active,),
    );
  }
}


class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active : false, @required this.onChanged}) : super(key:key);
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap() {
    onChanged(!active);
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(

        child: new Center(
          child: new Text(active ? 'Active' : 'Inactive', style: new TextStyle(fontSize: 32.0, color: Colors.white),),
        ),
        width: 200,
        height: 200,
        color: active ? Colors.lightGreen[700] : Colors.grey[600],
      )
    );
  }
}


class FatherWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FatherWidget();
  }
}

class _FatherWidget extends State<FatherWidget> {
  bool _active = false;
  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Container(
      child: new TapboxC(onChnaged: _handleTapBoxChanged, active: _active,),
    );
  }
}


class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active : false, @required this.onChnaged}) : super(key: key);
  final bool active;
  final ValueChanged<bool> onChnaged;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TapboxCState();
  }
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChnaged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive', style: new TextStyle(
            fontSize: 32.0, color:  Colors.white
          ),),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? new Border.all(color: Colors.teal[700], width: 10) : null
        ),
      ),
    );
  }
}