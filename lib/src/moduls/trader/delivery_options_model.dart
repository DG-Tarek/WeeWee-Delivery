

import 'package:json_annotation/json_annotation.dart';

part 'delivery_options_model.g.dart';

@JsonSerializable()

class DeliveryOptions{
  DeliveryOptions(
  {
    required this.isFreeDelivery,
    required this.isFreeProduct,
    required this.deliveryCost,
    required this.preferredDeliveryDay,
    required this.preferredDeliveryTime,
    required this.useAnotherPlace,
    required this.coment,
    this.anotherStoreName = "",
    this.anotherPhoneNumber = "",
    this.anotherWilaya = "",
    this.anotherBaladia = "",
    this.anotherAddress = "",
    this.anotherGeolocation = "",
}
      );
  final bool isFreeDelivery;
  final bool isFreeProduct;
  final double deliveryCost;
  final String preferredDeliveryDay;
  final String preferredDeliveryTime;
  final bool useAnotherPlace;
  final String coment;
  String? anotherStoreName;
  String? anotherPhoneNumber;
  String? anotherWilaya;
  String? anotherBaladia;
  String? anotherAddress;
  String? anotherGeolocation;


  factory DeliveryOptions.fromJson(Map<String, dynamic> json) => _$DeliveryOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryOptionsToJson(this);



}