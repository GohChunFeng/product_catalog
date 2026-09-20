import 'dart:async';

import 'package:dio/dio.dart';

import '../network/api_error.dart';
import 'api_data.dart';

///extend Stream, transform Response to Model
extension ResponseStreamExt on Stream<Response> {
  ///transform Response to HttpResult ，need to provide the deserialization method for data
  Stream<HttpResult<T>> mapHttpResult<T>(
    T? Function(dynamic appDataJson) fromJsonFun,
  ) {
    return map((resp) {
      try {
        return HttpResult<T>.fromJson(resp.data, fromJsonFun);
      } catch (e) {
        throw ApiJsonException(message: resp.data.toString());
      }
    });
  }

  ///pass the data to the caller for manual processing
  ///call when the server returns a special response structure
  Stream<T> mapCustom<T>(T Function(dynamic data) transform) {
    return map((resp) {
      return transform(resp.data);
    });
  }
}

extension ResponseFutureExt on Future<Response> {
  Future<HttpResult<T>> thenHttpResult<T>(
    T? Function(dynamic dataJson) fromJsonFun,
  ) {
    return then((resp) {
      try {
        return HttpResult<T>.fromJson(resp.data, fromJsonFun);
      } catch (e) {
        throw ApiJsonException(message: resp.data.toString());
      }
    });
  }

  Future<T> thenCustom<T>(T Function(dynamic data) transform) {
    return then((resp) {
      return transform(resp.data);
    });
  }
}
