import 'package:injectable/injectable.dart';

import '../../../application/dtos/supplier_nearby_me_dto.dart';
import '../../../application/logger/i_logger.dart';
import '../../../entities/category.dart';
import '../../../entities/supplier.dart';
import '../../../entities/supplier_service.dart' as entity;
import '../../user/service/i_user_service.dart';
import '../../user/view_models/user_save_input_model.dart';
import '../data/i_supplier_repository.dart';
import '../view_models/create_supplier_user_view_model.dart';
import '../view_models/supplier_update_input_model.dart';
import 'i_supplier_service.dart';

@LazySingleton(as: ISupplierService)
class SupplierService implements ISupplierService {
  final ISupplierRepository supplierRepository;
  final IUserService userService;
  final ILogger log;
  static const DISTANCE = 5;

  SupplierService({
    required this.supplierRepository,
    required this.userService,
    required this.log,
  });

  @override
  Future<List<SupplierNearbyMeDto>> findNearByMe(
    double lat,
    double lng,
  ) =>
      supplierRepository.findNearByPosition(lat, lng, DISTANCE);

  @override
  Future<Supplier?> findById(int id) => supplierRepository.findById(id);

  @override
  Future<List<entity.SupplierService>> findServicesBySupplierId(
          int supplierId) =>
      supplierRepository.findServicesBySupplierId(supplierId);

  @override
  Future<bool> checkUserEmailExists(String email) =>
      supplierRepository.checkUserEmailExists(email);

  @override
  Future<void> createUserSupplier(CreateSupplierUserViewModel model) async {
    final supplierEntity = Supplier(
      name: model.supplierName,
      category: Category(id: model.category),
    );
    final supplierId = await supplierRepository.saveSupplier(supplierEntity);

    final userInputModel = UserSaveInputModel(
      email: model.email,
      password: model.password,
      supplierId: supplierId,
    );
    await userService.createUser(userInputModel);
  }

  @override
  Future<Supplier> update(SupplierUpdateInputModel model) async {
    var supplier = Supplier(
      id: model.supplierId,
      name: model.name,
      address: model.address,
      lat: model.lat,
      lng: model.lng,
      logo: model.logo,
      phone: model.phone,
      category: Category(id: model.categoryId),
    );

    return await supplierRepository.update(supplier);
  }
}
