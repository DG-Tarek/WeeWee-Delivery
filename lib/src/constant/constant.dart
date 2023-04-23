import 'package:flutter/material.dart';

late double height ;
late double width ;

String createdTime()=> DateTime.now().toString();

class Transport{
  const Transport({required this.name, required this.image});
  final String name;
  final String image;
}

List<Transport> TRONSPORTS = const [
Transport(name: "nothing", image: ""),
Transport(name: "bicycle", image: "assets/icons/cycle.png"),
  Transport(name: "motorbike", image: "assets/icons/motorbiking.png"),
Transport(name: "suv 4x4", image: "assets/icons/automobile.png"),
Transport(name: "van", image: "assets/icons/suv.png"),
Transport(name: "mini truck", image: "assets/icons/truck1.png"),
Transport(name: "truck", image: "assets/icons/truck2.png"),
];

final List<Color> COLORS = [Colors.deepPurple,Colors.blue,Colors.teal,Colors.deepOrange,Colors.pink,
Colors.purpleAccent, Colors.red, Colors.brown
];

final List<String>  PRODUCT_WEIGHT = ["< 1 KG","1 - 5 KG","5 - 10 KG","10 - 15 KG", "15 - 20 KG", "> 20 KG" ];
final List<String>  PRODUCT_DIMENSIONS = ["< 10 CM","10 - 30 CM","30 - 50 CM","> 50 CM"];
final List<String>  WILAYA = ["18 - Jijel", "16 - Alger", "66 - Teemzawatin"];
final List<String>  PICKEDUPTIME = ["Any Time", "Morning ( 09:00 - 13:00 )", "Noon ( 13:00 - 17:00 )","Evening ( 17:00 - 22:00 )"];


