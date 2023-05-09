// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Package _$PackageFromJson(Map<String, dynamic> json) => Package(
      id: json['id'] as String?,
      report: json['report'] as String?,
      packageCreatedAt: json['packageCreatedAt'] as String,
      packageCreatedDay: json['packageCreatedDay'] as String,
      packageState: json['packageState'] as String,
      savedCollection: json['savedCollection'] as String,
      closedPackage: json['closedPackage'] as bool,
      isFreeDelivery: json['isFreeDelivery'] as bool,
      isFreeProduct: json['isFreeProduct'] as bool,
      preferredDeliveryDay: json['preferredDeliveryDay'] as String,
      preferredDeliveryTime: json['preferredDeliveryTime'] as String,
      deliveryCost: (json['deliveryCost'] as num).toDouble(),
      senderId: json['senderId'] as String?,
      senderFullName: json['senderFullName'] as String,
      senderStoreName: json['senderStoreName'] as String,
      senderMobileNumber: json['senderMobileNumber'] as String,
      senderWilaya: json['senderWilaya'] as String,
      senderBaladia: json['senderBaladia'] as String,
      senderAddress: json['senderAddress'] as String,
      senderGeolocation: json['senderGeolocation'] as String,
      senderAnotherStoreName: json['senderAnotherStoreName'] as String,
      senderAnotherPhoneNumber: json['senderAnotherPhoneNumber'] as String,
      senderAnotherWilaia: json['senderAnotherWilaia'] as String,
      senderAnotherBaladia: json['senderAnotherBaladia'] as String,
      senderAnotherAddress: json['senderAnotherAddress'] as String,
      senderAnotherGeolocation: json['senderAnotherGeolocation'] as String,
      clientFullName: json['clientFullName'] as String,
      clientPhoneNumber: json['clientPhoneNumber'] as String,
      clientOptionalPhoneNumber: json['clientOptionalPhoneNumber'] as String?,
      clientWilaya: json['clientWilaya'] as String,
      clientBaladia: json['clientBaladia'] as String,
      clientAddress: json['clientAddress'] as String,
      clientGeolocation: json['clientGeolocation'] as String?,
      productName: json['productName'] as String,
      productDescription: json['productDescription'] as String,
      productHistoryPath: json['productHistoryPath'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productHeight: json['productHeight'] as String,
      productWidth: json['productWidth'] as String,
      productLength: json['productLength'] as String,
      productWeight: json['productWeight'] as String,
      productSelectedFromStock: json['productSelectedFromStock'] as bool,
      productNewStockState: json['productNewStockState'] as String,
      coment: json['coment'] as String,
      drivers:
          (json['drivers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
      'id': instance.id,
      'packageCreatedAt': instance.packageCreatedAt,
      'packageCreatedDay': instance.packageCreatedDay,
      'packageState': instance.packageState,
      'savedCollection': instance.savedCollection,
      'closedPackage': instance.closedPackage,
      'isFreeProduct': instance.isFreeProduct,
      'isFreeDelivery': instance.isFreeDelivery,
      'deliveryCost': instance.deliveryCost,
      'preferredDeliveryDay': instance.preferredDeliveryDay,
      'preferredDeliveryTime': instance.preferredDeliveryTime,
      'senderId': instance.senderId,
      'senderFullName': instance.senderFullName,
      'senderStoreName': instance.senderStoreName,
      'senderMobileNumber': instance.senderMobileNumber,
      'senderWilaya': instance.senderWilaya,
      'senderBaladia': instance.senderBaladia,
      'senderAddress': instance.senderAddress,
      'senderGeolocation': instance.senderGeolocation,
      'senderAnotherStoreName': instance.senderAnotherStoreName,
      'senderAnotherPhoneNumber': instance.senderAnotherPhoneNumber,
      'senderAnotherWilaia': instance.senderAnotherWilaia,
      'senderAnotherBaladia': instance.senderAnotherBaladia,
      'senderAnotherAddress': instance.senderAnotherAddress,
      'senderAnotherGeolocation': instance.senderAnotherGeolocation,
      'clientFullName': instance.clientFullName,
      'clientPhoneNumber': instance.clientPhoneNumber,
      'clientOptionalPhoneNumber': instance.clientOptionalPhoneNumber,
      'clientWilaya': instance.clientWilaya,
      'clientBaladia': instance.clientBaladia,
      'clientAddress': instance.clientAddress,
      'clientGeolocation': instance.clientGeolocation,
      'productName': instance.productName,
      'productDescription': instance.productDescription,
      'productPrice': instance.productPrice,
      'productHistoryPath': instance.productHistoryPath,
      'productHeight': instance.productHeight,
      'productWidth': instance.productWidth,
      'productLength': instance.productLength,
      'productWeight': instance.productWeight,
      'productSelectedFromStock': instance.productSelectedFromStock,
      'productNewStockState': instance.productNewStockState,
      'coment': instance.coment,
      'report': instance.report,
      'drivers': instance.drivers,
    };
