import '../constants/net_constants.dart';

/// dummyjson repo: https://github.com/Ovi/DummyJSON/blob/master/src/controllers/product.js
/// in this project only use three api: getAllProducts, getProductById and searchProducts
/// for the listing (getAllProducts and searchProducts), the return response is paginateResource which seems like no error response
/// for the detail (getProductById), it will return the product and have error response which is transport layer error 404 with a message in data body
/// therefore when do serialization of data the response will not have things like code, msg, and count (these are extra info can be used if backend decide to handle unique error code etc which dummy json don't)
/// in this project will not using this, a bit lazy to change and match the backend response, use other method instead

class HttpResult<T> {
  int? code;
  String? msg;
  int? count;
  T? data;
  String? header;

  HttpResult();

  ///forge success result
  factory HttpResult.success({T? data, String? msg, int? count}) {
    var result = HttpResult<T>();
    result.code = ApiCode.success;
    result.msg = msg;
    result.count = count;
    result.data = data;
    return result;
  }

  ///forge failure result
  factory HttpResult.failure({int? code, String? msg}) {
    var result = HttpResult<T>();
    result.code = code ?? ApiCode.unknown;
    result.msg = msg ?? '';
    return result;
  }

  ///manual serialization
  factory HttpResult.fromJson(
    Map<String, dynamic> json,
    T? Function(dynamic dataJson) fromJsonFun,
  ) {
    HttpResult<T> result = HttpResult<T>();
    result.code = json[ApiConstant.keyCode] as int?;
    result.msg = json[ApiConstant.keyMsg] as String?;
    result.count = json[ApiConstant.keyCount] as int?;
    result.header = json[ApiConstant.keyHeader] as String?;
    final data = json[ApiConstant.keyData];
    if (data != null) {
      result.data = fromJsonFun(json[ApiConstant.keyData]);
    }
    return result;
  }

  ///manual deserialization
  Map<String, Object?> toJson(Object? Function(T? value) toJsonFun) {
    return {
      ApiConstant.keyCode: code,
      ApiConstant.keyMsg: msg,
      ApiConstant.keyCount: count,
      ApiConstant.keyData: toJsonFun(data),
    };
  }

  bool get isSuccess {
    return code == ApiCode.success;
  }
}
