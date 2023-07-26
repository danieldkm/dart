// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../../../application/exceptions/service_exception.dart';
import '../../../application/exceptions/user_not_found_exception.dart';
import '../../../application/helpers/jwt_helper.dart';
import '../../../application/logger/i_logger.dart';
import '../../../entities/user.dart';
import '../data/i_user_repository.dart';
import '../view_models/refresh_token_view_model.dart';
import '../view_models/update_url_avatar_view_model.dart';
import '../view_models/user_confirm_input_model.dart';
import '../view_models/user_refresh_token_input_model.dart';
import '../view_models/user_save_input_model.dart';
import '../view_models/user_update_token_device_input_model.dart';
import 'i_user_service.dart';

@LazySingleton(as: IUserService)
class UserService implements IUserService {
  IUserRepository userRepository;
  ILogger log;

  UserService({
    required this.userRepository,
    required this.log,
  });

  @override
  Future<User> createUser(UserSaveInputModel user) {
    final userEntity = User(
      email: user.email,
      password: user.password,
      registerType: 'App',
      supplierId: user.supplierId,
    );

    return userRepository.createUser(userEntity);
  }

  @override
  Future<User> loginWithEmailAndPassword(
    String email,
    String password,
    bool supplierUser,
  ) =>
      userRepository.loginWithEmailAndPassword(
        email,
        password,
        supplierUser,
      );

  @override
  Future<User> loginWithSocial(
    String email,
    String? avatar,
    String socialkey,
    String socialtype,
  ) async {
    try {
      return await userRepository.loginByEmailSocialKey(
        email,
        socialkey,
        socialtype,
      );
    } on UserNotFoundException catch (e) {
      log.error('Usuário não encontrado, criando um usuário', e);
      final user = User(
        email: email,
        imageAvatar: avatar,
        registerType: socialtype,
        socialKey: socialkey,
        password: DateTime.now().toString(),
      );
      return await userRepository.createUser(user);
    }
  }

  @override
  Future<String> confirmLogin(UserConfirmInputModel inputModel) async {
    final refreshToken = JwtHelper.refreshToken(inputModel.accessToken);
    final user = User(
      id: inputModel.userId,
      refreshToken: refreshToken,
      iosToken: inputModel.iosDeviceToken,
      androidToken: inputModel.androidDeviceToken,
    );
    await userRepository.updateUserDeviceTokenAndRefreshToken(user);
    return refreshToken;
  }

  @override
  Future<RefreshTokenViewModel> refreshToken(
    UserRefreshTokenInputModel inputModel,
  ) async {
    _validateRefreshToken(inputModel);
    final newAccessToken = JwtHelper.generateJWT(
      inputModel.user,
      inputModel.supplier,
    );
    final newRefreshToken = JwtHelper.refreshToken(
      newAccessToken.replaceAll('Bearer ', ''),
    );

    final user = User(
      id: inputModel.user,
      refreshToken: newRefreshToken,
    );

    await userRepository.updateRefreshToken(user);

    return RefreshTokenViewModel(
      accessToken: newAccessToken,
      refreshToken: newRefreshToken,
    );
  }

  void _validateRefreshToken(UserRefreshTokenInputModel inputModel) {
    try {
      final refreshToken = inputModel.refreshToken.split(' ');
      if (refreshToken.length != 2 || refreshToken.first != 'Bearer') {
        log.error('Refresh token inválido');
        throw ServiceException('Refresh token inválido');
      }

      final refreshTokenClaim = JwtHelper.getClaims(refreshToken.last);
      refreshTokenClaim.validate(issuer: inputModel.accessToken);
    } on ServiceException {
      rethrow;
    } on JwtException {
      log.error('Refresh token inválido');
      throw ServiceException('Refresh token inválido');
    } catch (e) {
      throw ServiceException('Erro ao validar refresh token');
    }
  }

  @override
  Future<User> findById(int id) => userRepository.findById(id);

  @override
  Future<User> updateAvatar(UpdateUrlAvatarViewModel viewModel) async {
    await userRepository.updateUrlAvatar(viewModel.userId, viewModel.urlAvatar);
    return findById(viewModel.userId);
  }

  @override
  Future<void> updateDeviceToken(UserUpdateTokenDeviceInputModel inputModel) =>
      userRepository.updateDeviceToken(
        inputModel.userId,
        inputModel.token,
        inputModel.platform,
      );
}
