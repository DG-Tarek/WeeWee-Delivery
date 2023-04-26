import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class Order{
  Order({required this.packageId, required this.savedPath, required this.createdAt});
  final String packageId;
  final String savedPath;
  final String createdAt ;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);


}