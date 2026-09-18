class AppConfig {
  final String apiUrl;
  final bool isLoggable;
  final bool isDebug;

  AppConfig._({
    required this.apiUrl,
    required this.isLoggable,
    required this.isDebug,
  });

  static AppConfig curEnv = devEnv;

  static AppConfig devEnv = AppConfig._(
    apiUrl: 'https://dummyjson.com', // production link
    // apiUrl: 'https://dummyjson.com', // development link
    // apiUrl: 'http://jihpwf-ip-180-75-250-104.tunnelmole.net', // tmole link
    // apiUrl: 'http://192.168.0.7:8013', // local link
    isLoggable: true,
    isDebug: false,
  );

  static AppConfig testEnv = AppConfig._(
    apiUrl: 'https://dummyjson.com', // production link
    // apiUrl: 'https://dummyjson.com', // development link
    isLoggable: true,
    isDebug: true,
  );

  static AppConfig prodEnv = AppConfig._(
    apiUrl: 'https://dummyjson.com', // production link
    // apiUrl: 'https://dummyjson.com', // development link
    isLoggable: false,
    isDebug: false,
  );
}
