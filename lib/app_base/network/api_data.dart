import '../constants/net_constants.dart';

// TODO: need to change the code in here because dummy json api not sending the code,msg,count etc, directly data

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
