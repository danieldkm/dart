// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../application/exceptions/request_validation_exception.dart';
import '../../../application/exceptions/user_exists_exception.dart';
import '../../../application/exceptions/user_not_found_exception.dart';
import '../../../application/helpers/jwt_helper.dart';
import '../../../application/logger/i_logger.dart';
import '../../../entities/user.dart';
import '../service/i_user_service.dart';
import '../view_models/login_view_model.dart';
import '../view_models/user_confirm_input_model.dart';
import '../view_models/user_refresh_token_input_model.dart';
import '../view_models/user_save_input_model.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController {
  IUserService userService;
  ILogger log;

  AuthController({
    required this.userService,
    required this.log,
  });

  @Route.post('/')
  Future<Response> login(Request request) async {
    try {
      final loginViewMOdel = LoginViewModel(
        dataRequest: await request.readAsString(),
      );

      User user;

      if (!loginViewMOdel.socialLogin) {
        loginViewMOdel.loginEmailValidate();
        user = await userService.loginWithEmailAndPassword(
          loginViewMOdel.login,
          loginViewMOdel.password!,
          loginViewMOdel.supplierUser,
        );
      } else {
        loginViewMOdel.loginSocialValidate();
        // Social Login (Facebook, google, apple, etc..)
        user = await userService.loginWithSocial(
          loginViewMOdel.login,
          loginViewMOdel.avatar,
          loginViewMOdel.socialKey!,
          loginViewMOdel.socialType!,
        );
      }
      return Response.ok(jsonEncode({
        'access_token': JwtHelper.generateJWT(user.id!, user.supplierId),
      }));
    } on UserNotFoundException {
      return Response.forbidden(
        jsonEncode({'message': 'Usuário ou senha inválidos'}),
      );
    } on RequestValidationException catch (e, s) {
      log.error('Erro de parâmetros obrigatórios não enviados', e, s);
      return Response(HttpStatus.badRequest, body: jsonEncode(e.errors));
    } catch (e, s) {
      log.error('Erro ao fazer login', e, s);
      return Response.internalServerError(
        body: jsonEncode({
          'message': 'Erro ao realizar login',
        }),
      );
    }
  }

  @Route.post('/register')
  Future<Response> saveUser(Request request) async {
    try {
      final userModel = UserSaveInputModel.requestMapping(
        dataRequest: await request.readAsString(),
      );
      await userService.createUser(userModel);
      return Response.ok(
        jsonEncode({'message': 'cadastro realizado com sucesso'}),
      );
    } on UserExistsException {
      return Response(
        HttpStatus.badRequest,
        body: jsonEncode({'message': 'Usuário já cadastrado na base de dados'}),
      );
    } catch (e) {
      log.error('Erro ao cadastrar usuário', e);
      return Response.internalServerError();
    }
  }

  @Route('PATCH', '/confirm')
  Future<Response> confirmeLogin(Request request) async {
    try {
      final user = int.parse(request.headers['user']!);
      final supplier = int.tryParse(request.headers['supplier'] ?? '');
      final token = JwtHelper.generateJWT(user, supplier).replaceAll(
        'Bearer ',
        '',
      );

      final inputModel = UserConfirmInputModel(
        dataRequest: await request.readAsString(),
        userId: user,
        accessToken: token,
      );
      inputModel.validateRequest();
      final refreshToken = await userService.confirmLogin(inputModel);

      return Response.ok(jsonEncode({
        'access_token': 'Bearer $token',
        'refresh_token': refreshToken,
      }));
    } on RequestValidationException catch (e, s) {
      log.error('Erro de parâmetros obrigatórios não enviados', e, s);
      return Response(HttpStatus.badRequest, body: jsonEncode(e.errors));
    } catch (e, s) {
      log.error('Erro ao confirmar login', e, s);
      return Response.internalServerError();
    }
  }

  @Route.put('/refresh')
  Future<Response> refreshToken(Request request) async {
    try {
      final user = int.parse(request.headers['user']!);
      final supplier = int.tryParse(request.headers['supplier'] ?? '');
      final accessToken = request.headers['access_token']!;

      final model = UserRefreshTokenInputModel(
        user: user,
        supplier: supplier,
        accessToken: accessToken,
        dataRequest: await request.readAsString(),
      );
      final userRefreshToken = await userService.refreshToken(model);

      return Response.ok(jsonEncode({
        'access_token': userRefreshToken.accessToken,
        'refresh_token': userRefreshToken.refreshToken,
      }));
    } catch (e, s) {
      log.error('Erro ao atualizar token', e, s);
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao atualizar token'}),
      );
    }
  }

  Router get router => _$AuthControllerRouter(this);
}
