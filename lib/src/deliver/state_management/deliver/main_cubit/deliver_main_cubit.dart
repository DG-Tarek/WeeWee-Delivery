import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewee_delivery/src/deliver/screens/profile/driver_profile_screen.dart';
 import '../../../provider/deliver_firebase_cubit.dart';
import '../../../screens/maps/maps_screen.dart';
import '../../../screens/packages/packages_list_screen.dart';
import 'deliver_main_cubit_states.dart';

class DeliverMainCubit extends Cubit<DeliverMainCubitState> {
  static final DeliverMainCubit _instance = DeliverMainCubit._internal();

  factory DeliverMainCubit() {
    return _instance;
  }
  int _currentScreenIndex = 0 ;


  List<Widget> _screens = [
    MapsScreen(),
    PackagesListScreen(),
    ProfileScreen(),
  ];

  final List<String> _typesOfPackages = ["To pick-up", "To deliver", "To return"];
  int _selectedTypeOfPackages = 0;

  bool _selectedPackage = false ;


  DeliverMainCubit._internal() : super(CreateDeliverMainBlocState());

  void changeScreen(int index){
    _currentScreenIndex = index;
    if(index==2)
     {
       print("up");
       DeliverFirebaseCubit().getMyPackagesList();}
    emit(ChangeScreenState());
  }

  void changeSelectedTypeOfPackages(value){
    _selectedTypeOfPackages = _typesOfPackages.indexOf(value);
  }

  void setSelectedPackage(){
   _selectedPackage = !_selectedPackage;
  }

  Widget get currentScreen => _screens[_currentScreenIndex];
  int get currentScreenIndex => _currentScreenIndex;
  List<String> get typesOfPackages => _typesOfPackages;
  String get selectedTypeOfPackages => _typesOfPackages[_selectedTypeOfPackages];
  bool get selectedPackage => _selectedPackage;
  }

