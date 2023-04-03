late double height ;
late double width ;

class Transport{
  const Transport({required this.name, required this.image});
  final String name;
  final String image;
}

List<Transport> TRONSPORTS = const [
Transport(name: "Nothing", image: "assets/icons/walking.png"),
Transport(name: "Bicycle", image: "assets/icons/cycle.png"),
  Transport(name: "Motorbike", image: "assets/icons/motorbiking.png"),
Transport(name: "SUV 4x4", image: "assets/icons/automobile.png"),
Transport(name: "Van", image: "assets/icons/suv.png"),
Transport(name: "Mini Truck", image: "assets/icons/truck1.png"),
Transport(name: "Truck", image: "assets/icons/truck2.png"),
];