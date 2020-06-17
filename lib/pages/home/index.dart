import 'package:flutter/material.dart';
import './home.dart';
import './my.dart';
import './shopping.dart';
import './type.dart';

class Index extends StatefulWidget {
  Index();
  _Index createState() => _Index();
}

class _Index extends State<Index> {
  final List<Widget> homeView = [Home(), Type(), Shopping(), My()];

  final List<BottomNavigationBarItem> menuList = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('主页')),
    BottomNavigationBarItem(icon: Icon(Icons.merge_type), title: Text('分类')),
    BottomNavigationBarItem(icon: Icon(Icons.shop), title: Text('购物车')),
    BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('我的')),
  ];

  int navState = 0;

  void monitorTab(int i) {
    setState(() {
      this.navState = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '弗拉特大商场',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 22,
        items: menuList,
        onTap: monitorTab,
        fixedColor: Colors.red,
        currentIndex: navState,
        type: BottomNavigationBarType.fixed,
      ),
      body: homeView[navState],
    );
  }
}
