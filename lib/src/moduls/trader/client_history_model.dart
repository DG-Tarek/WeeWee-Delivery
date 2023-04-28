import 'package:json_annotation/json_annotation.dart';

part 'client_history_model.g.dart';

@JsonSerializable()


class ClientHistory{
  ClientHistory({required this.productName, required this.saleDate, required this.quantity, required this.totalPrice, required this.deliveryCost});
  final String productName;
  final String saleDate;
  final String quantity;
  final String totalPrice;
  final String deliveryCost;


  factory ClientHistory.fromJson(Map<String, dynamic> json) => _$ClientHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$ClientHistoryToJson(this);

}