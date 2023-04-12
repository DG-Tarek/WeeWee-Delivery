import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewee_delivery/src/state_management/trader/trader_main_cubit_states.dart';

class TraderMainCubit extends Cubit<TraderMainCubitState> {
  static final TraderMainCubit _instance = TraderMainCubit._internal();

  factory TraderMainCubit() {
    return _instance;
  }
  int _currentScreenIndex = 0 ;


  List<Widget> _screens = [
 Container(),
 Container(),
 Container(),
 Container(),
 Container(),
  ];

  final List<String> _typesOfPackages = ["To pick-up", "To deliver", "To return"];
  int _selectedTypeOfPackages = 0;

  TraderMainCubit._internal() : super(CreateTraderMainBlocState());

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

