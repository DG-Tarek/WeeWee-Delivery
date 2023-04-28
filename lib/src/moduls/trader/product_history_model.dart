import 'package:json_annotation/json_annotation.dart';

part 'product_history_model.g.dart';

@JsonSerializable()

class ProductHistory{
    ProductHistory({required this.clientFullName, required this.clientPhoneNumber, required this.saleDate,
    required this.quantity, required this.totalPrice});
  final String clientFullName;
  final String clientPhoneNumber;
  final String saleDate;
  final String quantity;
  final String totalPrice;

    factory ProductHistory.fromJson(Map<String, dynamic> json) => _$ProductHistoryFromJson(json);
    Map<String, dynamic> toJson() => _$ProductHistoryToJson(this);

}