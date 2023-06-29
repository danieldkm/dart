// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../core/models/orders/order_model.dart';
import '../../core/models/orders/order_status.dart';
import '../../dto/order/order_dto.dart';
import '../../repositories/orders/order_repository.dart';
import '../../services/order/get_order_by_id.dart';

part 'order_controller.g.dart';

enum OrderStateStatus {
  initial,
  loading,
  loaded,
  error,
  showDetailModal,
  statusChanged,
}

class OrderController = OrderControllerBase with _$OrderController;

abstract class OrderControllerBase with Store {
  final OrderRepository _orderRepository;
  final GetOrderById _getOrderById;

  @readonly
  var _status = OrderStateStatus.initial;

  late final DateTime _today;

  @readonly
  OrderStatus? _statusFilter;

  @readonly
  var _orders = <OrderModel>[];

  @readonly
  String? _errorMessage;

  @readonly
  OrderDto? _orderSelected;

  OrderControllerBase(
    this._orderRepository,
    this._getOrderById,
  ) {
    final todayNow = DateTime.now();
    // 06/2023 não é possível criar datetime sem time de outro jeito
    _today = DateTime(todayNow.year, todayNow.month, todayNow.day);
  }

  @action
  void changeStatusFilter(OrderStatus? status) {
    _statusFilter = status;
    findOrders();
  }

  @action
  Future<void> findOrders() async {
    try {
      _status = OrderStateStatus.loading;
      _orders = await _orderRepository.findAllOrders(_today, _statusFilter);
      _status = OrderStateStatus.loaded;
    } catch (e, s) {
      log(
        'Erro ao buscar pedidos do dia',
        error: e,
        stackTrace: s,
      );
      _status = OrderStateStatus.error;
      _errorMessage = 'Erro ao buscar pedidos do dia';
    }
  }

  @action
  Future<void> showDetailModal(OrderModel model) async {
    try {
      _status = OrderStateStatus.loading;
      // await Future.delayed(Duration.zero);
      _orderSelected = await _getOrderById(model);
      _status = OrderStateStatus.showDetailModal;
    } catch (e, s) {
      log(
        'Erro ao exibir a modal',
        error: e,
        stackTrace: s,
      );
      _status = OrderStateStatus.error;
      _errorMessage = 'Erro ao exibir a modal';
    }
  }

  @action
  Future<void> changeStatus(OrderStatus status) async {
    _status = OrderStateStatus.loading;
    await _orderRepository.changeStatus(_orderSelected!.id, status);
    _status = OrderStateStatus.statusChanged;
  }
}
