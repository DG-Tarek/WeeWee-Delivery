
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/all_packages_screen.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/package_details_screen.dart';

import '../../../../constant/constant.dart';
import '../../../provider/trader_firebase_cubit.dart';

class PickUpPackagesScreen extends StatelessWidget {
  const PickUpPackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: Image.asset("assets/icons/pickup.png",color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("Pick Up Packages"),

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
                  child: TraderFirebaseCubit().packagesList[index].packageState == "pickup" ?
                  PackageItem(
                    package: TraderFirebaseCubit().packagesList[index],
                  ): Container()
              ) ;

            }),
      ),
    );
  }
}

