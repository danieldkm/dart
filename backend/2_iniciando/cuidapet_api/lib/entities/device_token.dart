// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeviceToken {
  final String? android;
  final String? ios;
  DeviceToken({
    this.android,
    this.ios,
  });

  List<String?> get tokens => [android, ios];
}
