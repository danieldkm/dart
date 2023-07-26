import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../application/logger/i_logger.dart';
import '../service/i_chat_service.dart';
import '../view_models/chat_notify_view_model.dart';

part 'chat_controller.g.dart';

@injectable
class ChatController {
  IChatService service;
  ILogger log;

  ChatController({
    required this.service,
    required this.log,
  });

  @Route.post('/schedule/<scheduleId>/start-chat')
  Future<Response> startChatByScheduleId(
    Request request,
    String scheduleId,
  ) async {
    try {
      final chatId = await service.startChat(int.parse(scheduleId));
      return Response.ok(jsonEncode({'chat_id': chatId}));
    } catch (e, s) {
      log.error('Erro ao iniciar chat', e, s);
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao iniciar chat'},
        ),
      );
    }
  }

  @Route.post('/notify')
  Future<Response> notifyUser(Request request) async {
    try {
      final model = ChatNotifyViewModel(
        dataRequest: await request.readAsString(),
      );
      await service.notifyChat(model);
      return Response.ok(jsonEncode({}));
    } catch (e, s) {
      log.error('Erro ao enviar notificação', e, s);
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao enviar notificação'},
        ),
      );
    }
  }

  @Route.get('/user')
  Future<Response> findChatByUser(Request request) async {
    try {
      final user = int.parse(request.headers['user']!);
      final chats = await service.getChatsByUserId(user);
      final resultChats = chats
          .map(
            (c) => {
              'id': c.id,
              'user': c.user,
              'name': c.name,
              'pet_name': c.petName,
              'supplier': {
                'id': c.supplier.id,
                'name': c.supplier.name,
                'logo': c.supplier.logo,
              },
            },
          )
          .toList();
      return Response.ok(jsonEncode(resultChats));
    } catch (e, s) {
      log.error('Erro ao buscar chats do usuário', e, s);
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao buscar chats do usuário'},
        ),
      );
    }
  }

  @Route.get('/supplier')
  Future<Response> findChasBySupplier(Request request) async {
    try {
      final supplier = request.headers['supplier'];
      if (supplier == null) {
        return Response(
          HttpStatus.badRequest,
          body: jsonEncode(
            {'message': 'Usuário logado não é um fornecedor'},
          ),
        );
      }
      final supplierId = int.parse(supplier);
      final chats = await service.getChatsBySupplierId(supplierId);
      final resultChats = chats
          .map(
            (c) => {
              'id': c.id,
              'user': c.user,
              'name': c.name,
              'pet_name': c.petName,
              'supplier': {
                'id': c.supplier.id,
                'name': c.supplier.name,
                'logo': c.supplier.logo,
              },
            },
          )
          .toList();
      return Response.ok(jsonEncode(resultChats));
    } catch (e, s) {
      log.error('Erro ao buscar chats do fornecedor', e, s);
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao buscar chats do fornecedor'},
        ),
      );
    }
  }

  @Route.put('/<chatId>/end-chat')
  Future<Response> endChat(Request request, String chatId) async {
    try {
      await service.endChat(int.parse(chatId));
      return Response.ok(jsonEncode({}));
    } catch (e, s) {
      log.error('Erro ao finalizar chat', e, s);
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao finalizar chat'},
        ),
      );
    }
  }

  Router get router => _$ChatControllerRouter(this);
}
