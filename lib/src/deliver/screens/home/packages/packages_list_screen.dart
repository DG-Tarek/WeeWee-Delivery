


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit_states.dart';
import 'package:weewee_delivery/src/deliver/screens/home/packages/QRCodeScanner.dart';
import 'package:weewee_delivery/src/deliver/screens/home/packages/package_item.dart';

import '../../../../constant/constant.dart';
import '../../../state_management/deliver/main_cubit/deliver_main_cubit.dart';

class PackagesListScreen extends StatefulWidget {
  const PackagesListScreen({Key? key, required this.state}) : super(key: key);
  final String state;
  @override
  State<PackagesListScreen> createState() => _PackagesListScreenState();
}

class _PackagesListScreenState extends State<PackagesListScreen> {


  @override
  Widget build(BuildContext context) {
    final String stateF = stateFlag();
    final Color stateC = stateColor();
    final String stateT = stateTitle();
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
            const SizedBox(width: 12,),
            Text(stateT),

          ],
        ),
      ),
      body: BlocBuilder(
        bloc: DeliverFirebaseCubit(),
        buildWhen: (previous, current)=> current is ChangePackageStateLoadingState || current is ChangePackageStateSuccessfullyState,
        builder: (context, state) {
        if(state is ChangePackageStateLoadingState){
          return  Center(
            child: LoadingAnimationWidget.discreteCircle(
                color: Colors.deepPurple,
                size: 45,
                secondRingColor: Colors.purple,
                thirdRingColor: Colors.orange),
          );
        }
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: DeliverFirebaseCubit().myPackagesList.length,
                itemBuilder: (_,index){
                  return Container(
                      padding: index == 0 ? const EdgeInsets.only(top: 20):null ,
                      child: DeliverFirebaseCubit().myPackagesList[index].packageState == widget.state || DeliverFirebaseCubit().myPackagesList[index].packageState == widget.state+"+" ?
                      PackageItem(
                        package: DeliverFirebaseCubit().myPackagesList[index],
                      ): null
                  ) ;

                }),
          );
        }
      ),
    );
  }

  String stateFlag() {

    switch(widget.state){
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
    switch(widget.state){
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


  String stateTitle() {
    switch(widget.state){
      case "online":
        return "Online";
      case "pickUp":
        return "To Pick Up";
      case "onRoad":
        return "On Road";
      case "delivered":
        return "Delivered";
      case "delivered+":
        return "Delivered";
      case "returned":
        return "Returned";
      case "returned+":
        return "Returned";
    }
    return "Error";
  }



  Route _createRoute() {
   return PageRouteBuilder(
      pageBuilder: (context, animation,
          secondaryAnimation) =>  QRViewExample(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}


