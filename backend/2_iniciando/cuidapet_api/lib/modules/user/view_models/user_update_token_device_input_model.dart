import '../../../application/helpers/request_mapping.dart';
import 'platform.dart';

class UserUpdateTokenDeviceInputModel extends RequestMapping {
  int userId;
  late String token;
  late Platform platform;

  UserUpdateTokenDeviceInputModel({
    required this.userId,
    required super.dataRequest,
  });

  @override
  void map() {
    token = data['token'];
    platform = data['platform'].toLowerCase() == 'ios'
        ? Platform.ios
        : Platform.android;
  }
}
