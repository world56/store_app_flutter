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
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white60,
                ),
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Colors.yellow,
                  ),
                ),
                hintText: '请输入相关商品',
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
              ),
            ),
          ),
          flex: 7,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: RaisedButton(
              shape: StadiumBorder(),
              child: Text(
                '搜索',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              color: Colors.white,
              textColor: Colors.red,
              onPressed: () {},
            ),
          ),
          flex: 2,
        ),
      ],
    ));
  }
}
