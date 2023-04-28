// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientHistory _$ClientHistoryFromJson(Map<String, dynamic> json) =>
    ClientHistory(
      productName: json['productName'] as String,
      saleDate: json['saleDate'] as String,
      quantity: json['quantity'] as String,
      totalPrice: json['totalPrice'] as String,
      deliveryCost: json['deliveryCost'] as String,
    );

Map<String, dynamic> _$ClientHistoryToJson(ClientHistory instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'saleDate': instance.saleDate,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
      'deliveryCost': instance.deliveryCost,
    };
