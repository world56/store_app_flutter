import '../utils/request.dart' show http;

/// 请求首页数据
Future getHomeInfo() {
  return http.request('home');
}
