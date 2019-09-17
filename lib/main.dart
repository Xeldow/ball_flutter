import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<Widget> _list = new List();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new Center(
          child: new ListView(
            //控制方向 默认是垂直的
//           scrollDirection: Axis.horizontal,
            children: _initList(),
          ),
        ),
      ),
    );
  }

  List<Widget> _initList() {
    _list.add(_getItem("0.001"));
    _list.add(_getItem("0.01"));
    _list.add(_getItem("30"));
    _list.add(_getItem("60"));
    return _list;
  }

  static const jumpPlugin = const MethodChannel('samples.flutter.io/clock');

  Widget _getItem(String test) {
    return new Card(
//      ListTile
      child: new ListTile(
//       显示在title之前
        leading: new Icon(Icons.alarm),
//        显示在title之后
        title: new Text(test),
        onTap: () {
          _jumpToNativeWithValue(test);
        },
      ),
    );
  }

  Future<void> _jumpToNativeWithValue(String setTime) async {
    String result = await jumpPlugin.invokeMethod('set', "delay:" + setTime);
  }
}
