import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/doubleball.dart';


class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DoubleListProvide>(builder: (context, child, val) {
      return Stack(
        children: <Widget>[
          ListView.builder(
              itemCount: val.doubleball.length,
              itemBuilder: (context, index) {
                if (val.doubleball.length > 0) {
                  return _box(val.doubleball, index);
                } else {
                  return Text(
                    '暂时未有订单数据',
                    textAlign: TextAlign.center,
                  );
                }
              }),
          Positioned(
            bottom: 50,
            left: 100,
            child: getMaterialButton(context),
          )
        ],
      );
    });
  }

  Widget _box(doubleball, index) {
    String red = doubleball[index].red;
    List doubleList = red.split(',');
    return Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: alignList(doubleList, doubleball[index].blue)));
  }

  //制作红蓝球列表
  List<Widget> alignList(doubleList, doubleBlue) {
    List<Widget> checkList = [];
    for (var i = 0; i < doubleList.length; i++) {
      checkList.add(Container(
        padding: EdgeInsets.all(2),
        child: Align(
          child: CircleAvatar(
            child: Text(doubleList[i], style: TextStyle(fontSize: 30)),
            backgroundColor: Colors.redAccent,
            radius: 25.0,
          ),
        ),
      ));
    }
    checkList.add(Container(
        padding: EdgeInsets.all(2),
        child: Align(
          child: CircleAvatar(
            child: Text(doubleBlue.toString(), style: TextStyle(fontSize: 30)),
            backgroundColor: Colors.blueAccent,
            radius: 25.0,
          ),
        )));
    return checkList;
  }

  Widget getMaterialButton(BuildContext context) {
    return MaterialButton(
      key: ValueKey("text"),
      child: Text(
        '点击获取数字',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
      onPressed: () {
        _getDouleBall(context);
      },
      textTheme: ButtonTextTheme.normal,
      textColor: Colors.blue,
      disabledTextColor: Colors.red,
      color: Colors.blueAccent,
      disabledColor: Colors.grey,
      highlightColor: Colors.grey,
      // 按下的背景色
      splashColor: Colors.green,
      // 水波纹颜色
      colorBrightness: Brightness.light,
      // 主题
      elevation: 10,
      highlightElevation: 10,
      disabledElevation: 10,
      padding: EdgeInsets.all(10),
//       MaterialButton shape 子类才起效
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
              color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 2)),
      clipBehavior: Clip.antiAlias,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      animationDuration: Duration(seconds: 1),
      minWidth: 200,
      height: 50,
    );
  }

  

  Future<String> _getDouleBall(BuildContext context) async {
    await Provide.value<DoubleListProvide>(context).getDouleBallList();
    return 'end';
  }
}
