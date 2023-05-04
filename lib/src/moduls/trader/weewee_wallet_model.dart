import '../shared/package_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'weewee_wallet_model.g.dart';

@JsonSerializable()
class WeeWeeWallet{
  WeeWeeWallet({this.id, required this.createdAt, required this.receivedDay,
  required this.moneyReceiverFullName,
  required this.numberOfDeliveredPackages,
  required this.numberOfReturnedPackages,
    required this.moneyReceivedFromDeliveredPackages,
    required this.deliveryCost,
    required this.returnCost,
    required this.netMoney,
  });
  String? id;
  final String createdAt;
  final String receivedDay;
  final String moneyReceiverFullName;

  final double numberOfDeliveredPackages;
  final double numberOfReturnedPackages;

  final double moneyReceivedFromDeliveredPackages;
  final double deliveryCost;
  final double returnCost;
  final double netMoney ;
  List<Package>? packages;

}