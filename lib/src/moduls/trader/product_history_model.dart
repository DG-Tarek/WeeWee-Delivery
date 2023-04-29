import 'package:json_annotation/json_annotation.dart';

part 'product_history_model.g.dart';

@JsonSerializable()

class ProductHistory{
    ProductHistory({required this.clientFullName, required this.clientPhoneNumber,required this.clientOptionalPhoneNumber,required this.state,required this.saleDate,
    required this.quantity, required this.totalPrice, required this.stockState});

      final String clientFullName;
      final String clientPhoneNumber;
      final String clientOptionalPhoneNumber;
      final String state;
      final String saleDate;
      final int quantity;
      final double totalPrice;
      final String stockState;

    factory ProductHistory.fromJson(Map<String, dynamic> json) => _$ProductHistoryFromJson(json);
    Map<String, dynamic> toJson() => _$ProductHistoryToJson(this);

}