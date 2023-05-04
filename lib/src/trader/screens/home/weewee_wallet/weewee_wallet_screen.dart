
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit.dart';

class MyWeeWeeWallet extends StatefulWidget {
  const MyWeeWeeWallet({Key? key}) : super(key: key);

  @override
  State<MyWeeWeeWallet> createState() => _MyWeeWeeWalletState();
}

class _MyWeeWeeWalletState extends State<MyWeeWeeWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: width*.825,
                height: 20,
                alignment: Alignment.bottomCenter,
                decoration:  BoxDecoration(
                    color: Colors.deepPurple.shade300.withOpacity(.9),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32))
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Container(
                  width: width*.9,
                  height: 20,
                  alignment: Alignment.bottomCenter,
                  decoration:  BoxDecoration(
                      color: Colors.deepPurple.shade400,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  width: width,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 22),
                  decoration:  BoxDecoration(
                    color: Colors.deepPurple.shade500,
                    borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24))
                  ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: height *.065,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              GestureDetector(
                                  onTap: ()=>Navigator.of(context).pop(),
                                  child: Icon(CupertinoIcons.back, color: Colors.white, size: 32,)),
                              Text("today, "+DateFormat("MMMM dd").format(DateTime.now()).toString(), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white.withOpacity(.9)),),
                            ],
                          ),),
                        SizedBox(height: height*.045,),
                        Text("Income", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                        const SizedBox(height: 12,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(TraderFirebaseCubit().incomeMoney.toString(), style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 6),
                              child: Text("DZ", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.green ,
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                          ),
                          child: Text("Receive Now", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600),),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          SizedBox(height: 40,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                SizedBox(width: 8,),
                Expanded(
                  child: Container(
                    height: 160,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Delivered\nPackages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.green),),
                            Text(TraderFirebaseCubit().deliveredPackages.toString(), textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 24),),

                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Ready to\nReceive', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.black54),),
                            Text(TraderFirebaseCubit().deliveredPackagesReadyToReceive.toString(), textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: Colors.black54, fontSize: 22),),

                          ],
                        ),],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    height: 160,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Returned\nPackages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.red),),
                            Text(TraderFirebaseCubit().returnedPackages.toString(), textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 24),),

                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Ready to\nReceive', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.black54),),
                            Text(TraderFirebaseCubit().returnedPackagesReadyToReceive.toString(), textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: Colors.black54, fontSize: 22),),

                          ],
                        ),],
                    ),
                  ),
                ),
                SizedBox(width: 8,),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text('My WeeWee Wallet History', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),),
          ),
          const SizedBox(height: 20,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 12),
              child: WalletItem()),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: WalletItem()),
        ],
      ),
    );
  }
}


class WalletItem extends StatelessWidget {
  const WalletItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(24)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(3, 3),
        ),
      ],
    ),
      child: Row(
         children: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text("13" , style: TextStyle(fontSize: 26 , fontWeight: FontWeight.w500),),
             Text("Avril" , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w400),),
           ],
         ),
           Spacer(),
           Text("Kaddour\nhaycha" , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w400, color: Colors.black54),),
           Spacer(),
          Text("22000" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w400),),
          SizedBox(width: 4,),
           Padding(
             padding: const EdgeInsets.only(top: 5.0),
             child: Text("DZ" , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w500),),
           ),

        ],
      ),
    );
  }
}
