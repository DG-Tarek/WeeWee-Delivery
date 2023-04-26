// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewOrder _$NewOrderFromJson(Map<String, dynamic> json) => NewOrder(
      packageId: json['packageId'] as String,
      savedPath: json['savedPath'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$NewOrderToJson(NewOrder instance) => <String, dynamic>{
      'packageId': instance.packageId,
      'savedPath': instance.savedPath,
      'createdAt': instance.createdAt,
    };
