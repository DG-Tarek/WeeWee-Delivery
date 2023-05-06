
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

import '../../../provider/trader_firebase_cubit.dart';
import '../packages/all_packages_screen.dart';

class WeeWeeWalletDetailsScreen extends StatefulWidget {
  const WeeWeeWalletDetailsScreen({Key? key}) : super(key: key);

  @override
  State<WeeWeeWalletDetailsScreen> createState() => _WeeWeeWalletDetailsScreenState();
}

class _WeeWeeWalletDetailsScreenState extends State<WeeWeeWalletDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
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
                physics: const NeverScrollableScrollPhysics(),
                itemCount: TraderFirebaseCubit().readyPackagesToReceive.length,
                itemBuilder: (_,index){
                  return Container(
                      padding: index == 0 ? const EdgeInsets.only(top: 20):null ,
                      child: PackageItem(
                        package: TraderFirebaseCubit().readyPackagesToReceive[index],
                      )
                  );

                }),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(36)),
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
                const SizedBox(height: 32,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [

                          Text("Delivery Cost", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple.shade300, fontWeight: FontWeight.w400)),
                          const Spacer(),
                          Text( TraderFirebaseCubit().walletDeliveryCost.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                        ],),
                      const SizedBox(height: 6,),
                      Row(
                        children: [
                          SizedBox(height: 16,),
                          Text("Returned Cost", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.red.shade300, fontWeight: FontWeight.w400)),
                          const Spacer(),
                          Text( TraderFirebaseCubit().walletReturnedCost.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                        ],),
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(height: 16,),
                          Text("Income", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                          const Spacer(),
                          Text( TraderFirebaseCubit().incomeMoney.toString(), style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                        ],),
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                GestureDetector(
                  onTap: (){
                    TraderFirebaseCubit().newWeeWeeWallet();
                  },
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.symmetric( vertical: 20),
                    decoration:  const BoxDecoration(
                      color: Colors.green ,
                       borderRadius: BorderRadius.all(Radius.circular(36)),
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
