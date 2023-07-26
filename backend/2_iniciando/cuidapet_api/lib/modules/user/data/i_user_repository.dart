import '../../../entities/user.dart';
import '../view_models/platform.dart';

abstract class IUserRepository {
  Future<User> createUser(User user);
  Future<User> loginWithEmailAndPassword(
    String email,
    String password,
    bool supplierUser,
  );
  Future<User> loginByEmailSocialKey(
    String email,
    String socialkey,
    String socialtype,
  );
  Future<void> updateUserDeviceTokenAndRefreshToken(User user);
  Future<void> updateRefreshToken(User user);
  Future<User> findById(int id);
  Future<void> updateUrlAvatar(int id, String urlAvatar);
  Future<void> updateDeviceToken(int id, String token, Platform platform);
}
