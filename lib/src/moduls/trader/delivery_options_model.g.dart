// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryOptions _$DeliveryOptionsFromJson(Map<String, dynamic> json) =>
    DeliveryOptions(
      isFreeDelivery: json['isFreeDelivery'] as bool,
      isFreeProduct: json['isFreeProduct'] as bool,
      deliveryCost: (json['deliveryCost'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
          preferredDeliveryDay: json['preferredDeliveryDate'] as String,
      preferredDeliveryTime: json['preferredDeliveryTime'] as String,
      useAnotherPlace: json['useAnotherPlace'] as bool ,
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
      'isFreeProduct': instance.isFreeProduct,
      'deliveryCost': instance.deliveryCost,
      'totalPrice': instance.totalPrice,
      'preferredDeliveryDate': instance.preferredDeliveryDay,
      'preferredDeliveryTime': instance.preferredDeliveryTime,
      'useAnotherPlace': instance.useAnotherPlace,
      'anotherStoreName': instance.anotherStoreName,
      'anotherPhoneNumber': instance.anotherPhoneNumber,
      'anotherWilaya': instance.anotherWilaya,
      'anotherBaladia': instance.anotherBaladia,
      'anotherAddress': instance.anotherAddress,
      'anotherGeolocation': instance.anotherGeolocation,
    };
