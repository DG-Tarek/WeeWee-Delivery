import 'package:json_annotation/json_annotation.dart';

part 'client_history_model.g.dart';

@JsonSerializable()


class ClientHistory{
  ClientHistory({required this.clientName, required this.saleDate, required this.quantity, required this.totalPrice});
  final String clientName;
  final String saleDate;
  final String quantity;
  final String totalPrice;


  factory ClientHistory.fromJson(Map<String, dynamic> json) => _$ClientHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$ClientHistoryToJson(this);

}