import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../api/home.dart' show getHomeInfo;
import 'package:dio/dio.dart';
// import '../../utils/http.dart';

class Home extends StatefulWidget {
  Home();
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    print('准备请求0-');
    super.initState();
    print('准备请求0+');
  }

  Future initialization() async {
    print('准备请求1');
    try {
      Response res = await getHomeInfo();
      print(res);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Icon(
                    Icons.place,
                    size: 30,
                    color: Colors.white,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 35,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: '你好',
                        hintStyle: TextStyle(
                          color: Colors.white60,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  flex: 7,
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text('搜索'),
                    color: Colors.white,
                    textColor: Colors.red,
                    onPressed: () {
                      this.initialization();
                    },
                  ),
                  flex: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
