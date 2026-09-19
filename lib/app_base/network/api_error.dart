import '../constants/net_constants.dart';

/// define error response of App.
class ApiException implements Exception {
  final String message;
  final int code;

  ApiException({this.code = ApiCode.unknown, String? message})
    : message = message ?? 'Unknown';

  @override
  String toString() {
    return message;
  }
}

class ApiJsonException implements Exception {
  final String? message;

  ApiJsonException({this.message = ""});

  @override
  String toString() {
    return message.toString();
  }
}

/// throw this error when request cancel
class ApiCancelException implements Exception {}
