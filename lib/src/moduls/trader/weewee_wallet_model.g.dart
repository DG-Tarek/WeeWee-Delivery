// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weewee_wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeWeeWallet _$WeeWeeWalletFromJson(Map<String, dynamic> json) => WeeWeeWallet(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String,
      receivedDay: json['receivedDay'] as String,
      moneyReceiverFullName: json['moneyReceiverFullName'] as String,
      numberOfDeliveredPackages:
          (json['numberOfDeliveredPackages'] as num).toDouble(),
      numberOfReturnedPackages:
          (json['numberOfReturnedPackages'] as num).toDouble(),
      moneyReceivedFromDeliveredPackages:
          (json['moneyReceivedFromDeliveredPackages'] as num).toDouble(),
      deliveryCost: (json['deliveryCost'] as num).toDouble(),
      returnCost: (json['returnCost'] as num).toDouble(),
      netMoney: (json['netMoney'] as num).toDouble(),
    )..packages = (json['packages'] as List<dynamic>?)
        ?.map((e) => Package.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$WeeWeeWalletToJson(WeeWeeWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'receivedDay': instance.receivedDay,
      'moneyReceiverFullName': instance.moneyReceiverFullName,
      'numberOfDeliveredPackages': instance.numberOfDeliveredPackages,
      'numberOfReturnedPackages': instance.numberOfReturnedPackages,
      'moneyReceivedFromDeliveredPackages':
          instance.moneyReceivedFromDeliveredPackages,
      'deliveryCost': instance.deliveryCost,
      'returnCost': instance.returnCost,
      'netMoney': instance.netMoney,
      'packages': instance.packages,
    };
