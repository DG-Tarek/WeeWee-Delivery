import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewee_delivery/src/deliver/maps/maps_screen.dart';
import 'package:weewee_delivery/src/deliver/packages/packages_list_screen.dart';
import 'package:weewee_delivery/src/state_management/deliver/deliver_main_cubit_state.dart';

class DriverMainCubit extends Cubit<DeliverMainCubitState> {
  static final DriverMainCubit _instance = DriverMainCubit._internal();

  factory DriverMainCubit() {
    return _instance;
  }
  int _currentScreenIndex = 0 ;


  List<Widget> _screens = [
    MapsScreen(),
    PackagesListScreen(),
    Container(),
  ];

  final List<String> _typesOfPackages = ["To pick-up", "To deliver", "To return"];
  int _selectedTypeOfPackages = 0;


  DriverMainCubit._internal() : super(CreateDeliverMainBlocState());

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

