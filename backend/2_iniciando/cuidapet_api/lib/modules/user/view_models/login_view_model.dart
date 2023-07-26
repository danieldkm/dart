import '../../../application/exceptions/request_validation_exception.dart';
import '../../../application/helpers/request_mapping.dart';

class LoginViewModel extends RequestMapping {
  late String login;
  String? password;
  late bool socialLogin;
  String? avatar;
  String? socialType;
  String? socialKey;
  late bool supplierUser;

  LoginViewModel({super.dataRequest});

  @override
  void map() {
    login = data['email'];
    password = data['password'];
    socialLogin = data['social_login'];
    avatar = data['avatar'];
    socialType = data['social_type'];
    socialKey = data['social_key'];
    supplierUser = data['supplier_user'];
  }

  void loginEmailValidate() {
    final errors = <String, String>{};

    if (password == null) {
      errors['password'] = 'required';
    }

    if (errors.isNotEmpty) {
      throw RequestValidationException(errors);
    }
  }

  void loginSocialValidate() {
    final errors = <String, String>{};

    if (socialType == null) {
      errors['social_type'] = 'required';
    }

    if (socialKey == null) {
      errors['social_key'] = 'required';
    }

    if (errors.isNotEmpty) {
      throw RequestValidationException(errors);
    }
  }
}
