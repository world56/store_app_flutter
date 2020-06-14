import 'package:dio/dio.dart';
import 'dart:async';
import '../config/environment.dart' show baseUrl;
// import 'dart:io';

class Param {
  Map<dynamic, dynamic> data;
  // Options options;
}

class Request extends InterceptorsWrapper {
  /// 请求超时 30秒
  int timeout = 1000 * 10;

  String httpUrl;

  Dio http = new Dio();

  String method;

  Request() {
    print('Request-构造函数运行');
    this.httpUrl = baseUrl;
    this.createHttp();
  }

  /// 初始化请求配置
  createHttp() {
    print('初始化配置');
    this.http.interceptors.add(InterceptorsWrapper(
        onRequest: this.onRequest,
        onResponse: this.onResponse,
        onError: this.onError));
  }

  /// 请求入口
  Future request(String path) {
    return this.http.request(
          path,
          options: Options(method: "GET"),
        );
  }

  /// 请求前拦截处理
  @override
  Future onRequest(RequestOptions options) {
    print("请求前拦截REQUEST[${options?.method}] => PATH: ${options?.path}");
    options.baseUrl = this.httpUrl;
    options.connectTimeout = this.timeout;
    return super.onRequest(options);
  }

  /// 请求后返回数据处理
  @override
  Future onResponse(Response response) {
    print(
        "RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    return super.onResponse(response);
  }

  /// 请求失败
  @override
  Future onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}

/// 实例化http请求方法
Request http = new Request();
