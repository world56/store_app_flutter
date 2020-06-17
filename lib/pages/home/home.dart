import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../api/home.dart';
import 'package:dio/dio.dart';
import '../../component/Swiper/index.dart';
import './component/HomeSearch.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  Home();
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  List<dynamic> swiperList = [];

  @override
  void initState() {
    print('准备请求0-');
    super.initState();
    print('准备请求0+');
    this.initialization();
  }

  initialization() {
    this.intSwiper();
    this.getHomeInitData();
  }

  // 获取首页数据
  Future getHomeInitData() async {
    try {
      Response res = await getHomeInfo({'data': '测试一下'});
      print('首页数据-win-$res');
    } catch (e) {
      print('首页数据-error-$e');
    }
  }

  // get new swiper
  Future intSwiper() async {
    try {
      Response res = await getHomeSwiper();
      print('res-winTTTT-$res');
      setState(() {
        this.swiperList = json.decode(res.toString());
      });
    } catch (e) {
      print('swiper-error-$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('表单');
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Column(
              children: <Widget>[
                HomeSearch(), // 顶部搜索栏
                SwiperDiy(swiperList: this.swiperList), // 轮播图
              ],
            ),
          )
        ],
      ),
    );
  }
}
