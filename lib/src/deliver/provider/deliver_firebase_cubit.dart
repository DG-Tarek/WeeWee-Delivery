

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


  
  List<Package> get myPackagesList => _myPackagesList;
}