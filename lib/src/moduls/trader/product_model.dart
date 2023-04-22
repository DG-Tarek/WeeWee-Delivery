import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product{
  Product({required this.name,required this.description,required this.price,required this.height,
    required this.width,required this.length,required this.wight,required this.stock,required this.minStock, this.createdAt});
  String name ;
  String description ;
  double price ;
  String height ;
  String width ;
  String length ;
  String wight ;
  int stock ;
  int minStock ;
  String? createdAt ;


  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);



  void subtractFromStock({required int count}){
    if(count>=minStock){
      stock -= count;
    }else{
      debugPrint("Over count !");
    }
  }
  void updateProduct({required String name, required String description, required double price,
    required String height, required String width, required String length}){

     name = name;
     description = description;
     price = price;
     height = height;
     width = width ;
     length = length;
     wight = wight;
  }
  void updateStock({required int stock})=>stock = stock;
}
