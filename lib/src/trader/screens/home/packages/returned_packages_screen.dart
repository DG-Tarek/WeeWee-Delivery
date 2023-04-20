
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/package_details_screen.dart';

import '../../../../constant/constant.dart';

class ReturnedPackagesScreen extends StatelessWidget {
  const ReturnedPackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: Image.asset("assets/icons/returned.png",color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("Returned Packages"),

          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          ReturnedPackageItem(),
          ReturnedPackageItem(),
        ],
      ),
    );
  }
}

class ReturnedPackageItem extends StatelessWidget {
  const ReturnedPackageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =  COLORS[Random().nextInt(COLORS.length)];
    return  Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 12),
      child: GestureDetector(
        onTap: ()=>Navigator.of(context).push(_createRoute()),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16),
              child: Container(
                padding: EdgeInsets.only(left: 6),
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
                  padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: width - 135,
                          child: Text("Cle multifunction" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w400 , height: 1.35),)),
                      const  SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Text("324W-434243" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.w400 , color: Colors.black54),),
                      ),
                      const  SizedBox(height: 16,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:  [
                          Icon(CupertinoIcons.person , color: Colors.red,),
                          const SizedBox(width: 8,),
                          const Text("Kaddour Zen" ,
                            style:  TextStyle(
                                fontSize: 16,
                                color: Colors.black54
                            ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:   [
                          const SizedBox(width: 3,),
                          SizedBox(
                            width: 19,
                            height: 22.5,
                            child: Image.asset("assets/icons/phone.png", color: Colors.red,),),
                          const SizedBox(width: 10,),
                          Text("0556784365",
                            style:  TextStyle(
                                fontSize: 16,
                                color: Colors.black54
                            ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:   [
                          SizedBox(
                            width: 22.5,
                            height: 22.5,
                            child: Image.asset("assets/icons/location.png", color: Colors.red,),),
                          const SizedBox(width: 10,),
                          Text("Blida, Blida",
                            style:  TextStyle(
                                fontSize: 16,
                                color: Colors.black54
                            ),)
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Price" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.red),),
                          const SizedBox(width: 12,),
                          Text("3200" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),),
                          const SizedBox(width: 4,),
                          Text("DZ" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
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
              child:  Container(
                  padding: EdgeInsets.only(top: 6,left: 8,bottom: 6),
                  decoration: BoxDecoration(
                    color: Colors.red,
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
                  child: Image.asset("assets/icons/returned.png" , color: Colors.white,)),
            )],
        ),
      ),

    );
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
