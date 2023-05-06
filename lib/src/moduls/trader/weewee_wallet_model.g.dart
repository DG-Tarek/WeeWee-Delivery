// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weewee_wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeWeeWallet _$WeeWeeWalletFromJson(Map<String, dynamic> json) => WeeWeeWallet(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String,
      receivedDay: json['receivedDay'] as String,
      confirmed: json['confirmed'] as bool,
      moneyReceiverFullName: json['moneyReceiverFullName'] as String,
      numberOfPackages: json['numberOfPackages'] as int,
      numberOfDeliveredPackages: json['numberOfDeliveredPackages'] as int,
      numberOfReturnedPackages: json['numberOfReturnedPackages'] as int,
      moneyReceived: (json['moneyReceived'] as num).toDouble(),
      deliveryCost: (json['deliveryCost'] as num).toDouble(),
      returnCost: (json['returnCost'] as num).toDouble(),
      packages:
          (json['packages'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WeeWeeWalletToJson(WeeWeeWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'receivedDay': instance.receivedDay,
      'confirmed': instance.confirmed,
      'moneyReceiverFullName': instance.moneyReceiverFullName,
      'moneyReceived': instance.moneyReceived,
      'numberOfDeliveredPackages': instance.numberOfDeliveredPackages,
      'numberOfReturnedPackages': instance.numberOfReturnedPackages,
      'numberOfPackages': instance.numberOfPackages,
      'deliveryCost': instance.deliveryCost,
      'returnCost': instance.returnCost,
      'packages': instance.packages,
    };
