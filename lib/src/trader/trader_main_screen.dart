
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'state_management/main_cubit/trader_main_cubit.dart';
import 'state_management/main_cubit/trader_main_cubit_states.dart';
 
class TraderMainScreen extends StatelessWidget {
  const TraderMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraderMainCubit, TraderMainCubitState>(
        bloc: TraderMainCubit(),
    buildWhen: (previous, current)=> current is ChangeScreenState,
    builder: (context, state) {
        return Scaffold(
          body: TraderMainCubit().currentScreen,
          bottomNavigationBar: Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 32.w ,left: 32.w, top: 12.w),
            child: SalomonBottomBar(
              currentIndex: TraderMainCubit().currentScreenIndex,
              onTap: (i) {
                TraderMainCubit().changeScreen(i);

              },
              items: [
                /// Home
                SalomonBottomBarItem(
                    icon: Icon(Icons.dashboard_rounded),
                    title: Text("Home"),
                    selectedColor: Colors.deepPurple,
                    unselectedColor: Colors.grey
                ),

                SalomonBottomBarItem(
                    icon: Icon(CupertinoIcons.calendar_today),
                    title: Text("Calender"),
                    selectedColor: Colors.teal,
                    unselectedColor: Colors.grey
                ),
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
