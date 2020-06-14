import '../utils/request.dart';

/// 请求首页数据
Future getHomeInfo(data) {
  return http.request('home', {
    'method': 'GET',
    'queryParameters': {'queryParameters': 'queryParameters'},
    'data': data
  });
}
