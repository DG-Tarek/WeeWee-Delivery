
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit_states.dart';

import '../../moduls/trader/product_model.dart';
import '../../moduls/trader/client_model.dart';


class TraderFirebaseCubit extends Cubit<TraderFirebaseCubitState> {
  static final TraderFirebaseCubit _instance = TraderFirebaseCubit._internal();

  factory TraderFirebaseCubit() {
    return _instance;
  }
  final String _uid = "xdIGBM182qPHRvqt8BLM" ;
  TraderFirebaseCubit._internal() : super(CreateTraderFirebaseBlocState());

  Future<void> createProduct({required Product product}) async {
    emit(CreateProductLoadingState());
    await FirebaseFirestore.instance.collection('test_users')
        .doc(_uid).collection("stock").add(product.toJson())
        .then((value) => emit(CreateProductSuccessfullyState()));
  }

  Future<void> createClient({required Client client}) async {
    emit(CreateClientLoadingState());
    await FirebaseFirestore.instance.collection('test_users')
        .doc(_uid).collection("clients").add(client.toJson())
        .then((value) => emit(CreateClientSuccessfullyState()));
  }
}

