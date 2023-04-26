

import 'package:json_annotation/json_annotation.dart';

part 'delivery_options_model.g.dart';

@JsonSerializable()

class DeliveryOptions{
  DeliveryOptions(
  {
    required this.isFreeDelivery,
    required this.preferredDeliveryDate,
    required this.preferredDeliveryTime,
    required this.deliveryCoast,
    required this.useAnotherPlace,
    this.anotherStoreName = "",
    this.anotherPhoneNumber = "",
    this.anotherWilaya = "",
    this.anotherBaladia = "",
    this.anotherAddress = "",
    this.anotherGeolocation = "",
}
      );
  final bool isFreeDelivery;
  final String preferredDeliveryDate;
  final String preferredDeliveryTime;
  final double deliveryCoast;
  final double useAnotherPlace;
  String? anotherStoreName;
  String? anotherPhoneNumber;
  String? anotherWilaya;
  String? anotherBaladia;
  String? anotherAddress;
  String? anotherGeolocation;


  factory DeliveryOptions.fromJson(Map<String, dynamic> json) => _$DeliveryOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryOptionsToJson(this);



}