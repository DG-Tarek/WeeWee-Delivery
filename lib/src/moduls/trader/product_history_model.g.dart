// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductHistory _$ProductHistoryFromJson(Map<String, dynamic> json) =>
    ProductHistory(
      clientFullName: json['clientFullName'] as String,
      clientPhoneNumber: json['clientPhoneNumber'] as String,
      saleDate: json['saleDate'] as String,
      quantity: json['quantity'] as String,
      totalPrice: json['totalPrice'] as String,
    );

Map<String, dynamic> _$ProductHistoryToJson(ProductHistory instance) =>
    <String, dynamic>{
      'clientFullName': instance.clientFullName,
      'clientPhoneNumber': instance.clientPhoneNumber,
      'saleDate': instance.saleDate,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
    };
