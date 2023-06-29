import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../core/models/product_model.dart';
import '../../../repositories/products/products_repository.dart';
part 'products_controller.g.dart';

enum ProductStateStatus {
  initial,
  loading,
  loaded,
  error,
  addOrUpdateProduct,
}

class ProductsController = ProductsControllerBase with _$ProductsController;

abstract class ProductsControllerBase with Store {
  final ProductsRepository _productsRepository;

  ProductsControllerBase(this._productsRepository);

  @readonly
  var _status = ProductStateStatus.initial;

  @readonly
  var _products = <ProductModel>[];

  @readonly
  String? _filterName;

  @readonly
  ProductModel? _productSelected;

  @action
  Future<void> filterByName(String name) async {
    _filterName = name;
    await loadProducts();
  }

  @action
  Future<void> loadProducts() async {
    try {
      _status = ProductStateStatus.loading;
      _products = await _productsRepository.findAll(_filterName);
      _status = ProductStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      _status = ProductStateStatus.error;
    }
  }

  @action
  Future<void> addProduct() async {
    try {
      _status = ProductStateStatus.loading;
      await Future.delayed(
        Duration.zero,
      ); // para informar a tela de exibir o loader
      _productSelected = null;
      _status = ProductStateStatus.addOrUpdateProduct;
    } catch (e, s) {
      log('Erro ao adicionar o produto', error: e, stackTrace: s);
      _status = ProductStateStatus.error;
    }
  }

  @action
  Future<void> editProduct(ProductModel productModel) async {
    try {
      _status = ProductStateStatus.loading;
      await Future.delayed(
        Duration.zero,
      ); // para informar a tela de exibir o loader
      _productSelected = productModel;
      _status = ProductStateStatus.addOrUpdateProduct;
    } catch (e, s) {
      log('Erro ao editar o produto', error: e, stackTrace: s);
      _status = ProductStateStatus.error;
    }
  }
}
