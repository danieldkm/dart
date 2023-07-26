import '../../../entities/user.dart';
import '../view_models/refresh_token_view_model.dart';
import '../view_models/update_url_avatar_view_model.dart';
import '../view_models/user_confirm_input_model.dart';
import '../view_models/user_refresh_token_input_model.dart';
import '../view_models/user_save_input_model.dart';
import '../view_models/user_update_token_device_input_model.dart';

abstract class IUserService {
  Future<User> createUser(UserSaveInputModel user);
  Future<User> loginWithEmailAndPassword(
    String email,
    String password,
    bool supplierUser,
  );
  Future<User> loginWithSocial(
    String email,
    String? avatar,
    String socialkey,
    String socialtype,
  );
  Future<String> confirmLogin(UserConfirmInputModel inputModel);
  Future<RefreshTokenViewModel> refreshToken(
    UserRefreshTokenInputModel inputModel,
  );
  Future<User> findById(int id);
  Future<User> updateAvatar(UpdateUrlAvatarViewModel viewModel);
  Future<void> updateDeviceToken(UserUpdateTokenDeviceInputModel inputModel);
}
