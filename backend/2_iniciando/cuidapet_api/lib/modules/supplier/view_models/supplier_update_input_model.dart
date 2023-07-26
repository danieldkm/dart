// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../application/helpers/request_mapping.dart';

class SupplierUpdateInputModel extends RequestMapping {
  int supplierId;
  late String name;
  late String logo;
  late String address;
  late String phone;
  late double lat;
  late double lng;
  late int categoryId;

  SupplierUpdateInputModel({
    required this.supplierId,
    required super.dataRequest,
  });

  @override
  void map() {
    name = data['name'];
    logo = data['logo'];
    address = data['address'];
    phone = data['phone'];
    lat = data['lat'];
    lng = data['lng'];
    categoryId = data['category_id'];
  }
}
