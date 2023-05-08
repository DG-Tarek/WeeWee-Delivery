
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/deliver/screens/packages/package_details_screen.dart';
import 'package:weewee_delivery/src/moduls/shared/package_model.dart';

import '../../../constant/constant.dart';
import '../../state_management/deliver/main_cubit/deliver_main_cubit.dart';

class PackageItem extends StatelessWidget {
   PackageItem({Key? key}) : super(key: key);

  final Package package = Package(packageCreatedAt: "packageCreatedAt", packageCreatedDay: "packageCreatedDay", packageState: "onroad", savedCollection: "savedCollection", closedPackage: false, isFreeDelivery: false,
      isFreeProduct: false, preferredDeliveryDay: "preferredDeliveryDay", preferredDeliveryTime: "preferredDeliveryTime", deliveryCost: 1, senderFullName: "senderFullName", senderStoreName: "senderStoreName", senderMobileNumber: "senderMobileNumber", senderWilaya: "senderWilaya",
      senderBaladia: "senderBaladia", senderAddress: "senderAddress", senderGeolocation: "senderGeolocation", senderAnotherStoreName: "senderAnotherStoreName", senderAnotherPhoneNumber: "senderAnotherPhoneNumber", senderAnotherWilaia: "senderAnotherWilaia", senderAnotherBaladia: "senderAnotherBaladia", senderAnotherAddress: "senderAnotherAddress", senderAnotherGeolocation: "senderAnotherGeolocation",
      clientFullName: "clientFullName", clientPhoneNumber: "clientPhoneNumber", clientOptionalPhoneNumber: "clientOptionalPhoneNumber", clientWilaya: "clientWilaya", clientBaladia: "clientBaladia", clientAddress: "clientAddress", clientGeolocation: "clientGeolocation", productName: "productName", productDescription: "productDescription", productHistoryPath: "productHistoryPath", productPrice: 5, productHeight: "productHeight", productWidth: "productWidth", productLength: "productLength", productWeight: "productWeight", productSelectedFromStock: true, productNewStockState: "productNewStockState", coment: "coment");

  @override
  Widget build(BuildContext context) {
    final String stateF = stateFlag();
    final Color stateC = stateColor();
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(_createRoute()),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 16,bottom: 16),
              child: Container(
                padding: const EdgeInsets.only(left: 3,),
                decoration: BoxDecoration(
                  color: stateC,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("id", style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),),
                      const SizedBox(height: 8,),
                      SizedBox(
                          width: width - 100,
                          child: Text(package.productName, style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.35),)),
                      const SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 22.5,
                            height: 22.5,
                            child: Image.asset("assets/icons/package.png",),),
                          const SizedBox(width: 8,),
                          Text(package.clientFullName,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54
                            ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 22.5,
                            height: 22.5,
                            child: Image.asset("assets/icons/location.png",
                              color: stateC,),),
                          const SizedBox(width: 10,),
                          Text(package.clientWilaya + ", "+package.clientBaladia,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),)
                        ],
                      ),
                      SizedBox(height: 30,),
                      package.packageState == "returned+" || package.packageState == "returned"?
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Price", style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: stateC),),
                          const SizedBox(width: 12,),
                          Text(package.productPrice.toString(), style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black87),),
                          if (package.packageState == "returned+" || package.packageState == "returned")...[
                            const SizedBox(width: 8,),
                            Text("0.0", style: Theme
                                .of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),),
                          ],
                          const SizedBox(width: 4,),
                          Text("DZ", style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),),
                          const Spacer(),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              "assets/icons/delivery-truck-return.png", color: Colors.red,),),
                          const SizedBox(width: 8,),
                          Text("150.0", style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),),
                          const SizedBox(width: 4,),
                          Text("DZ", style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),),
                        ],
                      ):
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Price", style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: stateC),),

                          const Spacer(),
                          Text( (package.deliveryCost+package.productPrice).toString(), style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),),
                          const SizedBox(width: 8,),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("DZ", style: Theme
                                .of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),),
                          ),

                        ],
                      ),


                    ],
                  ),

                ),

              ),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(package.packageState == "delivered+" || package.packageState == "returned+")
                    Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.only(top: 12, left: 8 ,right: 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(-1, 2),
                            ),
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          "assets/icons/logo.png", color: Colors.deepPurple,)),

                  const SizedBox(width: 15,),
                  Column(
                    children: [
                      Container(
                          height: 60,
                          width: 60,
                          padding: package.packageState != "onroad" ?  const EdgeInsets.only(top: 6, left: 8, bottom: 6) : const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: stateC,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(-1, 2),
                              ),
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            stateF, color: Colors.white,)),
                      if(package.isFreeDelivery)...[
                        const SizedBox(height: 12,),
                        Container(
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(-1, 2),
                                ),
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text("FREE" ,textAlign: TextAlign.center, style:  TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                                Text("Delivery" ,textAlign: TextAlign.center, style:  TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),),
                                SizedBox(height: 2,)
                              ],
                            )),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            if(package.closedPackage)
              Positioned(
                top: 47.5,
                right: 77.5,
                child: Container(
                    height: 65,
                    width: 65,
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      "assets/icons/closed.png",)),
              ),

          ],
        ),
      ),

    );
  }

  String stateFlag() {

    switch(package.packageState){
      case "online":
        return "assets/icons/online.png";
      case "onhold":
        return "assets/icons/online.png";
      case "pickup":
        return "assets/icons/pickup.png";
      case "onroad":
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
    switch(package.packageState){
      case "online":
        return Colors.purple;
      case "onhold":
        return Colors.purple;
      case "pickedup":
        return Colors.blue;
      case "onroad":
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

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const PackageDetailsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );}

}

