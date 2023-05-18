
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit_states.dart';
import 'package:weewee_delivery/src/deliver/screens/home/wallet/weewee_wallet_details.dart';
import 'package:weewee_delivery/src/deliver/screens/home/wallet/weewee_wallet_history.dart';

import '../../../../constant/constant.dart';
import '../../../../moduls/deliver/weewee_wallet_model.dart';

class MyWeeWeeWallet extends StatelessWidget {
  const MyWeeWeeWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
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
                             Text(DeliverFirebaseCubit().income.toString(), style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, left: 6),
                                child: Text("DZ", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40,),
                          GestureDetector(
                            onTap: (){
                              //TraderFirebaseCubit().newWeeWeeWallet();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WeeWeeWalletDetailsScreen(),) //WeeWeeWalletDetailsScreen() ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                              decoration: const BoxDecoration(
                                color: Colors.green ,
                                borderRadius: BorderRadius.all(Radius.circular(32)),
                              ),
                              child: Text("Check Now", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600),),
                            ),
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
                  const SizedBox(width: 8,),
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
                          Text('Delivered\nPackages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.green),),

                          Spacer(),
                      Text(DeliverFirebaseCubit().deliveredPackages.toString(), textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: Colors.black54),),
                      ],
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
                          Text('Returned\nPackages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.red),),

                          Spacer(),
                      Text(DeliverFirebaseCubit().returnedPackages.toString(), textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: Colors.black54),),
                      ],
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
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: BlocBuilder<DeliverFirebaseCubit, DeliverFirebaseCubitState>(
                  bloc: DeliverFirebaseCubit(),
                  buildWhen: (previous, current)=> current is GetWeeWeeWalletLoadingState || current is GetWeeWeeWalletSuccessfullyState,
                  builder: (_, state) {
                    if( state is GetWeeWeeWalletLoadingState){
                      return Container(
                        padding: const EdgeInsets.only(top: 110),
                        alignment: Alignment.center,
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
                          itemCount: DeliverFirebaseCubit().walletList.length,
                          itemBuilder: (_,index){
                            return Container(
                                padding: const EdgeInsets.only(bottom: 12) ,
                                child: WalletItem(
                                  wallet: DeliverFirebaseCubit().walletList[index],
                                )
                            );

                          }),
                    );
                  }
              ),

            ),
          ],
        ),
      ),
    );
  }
}



class WalletItem extends StatelessWidget {
  const WalletItem({Key? key, required this.wallet}) : super(key: key);
  final WeeWeeWallet wallet;
  @override
  Widget build(BuildContext context) {
    List<String> day = wallet.receivedDay.split(" ");
    return Stack(
      alignment: Alignment.topRight,
      children: [

        GestureDetector(
          onTap: (){
       DeliverFirebaseCubit().getWalletPackagesListHistory(wallet: wallet);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WeeWeeWalletHistoryScreen(wallet: wallet,)
            ));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 16,right: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                      Text(day[1].replaceAll(",", ""), style: TextStyle(fontSize: 26 , fontWeight: FontWeight.w500),),
                      Text(day[0] , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w400),),
                    ],
                  ),
                  const Spacer(),
                  Text(wallet.moneyReceiverFullName , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w400, color: Colors.black54),),
                  const Spacer(),
                  Text(wallet.moneyReceived.toString() , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w400),),
                  const SizedBox(width: 4,),
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text("DZ" , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
            ),
          ),
        ),
        if(! wallet.confirmed)
          const Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.verified_rounded, size: 28,),
            ),
          ),
      ],
    );
  }
}
