import 'package:flutter/material.dart';
import 'package:flutter_layout/appContextInfo.dart';
import 'costomTextField.dart';

TextStyle _createFont(double size, Color fontColor) {
  return new TextStyle(
      fontSize: size, fontFamily: 'SF Pro Text', color: fontColor);
}

class CashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    void _leftAction() {
      Navigator.of(context).pop();
    }

    void _rightAction() {

    }
    
    void _gestureAction() {
      
    }
    
    GestureDetector _addGesture(String title) {
      return new GestureDetector(
        child: Text(title),
        onTap: _gestureAction,
      );
    }
    
    // TODO: implement build
    return new MaterialApp(
      title: '提现',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            '申请提现',
            style: _createFont(18, Colors.black),
          ),
          leading: new GestureDetector(onTap: _leftAction, child: Text('leading'),),
          flexibleSpace: _addGesture('flexibleSpace'),
          toolbarOpacity:1,
//          bottomOpacity:0.1,
        backgroundColor: Colors.green,
          actions: <Widget>[
            new Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                new GestureDetector(
                  onTap: _leftAction,
                  child: new Text("返回")
                ),
                new GestureDetector(
                  onTap: _rightAction,
                  child: new Text("完成", style: new TextStyle(
                    color: Colors.cyanAccent
                  ),),
                )
              ],
            )
          ],
        ),
        body: new _CashViewWidget(),
      ),
    );
  }
}

class _CashViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Row _addCardRow() {
      return new Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            child: new Text(
              '到账银行卡',
              style: _createFont(16, Colors.black),
            ),
            width: 100,
            height: 80,
            alignment: Alignment(0, 0),
            padding: new EdgeInsets.all(10),
//                color: Colors.red,
          ),
          new Container(
            width: ScreenWidth() - 40 - 100 - 50,
            alignment: Alignment(0, 0),
            child: costomTextField(
              placeholder: '请输入你的银行账号',
              inputAction: TextInputAction.route,
              inputKeyBoardType: TextInputType.number,
            ),
            /*
            child: new TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.route,
              controller: TextEditingController(),

              decoration: InputDecoration(
                labelText: '请输入你的银行账号',
//                helperText: '银联账号', // 下划线边框下面的提示语
                labelStyle: new TextStyle(fontSize: 14, color: Colors.grey,),
                contentPadding: new EdgeInsets.fromLTRB(0, 0, 0, 10), // hasFloatingPlaceholder 为false时文本会偏下展示,所以这里向上偏10
                hasFloatingPlaceholder: false, // 提示语是否上浮,false时点击隐藏
                alignLabelWithHint: false,
                  filled: false, // 是否有填充色
                // 隐藏边框
//                  border: InputBorder.none,
//                  enabledBorder: InputBorder.none,
//                  focusedBorder: InputBorder.none,

                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                  borderSide: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
                ),
                disabledBorder: UnderlineInputBorder( // 禁用时边框
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                  borderSide: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
                ),
                enabledBorder: UnderlineInputBorder( // 启用时边框
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                  borderSide: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
                ),
                focusedBorder: UnderlineInputBorder( // 编辑时边框
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                  borderSide: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
                ),
              ),
              autocorrect: false,
            ),
            */
//                color: Colors.green,
          ),
          new Container(
            width: 50,
            height: 80,
            child: new _CardBtnWidget(),
//                color: Colors.blue,
          )
        ],
      );
    }

    return Container(
      padding: new EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 350.0,
      width: ScreenWidth(),
      child: Column(
//        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          _addCardRow(),
        ],
      ),
    );
  }
}

class _CardBtnWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardBtnState();
  }
}

class _CardBtnState extends State<_CardBtnWidget> {
  bool _hasCard = false;

  void _cardBtnClick() {
    setState(() {
      _hasCard = !_hasCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _cardBtnClick,
      child: new Center(
        child: new Text(
          _hasCard ? '更换' : '绑卡',
          style: _createFont(14, Colors.black),
        ),
      ),
    );
  }
}
