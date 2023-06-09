import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewee_delivery/src/trader/screens/calender/calender_screen.dart';
import 'package:weewee_delivery/src/trader/screens/home/home_screen.dart';
import 'package:weewee_delivery/src/trader/screens/profile/trader_profile_screen.dart';
import 'package:weewee_delivery/src/trader/state_management/main_cubit/trader_main_cubit_states.dart';

class TraderMainCubit extends Cubit<TraderMainCubitState> {
  static final TraderMainCubit _instance = TraderMainCubit._internal();

  factory TraderMainCubit() {
    return _instance;
  }
  TraderMainCubit._internal() : super(CreateTraderMainBlocState());

  int _currentScreenIndex = 0 ;


  List<Widget> _screens = [
 HomeScreen(),
 CalenderScreen(),
 TraderProfileScreen(),
  ];

  final List<String> _typesOfPackages = ["To pick-up", "To deliver", "To return"];
  int _selectedTypeOfPackages = 0;



  void changeScreen(int index){
    _currentScreenIndex = index;
    emit(ChangeScreenState());
  }

  void changeSelectedTypeOfPackages(value){
    _selectedTypeOfPackages = _typesOfPackages.indexOf(value);
  }

 

  Widget get currentScreen => _screens[_currentScreenIndex];
  int get currentScreenIndex => _currentScreenIndex;
  List<String> get typesOfPackages => _typesOfPackages;
  String get selectedTypeOfPackages => _typesOfPackages[_selectedTypeOfPackages];
 
}

