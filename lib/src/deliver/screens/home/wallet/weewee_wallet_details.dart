

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit.dart';
import 'package:weewee_delivery/src/deliver/screens/home/packages/package_item.dart';

import '../../../../constant/constant.dart';

class WeeWeeWalletDetailsScreen extends StatelessWidget {
  const WeeWeeWalletDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:  Text("Today, "+DateFormat("MMMM dd y").format(DateTime.now()).toString(),),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: ListView.builder(
                shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                itemCount: DeliverFirebaseCubit().readyPackages.length,
                itemBuilder: (_,index){
                  return Container(
                      padding: index == 0 ? const EdgeInsets.only(top: 20): index == DeliverFirebaseCubit().readyPackages.length - 1 ? const EdgeInsets.only(bottom: 250) : null,
                      child: PackageItem(
                        package: DeliverFirebaseCubit().readyPackages[index],
                      )
                  );

                }),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(36),topRight: Radius.circular(36)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 3,
                  blurRadius: 12,
                  offset: Offset(-2, 2),
                ),
                BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 3,
                  blurRadius: 12,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            //padding: const EdgeInsets.symmetric( vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 28,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [

                          Text("Delivery Packages", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.green.shade300, fontWeight: FontWeight.w400)),
                          const Spacer(),
                         Text( DeliverFirebaseCubit().deliveredPackages.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                        ],),
                      const SizedBox(height: 8,),
                      Row(
                        children: [
                          SizedBox(height: 16,),
                          Text("Returned Packages", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.red.shade300, fontWeight: FontWeight.w400)),
                          const Spacer(),
                          Text( DeliverFirebaseCubit().returnedPackages.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                        ],),
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(height: 16,),
                          Text("Income", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                          const Spacer(),
                         Text( DeliverFirebaseCubit().income.toString(), style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                        ],),
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                GestureDetector(
                  onTap: (){
                    DeliverFirebaseCubit().newWeeWeeWallet();
                  },
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.symmetric( vertical: 20),
                    decoration:  const BoxDecoration(
                      color: Colors.green ,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(36),topLeft: Radius.circular(36)),
                    ),
                    alignment: Alignment.center,
                    child: const Text("Receive Now", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w500),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
