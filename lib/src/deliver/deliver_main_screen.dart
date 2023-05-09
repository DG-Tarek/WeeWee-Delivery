

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:weewee_delivery/src/deliver/state_management/deliver/main_cubit/deliver_main_cubit.dart';
import 'package:weewee_delivery/src/deliver/state_management/deliver/main_cubit/deliver_main_cubit_states.dart';




class DeliverMainScreen extends StatelessWidget {
  const DeliverMainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliverMainCubit, DeliverMainCubitState>(
      bloc: DeliverMainCubit(),
      buildWhen: (previous, current)=> current is ChangeScreenState,
      builder: (context, state) {
        return Scaffold(
          body: DeliverMainCubit().currentScreen,
          bottomNavigationBar: Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 32.w ,left: 32.w, top: 12.w),
            child: SalomonBottomBar(
              currentIndex: DeliverMainCubit().currentScreenIndex,
              onTap: (i) {
                DeliverMainCubit().changeScreen(i);
              },
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(CupertinoIcons.map_fill),
                  title: Text("Maps"),
                  selectedColor: Colors.deepPurple,
                    unselectedColor: Colors.grey
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(CupertinoIcons.collections_solid),
                  title: Text("Packages"),
                  selectedColor: Colors.teal,
                    unselectedColor: Colors.grey
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  selectedColor: Colors.blue,
                  unselectedColor: Colors.grey
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
