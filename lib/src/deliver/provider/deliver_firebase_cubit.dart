

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit_states.dart';

import '../../moduls/shared/package_model.dart';

class DeliverFirebaseCubit extends Cubit<DeliverFirebaseCubitState> {
  static final DeliverFirebaseCubit _instance = DeliverFirebaseCubit
      ._internal();

  DeliverFirebaseCubit._internal() : super(CreateDeliverFirebaseBlocState());

  factory DeliverFirebaseCubit() {
    return _instance;
  }




  int _pickUpPackages = 0;


  List<Package> _myPackagesList = [];
  final String _uid = "kF6ffq2JGtlLESh0L7cw";


  int get pickUpPackages => _pickUpPackages ;

  Future<void> getMyPackagesList() async {
    emit(GetMyPackagesListLoadingState());
    _pickUpPackages = 0;
    final String path = DateFormat.yMMM().format(DateTime.now());
    await FirebaseFirestore.instance.collection(path).where(
        "drivers", arrayContains: _uid).get().then((value) {
      _myPackagesList.clear();
      for (var doc in value.docs) {
        Package p = Package.fromJson(doc.data())
          ..id = doc.id ;
        if(p.packageState == "pickUp")
          {_pickUpPackages++;}
        _myPackagesList.add(p);
      }
      emit(GetMyPackagesListSuccessfullyState());
    });
  }



  Future<String> pickUpScannedPackage({required pickedUpQRCode}) async {
    //pickedUpQRCode = "A8MK8D3FplSCSeGOhFrs";
    String state = "Unpicked" ;
    for(Package p in _myPackagesList){
      if ( p.id == pickedUpQRCode){
         state = "AlreadyPicked" ;
        if( p.packageState == "pickUp" ){
         emit(PickUpPackagesLoadingState());
         await FirebaseFirestore.instance.collection(p.savedCollection)
             .doc(p.id)
             .update({"packageState" : "onRoad" })
             .then((value) {
           p.packageState = "onRoad";
           _pickUpPackages-- ;
            state = "Picked" ;
           emit(PickUpPackagesSuccessfullyState());
         });
       }
      }
    }
    return state;
  }


  Future<void> changePackageState({required String packageID,required String savedCollection, required String packageNewState})async{
  emit(ChangePackageStateLoadingState());
    await FirebaseFirestore.instance.collection(savedCollection)
        .doc(packageID)
        .update({"packageState" : packageNewState })
        .then((value) {
        final int index = myPackagesList.indexWhere((element) => element.id == packageID);
        myPackagesList[index].packageState = packageNewState ;
      emit(ChangePackageStateSuccessfullyState());
    });
  }



  // Complete this Method for saving Deliver History
  Future<void> addHistory( {required String activityType, required String event, String location="-", String money="-"})async{
    final String month = DateFormat.yMMMM().format(DateTime.now());
    final String day = DateFormat.MMMMd().format(DateTime.now());
    final String time = DateFormat.jms().format(DateTime.now());
    final String history = "$time $activityType $event $location $money";
    await FirebaseFirestore.instance.collection("test_users")
        .doc(_uid).collection(month).doc(day).set({"Event":history});

  }

  
  List<Package> get myPackagesList => _myPackagesList;


}