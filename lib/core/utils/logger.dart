import '../app_export.dart';

class Logger {
  static LogMode _logMode = LogMode.debug;

  Logger() {
    init(_logMode);
  }

  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void log(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      debugPrint("debugPrint::: $data");
    }
  }
}

enum LogMode { debug, live }
