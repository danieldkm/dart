// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'device_token.dart';
import 'supplier.dart';

class Chat {
  final int id;
  final int user;
  final Supplier supplier;
  final String name;
  final String petName;
  final String status;
  final DeviceToken? userDeviceToken;
  final DeviceToken? supplierDeviceToken;
  Chat({
    required this.id,
    required this.user,
    required this.supplier,
    required this.name,
    required this.petName,
    required this.status,
    this.userDeviceToken,
    this.supplierDeviceToken,
  });
}
