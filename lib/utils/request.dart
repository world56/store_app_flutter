import 'package:dio/dio.dart';
import 'dart:async';
import '../config/environment.dart' show baseUrl;
// import 'dart:io';

class Request extends InterceptorsWrapper {
  Dio http = new Dio();

  String httpUrl;

  int timeout = 1000 * 10;

  Request() {
    this.httpUrl = baseUrl;
    this.createHttp();
  }

  /// 初始化请求配置
  createHttp() {
    this.http.interceptors.add(InterceptorsWrapper(
          onRequest: this.onRequest,
          onResponse: this.onResponse,
          onError: this.onError,
        ));
  }

  /// 请求入口
  Future request(String path, Map<String, dynamic> param) async {
    return await this.http.request(
          path,
          data: param['data'],
          queryParameters: param['queryParameters'],
          options: Options(
            method: param['method'],
          ),
        );
  }

  /// 请求前拦截处理
  @override
  Future onRequest(RequestOptions options) async {
    options.baseUrl = this.httpUrl;
    options.connectTimeout = this.timeout;
    // String method = options?.method;
    print('请求前拦截处理 请求类型：${options?.queryParameters}');
    return super.onRequest(options);
  }

  /// 请求后返回数据处理
  @override
  Future onResponse(Response response) {
    print(
        "请求后返回数据处理[${response?.statusCode}] => PATH: ${response?.request?.path}");
    return super.onResponse(response);
  }

  /// 请求失败
  @override
  Future onError(DioError err) {
    print("请求失败[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}

/// 实例化http请求方法
Request http = new Request();
