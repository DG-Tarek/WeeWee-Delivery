


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

class PickUpPackagesScreen extends StatefulWidget {
  const PickUpPackagesScreen({Key? key }) : super(key: key);

  @override
  State<PickUpPackagesScreen> createState() => _PickUpPackagesScreenState();
}

class _PickUpPackagesScreenState extends State<PickUpPackagesScreen> {


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
            const SizedBox(width: 12,),
            Text("To Pick Up Packages"),

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
            return DeliverFirebaseCubit().pickUpPackages > 0 ?
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(_createRoute());
                        },
                        child: Container(
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.blue ,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(3, 3),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Scan', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26,fontWeight: FontWeight.w400, color: Colors.white),),
                                    const SizedBox(height: 3,),
                                    Text(DeliverFirebaseCubit().pickUpPackages.toString() + " Packages", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
                                  ],
                                ),
                              ),

                              Icon(CupertinoIcons.qrcode, size: 52,color: Colors.white,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: DeliverFirebaseCubit().myPackagesList.length,
                        itemBuilder: (_,index){
                          return Container(
                              padding: index == 0 ? const EdgeInsets.only(top: 20):null ,
                              child:  DeliverFirebaseCubit().myPackagesList[index].packageState == "pickUp"?
                              PackageItem(
                                package: DeliverFirebaseCubit().myPackagesList[index],
                              ): Container());

                        }),
                  ],
                ):
                    Center(
                      child: Text(
                        "Fuck !"
                      ),
                    )
             ;
          }
      ),
    );
  }

  String stateFlag() {


        return "assets/icons/pickup.png";

  }

  Color stateColor() {

        return Colors.blue;
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


