import '../utils/request.dart';

/// 请求首页数据
Future getHomeInfo(data) {
  return http.request('home', {
    'method': 'GET',
    'queryParameters': {'queryParameters': 'queryParameters'}
  });
}

// 获取首页轮播
Future getHomeSwiper() {
  return http.request('home/getSwiper', {
    'method': 'GET',
  });
}
