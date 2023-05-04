import '../shared/package_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'weewee_wallet_model.g.dart';

@JsonSerializable()
class WeeWeeWallet{
  WeeWeeWallet({this.id, required this.createdAt, required this.receivedDay,
  required this.moneyReceiverFullName,
  required this.numberOfDeliveredPackages,
  required this.numberOfReturnedPackages,
    required this.moneyReceived ,
    required this.deliveryCost,
    required this.returnCost,

  });
  String? id;
  final String createdAt;
  final String receivedDay;
  final String moneyReceiverFullName;
  final double moneyReceived;

  final int numberOfDeliveredPackages;
  final int numberOfReturnedPackages;


  final double deliveryCost;
  final double returnCost;

  factory WeeWeeWallet.fromJson(Map<String, dynamic> json) => _$WeeWeeWalletFromJson(json);
  Map<String, dynamic> toJson() => _$WeeWeeWalletToJson(this);

}