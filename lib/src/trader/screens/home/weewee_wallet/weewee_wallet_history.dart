
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/moduls/trader/weewee_wallet_model.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/all_packages_screen.dart';

import '../../../provider/trader_firebase_cubit.dart';
import '../../../provider/trader_firebase_cubit_states.dart';

class WeeWeeWalletHistoryScreen extends StatefulWidget {
  const WeeWeeWalletHistoryScreen({Key? key, required this.wallet}) : super(key: key);
  final WeeWeeWallet wallet ;
  @override
  State<WeeWeeWalletHistoryScreen> createState() => _WeeWeeWalletHistoryScreenState();
}

class _WeeWeeWalletHistoryScreenState extends State<WeeWeeWalletHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallet History"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
              child: Container(
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
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(height: 16,),
                              Text("Day", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                              const Spacer(),
                              Text( widget.wallet.receivedDay.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                            ],),
                          const SizedBox(height: 26,),
                          Row(
                            children: [

                              Text("Receiver", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text( widget.wallet.moneyReceiverFullName.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                            ],),
                          const SizedBox(height: 12,),
                          Row(
                            children: [

                              Text("Delivered Packages", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text( widget.wallet.numberOfDeliveredPackages.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                            ],),
                          const SizedBox(height: 12,),
                          Row(
                            children: [

                              Text("Returned Packages", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text( widget.wallet.numberOfReturnedPackages.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                            ],),
                          const SizedBox(height: 12,),
                          Row(
                            children: [

                              Text("Total Packages", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text( widget.wallet.numberOfPackages.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                            ],),
                          const SizedBox(height: 12,),
                          Row(
                            children: [

                              Text("Delivery Cost", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple.shade300, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text( widget.wallet.deliveryCost.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                            ],),
                          const SizedBox(height: 12,),
                          Row(
                            children: [
                              SizedBox(height: 16,),
                              Text("Returned Cost", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.red.shade300, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text( widget.wallet.returnCost.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                            ],),
                          const SizedBox(height: 24,),
                          Row(
                            children: [
                              SizedBox(height: 16,),
                              Text("Received Money", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                              const Spacer(),
                              Text( widget.wallet.moneyReceived.toString(), style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                            ],),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Packages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),),
            ),
            const SizedBox(height: 10,),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: BlocBuilder<TraderFirebaseCubit, TraderFirebaseCubitState>(
                  bloc: TraderFirebaseCubit(),
                  buildWhen: (previous, current)=> current is GetProductHistorySuccessfullyState || current is GetProductHistoryLoadingState,
                  builder: (_, state) {
                    if( state is GetProductHistoryLoadingState){
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
                          itemCount: TraderFirebaseCubit().walletPackagesListHistory.length,
                          itemBuilder: (_,index){
                            return Container(
                                padding: const EdgeInsets.only(bottom: 12) ,
                                child: PackageItem(
                                  package: TraderFirebaseCubit().walletPackagesListHistory[index],
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
