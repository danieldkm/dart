// ignore_for_file: public_member_api_docs, sort_constructors_first
class DatabaseException implements Exception {
  String? message;
  Exception? exception;
  DatabaseException({
    this.message,
    this.exception,
  });

  @override
  String toString() =>
      'DatabaseException(message: $message, exception: $exception)';
}
