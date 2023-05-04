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
      numberOfDeliveredPackages: json['numberOfDeliveredPackages'] as int,
      numberOfReturnedPackages: json['numberOfReturnedPackages'] as int,
      moneyReceived: (json['moneyReceived'] as num).toDouble(),
      deliveryCost: (json['deliveryCost'] as num).toDouble(),
      returnCost: (json['returnCost'] as num).toDouble(),
    );

Map<String, dynamic> _$WeeWeeWalletToJson(WeeWeeWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'receivedDay': instance.receivedDay,
      'moneyReceiverFullName': instance.moneyReceiverFullName,
      'moneyReceived': instance.moneyReceived,
      'numberOfDeliveredPackages': instance.numberOfDeliveredPackages,
      'numberOfReturnedPackages': instance.numberOfReturnedPackages,
      'deliveryCost': instance.deliveryCost,
      'returnCost': instance.returnCost,
    };
