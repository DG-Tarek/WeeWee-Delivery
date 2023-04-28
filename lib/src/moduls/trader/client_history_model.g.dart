// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientHistory _$ClientHistoryFromJson(Map<String, dynamic> json) =>
    ClientHistory(
      clientName: json['clientName'] as String,
      saleDate: json['saleDate'] as String,
      quantity: json['quantity'] as String,
      totalPrice: json['totalPrice'] as String,
    );

Map<String, dynamic> _$ClientHistoryToJson(ClientHistory instance) =>
    <String, dynamic>{
      'clientName': instance.clientName,
      'saleDate': instance.saleDate,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
    };
