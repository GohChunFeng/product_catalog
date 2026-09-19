class NetworkConstant {
  NetworkConstant._();

  static const int defaultTimeout = 20000;
}

// TODO: check again the api response code, seems like not compatible, need to rethink how to adapt it

class ApiCode {
  ApiCode._();

  static const int unknown = -1;
  static const int success = 0;
  static const int commonError = 1;
  static const int noPermission = 401;
}

class ApiConstant {
  ApiConstant._();

  static const keyData = 'data';
  static const keyCode = 'code';
  static const keyMsg = 'msg';
  static const keyCount = 'count';
  static const keyHeader = 'header';
}
