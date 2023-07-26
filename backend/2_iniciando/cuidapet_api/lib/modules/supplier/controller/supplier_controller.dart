// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../application/logger/i_logger.dart';
import '../../../entities/supplier.dart';
import '../service/i_supplier_service.dart';
import '../view_models/create_supplier_user_view_model.dart';
import '../view_models/supplier_update_input_model.dart';

part 'supplier_controller.g.dart';

@injectable
class SupplierController {
  ISupplierService service;
  ILogger log;

  SupplierController({
    required this.service,
    required this.log,
  });

  @Route.get('/')
  Future<Response> findNearByMe(Request request) async {
    try {
      final lat = double.tryParse(request.url.queryParameters['lat'] ?? '');
      final lng = double.tryParse(request.url.queryParameters['lng'] ?? '');

      if (lat == null || lng == null) {
        return Response(
          HttpStatus.badRequest,
          body: jsonEncode(
            {'message': 'Latitude e/ou longitude obrigatórios'},
          ),
        );
      }

      final suppliers = await service.findNearByMe(lat, lng);
      final response = suppliers
          .map((e) => {
                'id': e.id,
                'name': e.name,
                'logo': e.logo,
                'distance': e.distance,
                'category': e.categoryId,
              })
          .toList();
      return Response.ok(jsonEncode(response));
    } catch (e, s) {
      log.error('Erro ao buscar forncedores perto de mim', e, s);
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao buscar forncedores perto de mim'},
        ),
      );
    }
  }

  @Route.get('/<id|[0-9]+>')
  Future<Response> findById(Request request, String id) async {
    try {
      final supplier = await service.findById(int.parse(id));
      if (supplier == null) {
        return Response.ok(jsonEncode({}));
      }
      return Response.ok(_supplierMapper(supplier));
    } catch (e, s) {
      log.error('Erro ao buscar forncedor por id', e, s);
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao buscar forncedor por id'}),
      );
    }
  }

  @Route.get('/<supplierId|[0-9]+>/services')
  Future<Response> findServicesBySupplierId(
      Request request, String supplierId) async {
    try {
      final supplierServices =
          await service.findServicesBySupplierId(int.parse(supplierId));
      final response = supplierServices
          .map((e) => {
                'id': e.id,
                'supplier_id': e.supplierId,
                'name': e.name,
                'price': e.price,
              })
          .toList();
      return Response.ok(jsonEncode(response));
    } catch (e, s) {
      log.error('Erro ao buscar serviços', e, s);
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao buscar serviços'}),
      );
    }
  }

  @Route.get('/user')
  Future<Response> checkUserExists(Request request) async {
    try {
      final email = request.url.queryParameters['email'];
      if (email == null) {
        return Response(
          HttpStatus.badRequest,
          body: jsonEncode({'message': 'E-mail obrigatório'}),
        );
      }
      final isEmailExists = await service.checkUserEmailExists(email);
      return isEmailExists
          ? Response(HttpStatus.ok)
          : Response(HttpStatus.noContent);
    } catch (e, s) {
      log.error('Erro ao verificar se login existe', e, s);
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao verificar se login existe'}),
      );
    }
  }

  @Route.post('/user')
  Future<Response> createNewUser(Request request) async {
    try {
      final model = CreateSupplierUserViewModel(
        dataRequest: await request.readAsString(),
      );
      await service.createUserSupplier(model);
      return Response.ok(jsonEncode({}));
    } catch (e, s) {
      log.error('Erro ao cadastrar um novo fornecedor e usuário', e, s);
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao cadastrar um novo fornecedor e usuário'},
        ),
      );
    }
  }

  @Route.put('/')
  Future<Response> update(Request request) async {
    try {
      final supplier = int.tryParse(request.headers['supplier'] ?? '');
      if (supplier == null) {
        return Response(
          HttpStatus.badRequest,
          body: jsonEncode(
            {'message': 'código fornecedor não poder ser nulo'},
          ),
        );
      }

      final model = SupplierUpdateInputModel(
        supplierId: supplier,
        dataRequest: await request.readAsString(),
      );

      final supplierResponse = await service.update(model);

      return Response.ok(_supplierMapper(supplierResponse));
    } catch (e, s) {
      log.error('Erro ao atualizar fornecedor', e, s);
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao atualizar fornecedor'},
        ),
      );
    }
  }

  String? _supplierMapper(Supplier supplier) {
    return jsonEncode({
      'id': supplier.id,
      'name': supplier.name,
      'logo': supplier.logo,
      'address': supplier.address,
      'phone': supplier.phone,
      'latitude': supplier.lat,
      'longitude': supplier.lng,
      'category': {
        'id': supplier.category?.id,
        'name': supplier.category?.name,
        'type': supplier.category?.type,
      },
    });
  }

  Router get router => _$SupplierControllerRouter(this);
}
