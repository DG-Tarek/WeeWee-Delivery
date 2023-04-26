import 'package:json_annotation/json_annotation.dart';

part 'new_order_model.g.dart';

@JsonSerializable()
class NewOrder{
  NewOrder({required this.packageId, required this.savedPath, required this.createdAt});
  final String packageId;
  final String savedPath;
  final String createdAt ;

  factory NewOrder.fromJson(Map<String, dynamic> json) => _$NewOrderFromJson(json);
  Map<String, dynamic> toJson() => _$NewOrderToJson(this);


}