import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable()

class Client{
  Client({this.id ,required this.fullName,required this.phoneNumber, this.optionalPhoneNumber,required this.wilaya,required this.baladia, required this.address,this.geolocation, this.createdAt});
  String? id;
  String fullName;
  String phoneNumber;
  String? optionalPhoneNumber;
  String wilaya;
  String baladia;
  String address;
  String? geolocation;
  String? createdAt;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}



