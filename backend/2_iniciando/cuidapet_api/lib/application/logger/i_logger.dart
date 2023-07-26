abstract class ILogger {
  void debug(dynamic message, [error, StackTrace? stackTrace]);
  void error(dynamic message, [error, StackTrace? stackTrace]);
  void warning(dynamic message, [error, StackTrace? stackTrace]);
  void info(dynamic message, [error, StackTrace? stackTrace]);
}
