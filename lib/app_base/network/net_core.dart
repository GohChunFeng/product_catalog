import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:product_catalog/app_base/enviroments/app_config.dart';

import '../constants/net_constants.dart';
import 'api_error.dart';

/// Obtain an entry point for making requests to the App server.
/// Includes some settings and interceptors specifically designed for the App server.
/// If you need to request that is not from the App server
/// Use `createDio()` to create a new Dio instance, which does not include the App's configuration.
ApiClient getApiClient() {
  return ApiClient.getInstance();
}

///Create a new Dio instance
Dio createDio({bool outputLog = true}) {
  final options = BaseOptions(
    connectTimeout: const Duration(
      milliseconds: NetworkConstant.defaultTimeout,
    ),
    receiveTimeout: const Duration(
      milliseconds: NetworkConstant.defaultTimeout,
    ),
    sendTimeout: const Duration(milliseconds: NetworkConstant.defaultTimeout),
  );
  final dio = Dio(options);

  //output log
  if (outputLog && AppConfig.curEnv.isLoggable) {
    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }
  return dio;
}

class ApiClient {
  ApiClient._internal() {
    // Manually set the log output in the last interceptor to see the contents of the previous interceptor
    _dio = createDio(outputLog: false);
    _dio.options.baseUrl = AppConfig.curEnv.apiUrl;

    // removed because not needed
    // interceptor
    // add dynamic common header through this
    // this is an example of how to add cookies to the request headers and save cookies from the response headers to the secure storage.
    // _dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) async {
    //       // Retrieve cookies from secure storage
    //       String? storedCookies = await StorageUtil.secureRead(
    //         key: StorageKey.storedCookies,
    //       );
    //       // Add cookies to the request headers if they exist
    //       if (storedCookies != null && storedCookies.isNotEmpty) {
    //         options.headers['Cookie'] = storedCookies;
    //       }
    //       options.headers['Timezone'] =
    //           await FlutterTimezone.getLocalTimezone();
    //       handler.next(options);
    //     },
    //     onResponse: (resp, handler) async {
    //       // Extract cookies from the response headers if they exist
    //       var setCookList = resp.headers['set-cookie'];
    //       String? cookieHeader;
    //       if (setCookList != null && setCookList.isNotEmpty) {
    //         cookieHeader = setCookList[0];
    //       }
    //       if (cookieHeader != null) {
    //         var cookiesList = cookieHeader.split(',');
    //         var parsedCookies = cookiesList.map((cookieString) {
    //           return Cookie.fromSetCookieValue(cookieString.trim());
    //         }).toList();
    //         // Save cookies in secure storage
    //         String cookiesString = parsedCookies
    //             .map((cookie) => '${cookie.name}=${cookie.value}')
    //             .join('; ');
    //         await StorageUtil.secureWrite(
    //           key: StorageKey.storedCookies,
    //           value: cookiesString,
    //         );
    //       }

    //       handler.next(resp);
    //     },
    //   ),
    // );
    //output log
    if (AppConfig.curEnv.isLoggable) {
      _dio.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }

  late Dio _dio;

  static final ApiClient _instance = ApiClient._internal();

  static ApiClient getInstance() => _instance;

  ///Entry point specifically for requesting the App's server-side。
  ///handling the server-side data struct, and throwing an `ApiException` when the statusCode isn't success
  ///
  ///Generally, the code of throwing custom errors should be written in an interceptor,
  ///but currently, `dio` does not support throwing custom errors in interceptors.
  ///see issue: https://github.com/cfug/dio/issues/1950
  Future<Response> request(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    bool checkApiException = true,
  }) async {
    try {
      final response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
      );
      if (checkApiException) {
        try {
          ApiExceptionUtil.checkHttpResultValid(response);
        } catch (e) {
          ApiExceptionUtil.handleApiException(e);
          rethrow;
        }
      }
      return response;
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        // removed because not needed
        // this is example for handling the JWT cookie missing or empty error that trigger by Transport Layer
        // if (dioError.response!.data["msg"]! == "JWT cookie missing or empty") {
        //   await StorageUtil.secureDelete(key: StorageKey.storedCookies);
        //   await StorageUtil.secureDelete(key: StorageKey.rememberMe);
        //   if (appContext.mounted) {
        //     AuthenticationRoute().go(appContext);
        //   }
        // }
      }
      // print("DioError Response: ${dioError.response?.data}");
      return dioError.response ??
          Response(
            requestOptions: RequestOptions(path: url),
          ); //Return the dio response, or a empty response.
    } catch (e) {
      // not sure what to return yet , to be confirm
      return Response(requestOptions: RequestOptions(path: url));
    }
  }

  ///transform future to stream, and add request cancellation
  Stream<Response> _transformFutureToStream(
    Future<Response> Function(CancelToken cancelToken) fun,
  ) {
    var cancelToken = CancelToken();

    late StreamController<Response> sc;
    StreamSubscription? subs;
    sc = StreamController(
      onListen: () {
        subs = fun(cancelToken).asStream().listen(
          sc.add,
          onError: sc.addError,
          onDone: () {
            sc.close();
          },
        );
      },
      onCancel: () {
        subs?.cancel();
        cancelToken.cancel(ApiCancelException());
      },
    );

    return sc.stream;
  }

  ///Stream supports cancel request, but Future cannot. The same below.
  Future<Response> get(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
    formData,
  }) {
    final options = Options(method: 'GET', headers: headers);
    return request(
      path,
      queryParameters: parameters,
      data: formData,
      options: options,
    );
  }

  Stream<Response> getToStream(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  }) {
    final options = Options(method: 'GET', headers: headers);
    return _transformFutureToStream(
      (cancelToken) => request(
        path,
        queryParameters: parameters,
        cancelToken: cancelToken,
        options: options,
      ),
    );
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
    formData,
  }) {
    final options = Options(method: 'POST', headers: headers);
    return request(
      path,
      queryParameters: parameters,
      data: formData,
      options: options,
    );
  }

  Stream<Response> postToStream(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
    formData,
  }) {
    final options = Options(method: 'POST', headers: headers);

    return _transformFutureToStream(
      (cancelToken) => request(
        path,
        queryParameters: parameters,
        data: formData,
        cancelToken: cancelToken,
        options: options,
      ),
    );
  }
}

class ApiExceptionUtil {
  ///determine if ApiCode is successful
  static void checkHttpResultValid(Response resp) {
    var jsonMap = (resp.data as Map<String, dynamic>);
    var code = (jsonMap[ApiConstant.keyCode] as int?) ?? ApiCode.unknown;
    if (_isNeedThrowApiException(code)) {
      var msg = (jsonMap[ApiConstant.keyMsg] as String?);
      throw ApiException(code: code, message: msg);
    }
  }

  static bool _isNeedThrowApiException(int? apiCode) {
    switch (apiCode) {
      case null:
      case ApiCode.success:
      case ApiCode.unknown:
      case 1:
        return false;
      default:
        return true;
    }
  }

  static void handleApiException(dynamic e) async {
    // removed because not needed
    // this is example for handling the JWT cookie missing or empty error that trigger by Application Layer
    // if (e is ApiException) {
    //   switch (e.code) {
    //     case ApiCode.noPermission:
    //       await StorageUtil.secureDelete(key: StorageKey.storedCookies);
    //       await StorageUtil.secureDelete(key: StorageKey.rememberMe);
    //       if (appContext.mounted) {
    //         AuthenticationRoute().go(appContext);
    //       }
    //       break;
    //   }
    // }
  }
}
