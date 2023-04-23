// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      optionalPhoneNumber: json['optionalPhoneNumber'] as String?,
      wilaya: json['wilaya'] as String,
      baladia: json['baladia'] as String,
      geolocation: json['geolocation'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'optionalPhoneNumber': instance.optionalPhoneNumber,
      'wilaya': instance.wilaya,
      'baladia': instance.baladia,
      'geolocation': instance.geolocation,
      'createdAt': instance.createdAt,
    };
