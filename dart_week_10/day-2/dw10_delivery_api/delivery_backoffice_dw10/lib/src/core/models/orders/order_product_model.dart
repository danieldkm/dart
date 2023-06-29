import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderProductModel {
  final int productId;
  final int amount;
  final double totalPrice;
  OrderProductModel({
    required this.productId,
    required this.amount,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': productId,
      'amount': amount,
      'total_price': totalPrice,
    };
  }

  factory OrderProductModel.fromMap(Map<String, dynamic> map) {
    return OrderProductModel(
      productId: map['id'] as int,
      amount: map['amount'] as int,
      totalPrice: map['total_price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderProductModel.fromJson(String source) =>
      OrderProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
