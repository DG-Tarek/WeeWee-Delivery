
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/all_packages_screen.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/package_details_screen.dart';

import '../../../../constant/constant.dart';
import '../../../provider/trader_firebase_cubit.dart';

class SpecialPackagesScreen extends StatelessWidget {
  const SpecialPackagesScreen({Key? key, required this.state}) : super(key: key);
  final String state;
  @override
  Widget build(BuildContext context) {
    final String stateF = stateFlag();
    final Color stateC = stateColor();
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: stateC,
        title: Row(
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: Image.asset(stateF,color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("Returned Packages"),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: TraderFirebaseCubit().packagesList.length,
            itemBuilder: (_,index){
              return Container(
                  padding: index == 0 ? const EdgeInsets.only(top: 20):null ,
                  child: TraderFirebaseCubit().packagesList[index].packageState == state || TraderFirebaseCubit().packagesList[index].packageState == state+"+" ?
                  PackageItem(
                    package: TraderFirebaseCubit().packagesList[index],
                  ): Container()
              ) ;

            }),
      ),
    );
  }

  String stateFlag() {

    switch(state){
      case "online":
        return "assets/icons/online.png";
      case "pickUp":
        return "assets/icons/pickup.png";
      case "onRoad":
        return "assets/icons/inroad.png";
      case "delivered":
        return "assets/icons/approved.png";
      case "delivered+":
        return "assets/icons/approved.png";
      case "returned":
        return "assets/icons/returned.png";
      case "returned+":
        return "assets/icons/returned.png";

    }
    return " error";
  }

  Color stateColor() {
    switch(state){
      case "online":
        return Colors.purple;
      case "pickUp":
        return Colors.blue;
      case "onRoad":
        return Colors.teal;
      case "delivered":
        return Colors.green;
      case "delivered+":
        return Colors.green;
      case "returned":
        return Colors.red;
      case "returned+":
        return Colors.red;
    }
    return Colors.black;
  }
}
