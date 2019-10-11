import 'package:flutter/material.dart';
import 'layout/layout_test1.dart';
import 'layout/layout_test2.dart';
import 'layout/layout_test3.dart';
import 'layout/MyHomePage.dart';
import 'layout/layout_test5.dart';
import 'layout/layout_test6_card.dart';
import 'state_交互/state_test.dart';
import 'state_交互/state_test2_manager1.dart';
import 'state_交互/cashMoneyWidget.dart';
void main() => runApp(new LayoutApp());

class LayoutApp extends StatelessWidget {
  final _listItems = ['test1', 'text2', 'SpaceEvenlyTest', 'HomePage', 'Container', 'card', 'state_交互', 'state manager self', 'cash Test Demo'];
  void _pushWidget(BuildContext context, Widget widget) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }

  ListView _builderListView(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i) {
      final index = i ~/ 2;
      if (index > _listItems.length - 1) {
        return null;
      }
      if (i % 2 == 1) {
        return Divider();
      }

      return new ListTile(
        title: new Text(
          _listItems[index],
          style: new TextStyle(
            color: Colors.cyan,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
        ),
        onTap: () {
          if (index == 0) {
            _pushWidget(context, new layout_test1());
          } else if (index == 1) {
            _pushWidget(context, new costomApp());
          } else if (index == 2) {
            _pushWidget(context, new SpaceEvenlyTest());
          } else if (index == 3) {
            _pushWidget(context, new MyHomePage());
          } else if (index == 4) {
            _pushWidget(context, new ContainerTest());
          } else if (index == 5) {
            _pushWidget(context, new TestCard());
          } else if (index == 6) {
            _pushWidget(context, new StateTest());
          } else if (index == 7) {
            _pushWidget(context, new StateManager());
          } else if (index == 8) {
            _pushWidget(context, new CashWidget());
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // 创建material应用程序
      title: 'flutter layout test list',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('list'),
        ),
        body: _builderListView(context),
      ),
    );

    /*
    return new MaterialApp(  // 创建material应用程序
      title: 'flutter layout',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/1.jpg',
              width: 600.0,
              height: 240,
              fit: BoxFit.cover,
            ),
            _titleSection(),
            _buttonSection(context),
            _titleSection(),
          ],
        ),
      ),
    );
    */

    /*
    return new Container( // 不适用Material,自定义应用
      decoration: new BoxDecoration(
        color: Colors.blue,
      ),
      child: new Center(
        child: new Text(
          'Hello World',
          textDirection: TextDirection.ltr,
          style: new TextStyle(
              fontSize: 40.0, color: Colors.black87),
        ),

      ),
    );
    */
  }
}
