late double height ;
late double width ;

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