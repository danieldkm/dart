import '../../core/models/orders/order_model.dart';
import '../../dto/order/order_dto.dart';

abstract class GetOrderById {
  Future<OrderDto> call(OrderModel order);
}
