// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryOptions _$DeliveryOptionsFromJson(Map<String, dynamic> json) =>
    DeliveryOptions(
      isFreeDelivery: json['isFreeDelivery'] as bool,
      preferredDeliveryDate: json['preferredDeliveryDate'] as String,
      preferredDeliveryTime: json['preferredDeliveryTime'] as String,
      deliveryCoast: (json['deliveryCoast'] as num).toDouble(),
      useAnotherPlace: (json['useAnotherPlace'] as num).toDouble(),
      anotherStoreName: json['anotherStoreName'] as String? ?? "",
      anotherPhoneNumber: json['anotherPhoneNumber'] as String? ?? "",
      anotherWilaya: json['anotherWilaya'] as String? ?? "",
      anotherBaladia: json['anotherBaladia'] as String? ?? "",
      anotherAddress: json['anotherAddress'] as String? ?? "",
      anotherGeolocation: json['anotherGeolocation'] as String? ?? "",
    );

Map<String, dynamic> _$DeliveryOptionsToJson(DeliveryOptions instance) =>
    <String, dynamic>{
      'isFreeDelivery': instance.isFreeDelivery,
      'preferredDeliveryDate': instance.preferredDeliveryDate,
      'preferredDeliveryTime': instance.preferredDeliveryTime,
      'deliveryCoast': instance.deliveryCoast,
      'useAnotherPlace': instance.useAnotherPlace,
      'anotherStoreName': instance.anotherStoreName,
      'anotherPhoneNumber': instance.anotherPhoneNumber,
      'anotherWilaya': instance.anotherWilaya,
      'anotherBaladia': instance.anotherBaladia,
      'anotherAddress': instance.anotherAddress,
      'anotherGeolocation': instance.anotherGeolocation,
    };
