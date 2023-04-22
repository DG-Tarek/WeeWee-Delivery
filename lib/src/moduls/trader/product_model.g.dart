// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      height: json['height'] as String,
      width: json['width'] as String,
      length: json['length'] as String,
      wight: json['wight'] as String,
      stock: json['stock'] as int,
      minStock: json['minStock'] as int,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'height': instance.height,
      'width': instance.width,
      'length': instance.length,
      'wight': instance.wight,
      'stock': instance.stock,
      'minStock': instance.minStock,
      'createdAt': instance.createdAt,
    };
