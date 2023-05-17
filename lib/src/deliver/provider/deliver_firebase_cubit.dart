

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
  int _deliveredPackages = 0;
  int _returnedPackages = 0;


  List<Package> _myPackagesList = [];
  List<Package> _readyPackages = [];

  final String _uid = "kF6ffq2JGtlLESh0L7cw";


  int get pickUpPackages => _pickUpPackages ;
  int get deliveredPackages => _deliveredPackages ;
  int get returnedPackages => _returnedPackages ;

  Future<void> getMyPackagesList() async {
    emit(GetMyPackagesListLoadingState());
    _pickUpPackages = 0;
    final String path = DateFormat.yMMM().format(DateTime.now());
    await FirebaseFirestore.instance.collection(path).where(
        "drivers", arrayContains: _uid).where("packageState",whereIn: ["pickUp", "onRoad","delivered","returned"]).get().then((value) {
      _myPackagesList.clear();
      for (var doc in value.docs) {
        Package p = Package.fromJson(doc.data())
          ..id = doc.id ;

        /*switch(p.packageState){
          case "pickUp":{
            _pickUpPackages++;
            break;}
          case "delivered":{
            _deliveredPackages++;
            break;}
          case "returned":{
            _returnedPackages++;
          }
        }*/
        if(p.packageState == "pickUp")
          {_pickUpPackages++;}
        _myPackagesList.add(p);
      }
      emit(GetMyPackagesListSuccessfullyState());
    });
  }


  void countReadyPackages(){
    _deliveredPackages = 0;
    _returnedPackages = 0;
    _readyPackages.clear();
    for (Package p in _myPackagesList){
      switch(p.packageState){
        case "delivered":{
          _deliveredPackages++;
          _readyPackages.add(p);
          break;}
        case "returned":{
          _returnedPackages++;
          _readyPackages.add(p);
          break;
        }
      }
    }
  }

  Future<String> pickUpScannedPackage({required pickedUpQRCode}) async {

    String state = "Unpicked" ;
    for(Package p in _myPackagesList){
      if ( p.id == pickedUpQRCode){
         state = "AlreadyPicked" ;
        if( p.packageState == "pickUp" ){
         emit(PickUpPackagesLoadingState());
         await FirebaseFirestore.instance.collection(p.savedCollection)
             .doc(p.id)
             .update({"packageState" : "onRoad" })
             .then((value) async {
           p.packageState = "onRoad";
           _pickUpPackages-- ;
            state = "Picked" ;
           await addHistory(activityType: "delivery",event: "pickup",location: p.senderWilaya+", "+p.senderBaladia , packageCollection: p.savedCollection , packageID: p.id! );
           emit(PickUpPackagesSuccessfullyState());
         });
       }
      }
    }
    return state;
  }


  Future<void> changePackageState({required Package package, required String packageNewState})async{
  emit(ChangePackageStateLoadingState());
    await FirebaseFirestore.instance.collection(package.savedCollection)
        .doc(package.id)
        .update({"packageState" : packageNewState })
        .then((value) {
        final int index = myPackagesList.indexWhere((element) => element.id == package.id);
        myPackagesList[index].packageState = packageNewState ;
        switch(packageNewState){
          case "delivered":
            {
              final double money = package.isFreeDelivery ? package.productPrice : package.productPrice + package.deliveryCost;
              addHistory(activityType: "delivery",event: "delivered",location: package.clientWilaya+", "+package.clientBaladia, money: money.toString() , packageCollection: package.savedCollection , packageID: package.id!);
              break;
            }
          case "returned":
            {
              addHistory(activityType: "delivery",event: "returned",location: package.clientWilaya+", "+package.clientBaladia , packageCollection: package.savedCollection , packageID: package.id!);
              break;
            }
        }
        emit(ChangePackageStateSuccessfullyState());

    });
  }



  // Complete this Method for saving Deliver History
  Future<void> addHistory( {required String activityType, required String event,required String packageID, required String packageCollection, String location="-", String money="-"})async{
    final String month = DateFormat.yMMMM().format(DateTime.now());
     String day = DateFormat.MMMMd().format(DateTime.now());
    final String time = DateFormat.jms().format(DateTime.now());

    final String history = "$time | $activityType | $event | $packageCollection $packageID | $location | $money";

    await FirebaseFirestore.instance.collection("test_users")
        .doc(_uid).collection(month).doc(day).get().then((value) async{
          try {
            await FirebaseFirestore.instance.collection("test_users")
                .doc(_uid).collection(month).doc(day).update(
                {"History": FieldValue.arrayUnion(<String>[history])});
          }
          catch (e){
            await FirebaseFirestore.instance.collection("test_users")
                .doc(_uid).collection(month).doc(day).set({"History": FieldValue.arrayUnion(<String>[history])});
          }
        });


  }

  
  List<Package> get myPackagesList => _myPackagesList;
  List<Package> get readyPackages => _readyPackages;


}