import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable()

class Client{
  Client({required this.name,required this.phoneNumber,required this.optionalPhoneNumber,required this.wilaya,required this.baladia, this.geolocation, this.createdAt});
  String name;
  String phoneNumber;
  String optionalPhoneNumber;
  String wilaya;
  String baladia;
  String? geolocation;
  String? createdAt;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}



