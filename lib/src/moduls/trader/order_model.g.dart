// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      packageId: json['packageId'] as String,
      savedPath: json['savedPath'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'packageId': instance.packageId,
      'savedPath': instance.savedPath,
      'createdAt': instance.createdAt,
    };
