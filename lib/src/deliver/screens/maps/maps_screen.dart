


import 'package:circular_menu/circular_menu.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../moduls/shared/package_model.dart';
import '../../state_management/deliver/main_cubit/deliver_main_cubit.dart';
import '../packages/package_details_screen.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {

  final _animatedDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
        height: 120,
      width: width,
      color: Colors.deepPurple,
      alignment: Alignment.bottomCenter,
      child: DropdownButtonFormField2(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent,width: 0),
            borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      isExpanded: true,
      hint:  Text(
        DeliverMainCubit().selectedTypeOfPackages,
      style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      items:  DeliverMainCubit().typesOfPackages
            .map((item) =>
              DropdownMenuItem<String>(
              value: item,
              child: Text(
              item,
              style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: item == DeliverMainCubit().selectedTypeOfPackages ? Colors.white: Colors.deepPurple
              ),
              ),
              ))
            .toList(),
      onChanged: (value) {
        setState(() {
          DeliverMainCubit().changeSelectedTypeOfPackages(value);
        });
      },
      buttonStyleData: const ButtonStyleData(
      height: 60,
      padding: EdgeInsets.only(right: 10),
      ),
      iconStyleData: const IconStyleData(
      icon: Icon(
      Icons.arrow_drop_down_outlined,
      color: Colors.white,
      ),
      iconSize: 26,
      ),
      dropdownStyleData: DropdownStyleData(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      ),
      ),
      )
      ),
          ),
          Text("Google Maps"),
          Positioned(
            height: 80,
              width: 80,
              right: 15,
              top: 135,
              child:  CircularMenu(
                toggleButtonSize: 30,
                 toggleButtonBoxShadow:  [
              BoxShadow(
              color: Colors.grey.shade300,
                spreadRadius: 8,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
              ],
                 alignment: Alignment.topRight,
                curve: Curves.fastOutSlowIn,
                  reverseCurve: Curves.fastOutSlowIn,
                  items: [
                    CircularMenuItem(
                        icon: Icons.gps_fixed_sharp,
                        onTap: () {
                      // callback
                    }),
                    CircularMenuItem(
                        icon: Icons.search,
                        onTap: () {
                      //callback
                    }),
                    CircularMenuItem(
                        icon: Icons.gps_fixed_sharp,
                        onTap: () {
                      //callback
                    }),

        ])),
          Positioned(
              left: 15,
              top: 145,
              child:
              !DeliverMainCubit().selectedPackage ?
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.deepPurple, width: 1),
                  shape: BoxShape.circle,
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 5,
                      blurRadius: 3,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text("999", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.deepPurple, fontSize: 17),),
              )
              :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:   ()=>Navigator.of(context).push(_createRoute()),
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.green, width: 1),
                            shape: BoxShape.circle,
                            boxShadow:  [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                spreadRadius: 5,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(8),
                          child: Image.asset("assets/icons/packagelogo.png"),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.green, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Text("424Q-22454", style: TextStyle(fontWeight: FontWeight.w500),)),
                      SizedBox(height: 8,),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.green, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Text("Alger, Mohammadia")),
                      SizedBox(height: 8,),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.green, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Text("Blida, Blida")),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                         setState(() {
                           DeliverMainCubit().setSelectedPackage();
                         });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          decoration: BoxDecoration(
                              color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 5,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                            ),
                            ],
                          ),
                          child: Icon(Icons.close, color: Colors.white,size: 22,),
                        ),
                      )

                    ],
                  )
            )

        ],
      ),
    );
  }

  Route _createRoute() {
    final Package package = Package(packageCreatedAt: "packageCreatedAt", packageCreatedDay: "packageCreatedDay", packageState: "returned+", savedCollection: "savedCollection", closedPackage: false, isFreeDelivery: true,
        isFreeProduct: false, preferredDeliveryDay: "preferredDeliveryDay", preferredDeliveryTime: "preferredDeliveryTime", deliveryCost: 1, senderFullName: "senderFullName", senderStoreName: "senderStoreName", senderMobileNumber: "senderMobileNumber", senderWilaya: "senderWilaya",
        senderBaladia: "senderBaladia", senderAddress: "senderAddress", senderGeolocation: "senderGeolocation", senderAnotherStoreName: "senderAnotherStoreName", senderAnotherPhoneNumber: "senderAnotherPhoneNumber", senderAnotherWilaia: "senderAnotherWilaia", senderAnotherBaladia: "senderAnotherBaladia", senderAnotherAddress: "senderAnotherAddress", senderAnotherGeolocation: "senderAnotherGeolocation",
        clientFullName: "clientFullName", clientPhoneNumber: "clientPhoneNumber", clientOptionalPhoneNumber: "clientOptionalPhoneNumber", clientWilaya: "clientWilaya", drivers: [], clientBaladia: "clientBaladia", clientAddress: "clientAddress", clientGeolocation: "clientGeolocation", productName: "productName", productDescription: "productDescription", productHistoryPath: "productHistoryPath", productPrice: 5, productHeight: "productHeight", productWidth: "productWidth", productLength: "productLength", productWeight: "productWeight", productSelectedFromStock: true, productNewStockState: "productNewStockState", coment: "");

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  PackageDetailsScreen(package: package),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
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
