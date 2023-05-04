import 'package:json_annotation/json_annotation.dart';

part 'package_model.g.dart';

@JsonSerializable()
class Package{
    Package({
      this.id,
      required this.packageCreatedAt,
      required this.packageCreatedDay,
      required this.packageState,
      required this.savedCollection,

      required this.isFreeDelivery,
      required this.isFreeProduct,
      required this.preferredDeliveryDay,
      required this.preferredDeliveryTime,
      required this.deliveryCost,
       this.senderId,
      required this.senderFullName,
      required this.senderStoreName,
      required this.senderMobileNumber,
      required this.senderWilaya,
      required this.senderBaladia,
      required this.senderAddress,
      required this.senderGeolocation,
      required this.senderAnotherStoreName,
      required this.senderAnotherPhoneNumber,
      required this.senderAnotherWilaia,
      required this.senderAnotherBaladia,
      required this.senderAnotherAddress,
      required this.senderAnotherGeolocation,
      required this.clientFullName,
      required this.clientPhoneNumber,
      required this.clientOptionalPhoneNumber,
      required this.clientWilaya,
      required this.clientBaladia,
      required this.clientAddress,
      required this.clientGeolocation,
      required this.productName,
      required this.productDescription,
      required this.productHistoryPath,
      required this.productPrice,
      required this.productHeight,
      required this.productWidth,
      required this.productLength,
      required this.productWeight,
      required this.productSelectedFromStock,
      required this.productNewStockState,

});

    //////Package///////
  String? id;
  String packageCreatedAt;
  String packageCreatedDay;
  String packageState;
  String savedCollection;
  //////Delivery////////
    bool isFreeProduct;
  bool isFreeDelivery;
  double deliveryCost;
  String preferredDeliveryDay;
  String preferredDeliveryTime;
  /////Sender///////////
    String? senderId ;
  String senderFullName;
  String senderStoreName;
  String senderMobileNumber;
  String senderWilaya;
  String senderBaladia;
  String senderAddress;
  String senderGeolocation;
  ///////SenderAnotherOptions/////
    String senderAnotherStoreName;
    String senderAnotherPhoneNumber;
    String senderAnotherWilaia;
    String senderAnotherBaladia;
    String senderAnotherAddress;
    String senderAnotherGeolocation;
  ////Client///////////
  String clientFullName;
  String clientPhoneNumber;
  String? clientOptionalPhoneNumber;
  String clientWilaya;
  String clientBaladia;
  String clientAddress;
  String? clientGeolocation;
  //////Product////////
  String productName;
  String productDescription;
  double productPrice;
  String productHistoryPath;
  String productHeight;
  String productWidth;
  String productLength;
  String productWeight;
  bool productSelectedFromStock;
  String productNewStockState;

    factory Package.fromJson(Map<String, dynamic> json) => _$PackageFromJson(json);
    Map<String, dynamic> toJson() => _$PackageToJson(this);

}
