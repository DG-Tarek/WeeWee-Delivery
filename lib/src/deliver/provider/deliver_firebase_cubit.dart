

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

  String? _selectedQRCode = "";


  List<Package> _myPackagesList = [];
  final String _uid = "kF6ffq2JGtlLESh0L7cw";


  Future<void> getMyPackagesList() async {
    emit(GetMyPackagesListLoadingState());
    final String path = DateFormat.yMMM().format(DateTime.now());
    await FirebaseFirestore.instance.collection(path).where(
        "drivers", arrayContains: _uid).get().then((value) {
      _myPackagesList.clear();
      for (var doc in value.docs) {
        _myPackagesList.add(Package.fromJson(doc.data())
          ..id = doc.id);
      }
      emit(GetMyPackagesListSuccessfullyState());
    });
  }

  void setSelectedQRCode(String? qr)=> _selectedQRCode = qr;

  Future<void> pickUpScannedPackage() async {
    _selectedQRCode = "A8MK8D3FplSCSeGOhFrs";
    emit(ChangePackageStateLoadingState());
    for(Package p in _myPackagesList){
      if (p.packageState == "pickUp" && p.id == _selectedQRCode ){
        await FirebaseFirestore.instance.collection(p.savedCollection)
            .doc(p.id)
            .update({"packageState" : "onRoad" })
            .then((value) {
              emit(ChangePackageStateSuccessfullyState());
                p.packageState = "onRoad";
            });
      }
    }
  }

  
  List<Package> get myPackagesList => _myPackagesList;
  String? get selectedQRCode => _selectedQRCode;
}