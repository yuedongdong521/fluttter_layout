import 'package:flutter/material.dart';

class SpaceEvenlyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "SpaceEvenly",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("SpaceEvenlyTest"),
        ),
        body: new Column(
          children: <Widget>[
            new Expanded(child: _rowWidget()),
            new Expanded(child: _columnWidget()),
            new Expanded(child: _iconRow()),
          ],
        ),
      ),
    );
  }
/*
在Row中MainAxisAlignment的效果
前面我们说到了，在水平方向的控件中，MainAxisAlignment就是水平的，其默认的方向是从左到右，
也就是说默认的起始位置在左边，我们可以通过textDirection来改变水平方向的起始位置。
在垂直方向的控件中，MainAxisAlignment就是垂直的，此时可以通过verticalDirection来改变MainAxisAlignment的起始位置及排列方向



  enum MainAxisAlignment {
  //将子控件放在主轴的开始位置
  start,
  //将子控件放在主轴的结束位置
  end,
  //将子控件放在主轴的中间位置
  center,
  //将主轴空白位置进行均分，排列子元素，手尾没有空隙
  spaceBetween,
  //将主轴空白区域均分，使中间各个子控件间距相等，首尾子控件间距为中间子控件间距的一半
  spaceAround,
  //将主轴空白区域均分，使各个子控件间距相等
  spaceEvenly,
}



CrossAxisAlignment

前面我们已经说了，在Row（水平排列）控件中，CrossAxisAlignment的方向就是垂直的，在 Column（垂直排列）控件中，CrossAxisAlignment的方向就是水平的。
enum CrossAxisAlignment {
 //将子控件放在交叉轴的起始位置
  start,

 //将子控件放在交叉轴的结束位置
  end,

 //将子控件放在交叉轴的中间位置
  center,

//使子控件填满交叉轴
  stretch,

//将子控件放在交叉轴的上，并且与基线相匹配（不常用）
  baseline,
}


总结:

MainAxisAlignment和CrossAxisAlignment他们的值并不多，理解起来也比较简单，配合textDirection和verticalDirection基本上可以满足我们的需求了。

关于textDirection和verticalDirection我们不必死记硬背Row中是谁控制谁，在Column中是谁控制谁

我们只需要记住
textDirection就是用来控制水平方向的起始位置和排列方向
verticalDirection就是用来控制垂直方向的起始位置和排列方向

然后记住
MainAxisAlignment（主轴）就是与当前控件方向一致的轴
CrossAxisAlignment（交叉轴）就是与当前控件方向垂直的轴

记住了这两点，基本上MainAxisAlignment和CrossAxisAlignment就没什么问题了

---------------------
来源：CSDN
原文：https://blog.csdn.net/yuzhiqiang_1993/article/details/86496145
*/

  Row _rowWidget() {
   return new Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly, // 主轴(Row 水平方向, Column竖直方向)对齐
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Expanded Widget 控制沿主轴方向的大小 (Row width大小, Column height大小) 使Widget不超出边界, flex 控制大小占比
        new Expanded(
          child: new Image.asset('images/1.jpg', width: 200, height: 500, fit: BoxFit.cover,
          ),
        ),
        new Expanded(
          child: new Image.asset('images/3.jpg', width: 300, height: 200, fit: BoxFit.fill,), flex: 2,
        ),
        new Expanded(
          child: new Image.asset('images/4.jpg', width: 400, height: 300, fit: BoxFit.scaleDown,), flex: 3,
        ),
      ],
    );
  }

   Column _columnWidget() {
     return new Column(
       mainAxisAlignment:
       MainAxisAlignment.spaceEvenly, // 主轴(Row 水平方向, Column竖直方向)对齐
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         // Expanded Widget 控制沿主轴方向的大小 (Row width大小, Column height大小) 使Widget不超出边界, flex 控制大小占比
         new Expanded(
           child: new Image.asset(
             'images/1.jpg', width: 200, height: 500, fit: BoxFit.cover,
           ),
         ),
         new Expanded(
           child: new Image.asset(
             'images/3.jpg', width: 300, height: 200, fit: BoxFit.fill,),
           flex: 2,
         ),
         new Expanded(
           child: new Image.asset(
             'images/4.jpg', width: 400, height: 300, fit: BoxFit.scaleDown,),
           flex: 3,
         ),
       ],
     );
   }

   Row _iconRow() {
    return new Row(
      mainAxisSize: MainAxisSize.min, // 设置主轴方向Widget聚集
      children: <Widget>[
        new Icon(Icons.star, color: Colors.red,),
        new Icon(Icons.star, color: Colors.blue,),
        new Icon(Icons.star, color: Colors.green,),
      ],
    );
   }
}

