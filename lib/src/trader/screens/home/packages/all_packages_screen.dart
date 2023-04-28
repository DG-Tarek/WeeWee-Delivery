
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/package_details_screen.dart';
import 'package:weewee_delivery/src/trader/screens/home/stock/stock_screen.dart';

import '../../../../constant/constant.dart';
import '../../../../moduls/shared/package_model.dart';
import '../../../provider/trader_firebase_cubit.dart';
import '../../../provider/trader_firebase_cubit_states.dart';


class AllPackagesScreen extends StatelessWidget {
  const AllPackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: Image.asset("assets/icons/packages.png",color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("All Packages"),

          ],
        ),
      ),
      body: BlocBuilder<TraderFirebaseCubit, TraderFirebaseCubitState>(
          bloc: TraderFirebaseCubit(),
          buildWhen: (previous, current)=> current is GetPackagesLoadingState || current is GetPackagesSuccessfullyState,
          builder: (_, state) {
            if( state is GetPackagesLoadingState){
              return Center(
                child: LoadingAnimationWidget.discreteCircle(
                    color: Colors.deepPurple,
                    size: 45,
                    secondRingColor: Colors.purple,
                    thirdRingColor: Colors.orange),
              );
            }
            return SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: TraderFirebaseCubit().packagesList.length,
                  itemBuilder: (_,index){
                    return Container(
                        padding: index == 0 ? const EdgeInsets.only(top: 20):null ,
                        child: PackageItem(
                          package: TraderFirebaseCubit().packagesList[index],
                        )
                    );

                  }),
            );
          }
      ),

    );
  }
}


class PackageItem extends StatelessWidget {
  const PackageItem({Key? key, required this.package}) : super(key: key);
  final Package package;

  @override
  Widget build(BuildContext context) {
    final String stateF = stateFlag();
    final Color stateC = stateColor();
    final color = COLORS[Random().nextInt(COLORS.length)];
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 12),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(_createRoute()),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16),
              child: Container(
                padding: EdgeInsets.only(left: 3),
                decoration: BoxDecoration(
                  color: color,
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
                      SizedBox(
                          width: width - 135,
                          child: Text(package.productName, style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.35),)),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Text("324W-434243", style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),),
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(CupertinoIcons.person, color: stateC,),
                          const SizedBox(width: 8,),
                           Text(package.senderFullName,
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
                          const SizedBox(width: 3,),
                          SizedBox(
                            width: 19,
                            height: 22.5,
                            child: Image.asset(
                              "assets/icons/phone.png", color: stateC,),),
                          const SizedBox(width: 10,),
                          Text("0556784365",
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
                          Text("Blida, Blida",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54
                            ),)
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Price", style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.red),),
                          const SizedBox(width: 12,),
                          Text("3200", style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),),
                          const SizedBox(width: 4,),
                          Text("DZ", style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),),
                        ],
                      ),


                    ],
                  ),

                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 6,
              height: 60,
              width: 60,
              child: Container(
                  padding: EdgeInsets.only(top: 6, left: 8, bottom: 6),
                  decoration: BoxDecoration(
                    color: stateC,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(-2, 2),
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
            )
          ],
        ),
      ),

    );
  }

  String stateFlag() {
    if (package.packageState == "pickedup") {
      return "assets/icons/approved.png";
    } else if (
    package.packageState == "deliverd"
    ) {
      return "assets/icons/pickedup.png";
    } else {
      return "assets/icons/returned.png";
    }
  }

  Color stateColor() {
    if (package.packageState == "pickedup") {
      return Colors.teal;
    } else if (
    package.packageState == "deliverd"
    ) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }


  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation,
          secondaryAnimation) => const PackageDetailsScreen(),
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
