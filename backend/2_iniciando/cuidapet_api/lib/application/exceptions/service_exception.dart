// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceException implements Exception {
  final String? message;
  ServiceException([
    this.message,
  ]);
}
