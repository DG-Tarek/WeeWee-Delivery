import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable()

class Client{
  Client({required this.fullName,required this.phoneNumber, this.optionalPhoneNumber,required this.wilaya,required this.baladia, this.geolocation, this.createdAt});
  String fullName;
  String phoneNumber;
  String? optionalPhoneNumber;
  String wilaya;
  String baladia;
  String? geolocation;
  String? createdAt;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}



