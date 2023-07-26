// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../application/helpers/request_mapping.dart';

class UserRefreshTokenInputModel extends RequestMapping {
  int user;
  int? supplier;
  late String accessToken;
  late String refreshToken;

  UserRefreshTokenInputModel({
    super.dataRequest,
    required this.user,
    this.supplier,
    required this.accessToken,
  });

  @override
  void map() {
    refreshToken = data['refresh_token'];
  }
}
