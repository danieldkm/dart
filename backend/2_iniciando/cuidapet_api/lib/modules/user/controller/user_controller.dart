// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../application/exceptions/user_not_found_exception.dart';
import '../../../application/logger/i_logger.dart';
import '../service/i_user_service.dart';
import '../view_models/update_url_avatar_view_model.dart';
import '../view_models/user_update_token_device_input_model.dart';

part 'user_controller.g.dart';

@injectable
class UserController {
  IUserService userService;
  ILogger log;
  UserController({
    required this.userService,
    required this.log,
  });

  @Route.get('/')
  Future<Response> findByToken(Request request) async {
    try {
      final user = int.parse(request.headers['user']!);
      final userData = await userService.findById(user);

      return Response.ok(jsonEncode({
        'email': userData.email,
        'register_type': userData.registerType,
        'img_avatar': userData.imageAvatar,
      }));
    } on UserNotFoundException {
      return Response(HttpStatus.noContent);
    } catch (e, s) {
      log.error('Erro ao buscar usuário', e, s);
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao buscar usuário'}),
      );
    }
  }

  @Route.put('/avatar')
  Future<Response> updateAvatar(Request request) async {
    try {
      final userId = int.parse(request.headers['user']!);
      final updateUrlAvatarViewModel = UpdateUrlAvatarViewModel(
        userId: userId,
        dataRequest: await request.readAsString(),
      );
      final userData = await userService.updateAvatar(updateUrlAvatarViewModel);
      return Response.ok(jsonEncode({
        'email': userData.email,
        'register_type': userData.registerType,
        'img_avatar': userData.imageAvatar,
      }));
    } catch (e, s) {
      log.error('Erro ao atualizar avatar', e, s);
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao atualizar avatar'}),
      );
    }
  }

  @Route.put('/device')
  Future<Response> updateDeviceToken(Request request) async {
    try {
      final userId = int.parse(request.headers['user']!);
      final updateTokenDevice = UserUpdateTokenDeviceInputModel(
        userId: userId,
        dataRequest: await request.readAsString(),
      );
      await userService.updateDeviceToken(updateTokenDevice);

      return Response.ok(jsonEncode({}));
    } catch (e, s) {
      log.error('Erro ao atualizar device token', e, s);
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao atualizar device token'}),
      );
    }
  }

  Router get router => _$UserControllerRouter(this);
}
