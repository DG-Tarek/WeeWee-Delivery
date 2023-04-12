import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/opening/opening_screen.dart';
import 'package:weewee_delivery/src/shared/styles.dart';
import 'package:weewee_delivery/src/deliver/state_management/deliver/main_cubit/deliver_main_cubit.dart';
import 'package:weewee_delivery/src/trader/state_management/main_cubit/trader_main_cubit.dart';

import 'src/constant/constant.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(932, 430),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: lightTheme,
          home: MultiBlocProvider(
              providers: [
                BlocProvider<DriverMainCubit>(
                  create: (BuildContext context) => DriverMainCubit(),
                ),
                BlocProvider<TraderMainCubit>(
                  create: (BuildContext context) => TraderMainCubit(),
                ),
              ],
              child: OpeningScreen()),
        );
      },
    );
  }
}


