class ClientModel{
  ClientModel({required this.name,required this.phoneNumber,required this.optionalPhoneNumber,required this.wilaya,required this.baladia, this.geolocation, this.createdAt});
  String name;
  String phoneNumber;
  String optionalPhoneNumber;
  String wilaya;
  String baladia;
  String? geolocation;
  String? createdAt;
}