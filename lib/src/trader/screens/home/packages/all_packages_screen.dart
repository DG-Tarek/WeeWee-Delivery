
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/delivered_packages_screen.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/picked_up_packages.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/returned_packages_screen.dart';


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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            DeliveredPackageItem(),
            DeliveredPackageItem(),
            PickedUpPackageItem(),
            ReturnedPackageItem(),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
