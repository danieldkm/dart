// ignore_for_file: public_member_api_docs, sort_constructors_first

class SupplierService {
  final int id;
  final int? supplierId;
  final String? name;
  final double? price;
  SupplierService({
    required this.id,
    this.supplierId,
    this.name,
    this.price,
  });
}
