import 'dart:typed_data';

import '../../core/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> findAll(String? name);
  Future<ProductModel> getProduct(int id);
  Future<void> save(ProductModel productModel);
  Future<String> uploadImageProduct(Uint8List file, String fileName);
  Future<void> deleteProduct(int id);
}
