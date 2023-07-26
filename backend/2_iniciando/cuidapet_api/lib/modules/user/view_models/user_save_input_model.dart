import '../../../application/helpers/request_mapping.dart';

class UserSaveInputModel extends RequestMapping {
  late String email;
  late String password;
  int? supplierId;

  UserSaveInputModel({
    required this.email,
    required this.password,
    required this.supplierId,
  }) : super.empty();
  UserSaveInputModel.requestMapping({super.dataRequest});

  @override
  void map() {
    email = data['email'];
    password = data['password'];
  }
}
