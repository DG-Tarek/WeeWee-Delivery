
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/all_packages_screen.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/package_details_screen.dart';

import '../../../../constant/constant.dart';
import '../../../provider/trader_firebase_cubit.dart';
import '../../../provider/trader_firebase_cubit_states.dart';

class DeliveredPackagesScreen extends StatelessWidget {
  const DeliveredPackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: Image.asset("assets/icons/approved.png",color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("Delivered Packages"),

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
                        child: TraderFirebaseCubit().packagesList[index].packageState == "delivered" || TraderFirebaseCubit().packagesList[index].packageState == "delivered+"  ?
                        PackageItem(
                          package: TraderFirebaseCubit().packagesList[index],
                        ): Container()
                    ) ;

                  }),
            );
          }
      )
    );
  }
}
