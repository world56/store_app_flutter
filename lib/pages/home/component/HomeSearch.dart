import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Row(
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
            onPressed: () {},
          ),
          flex: 2,
        ),
      ],
    ));
  }
}
