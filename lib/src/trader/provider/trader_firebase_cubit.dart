
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit_states.dart';

import '../../moduls/trader/product_model.dart';
import '../../moduls/trader/client_model.dart';


class TraderFirebaseCubit extends Cubit<TraderFirebaseCubitState> {
  static final TraderFirebaseCubit _instance = TraderFirebaseCubit._internal();
  TraderFirebaseCubit._internal() : super(CreateTraderFirebaseBlocState());
  factory TraderFirebaseCubit() {
    return _instance;
  }
  final String _uid = "xdIGBM182qPHRvqt8BLM" ;

  List<Client> _clientsList = [];

  List<Product> _productsList = [];

  Client? _firstClientChoice ;
  Client? _secondClientChoice ;

  Product? _firstProductChoice ;
  Product? _secondProductChoice ;

  Future<void> createProduct({required Product product}) async {
    emit(CreateProductLoadingState());
    await FirebaseFirestore.instance.collection('test_users')
        .doc(_uid).collection("stock").add(product.toJson())
        .then((value) => emit(CreateProductSuccessfullyState())
    );
  }
  void restoreCreateProductState()=>emit(CreateProductState());

  Future<void> createClient({required Client client}) async {
    emit(CreateClientLoadingState());
    await FirebaseFirestore.instance.collection('test_users')
        .doc(_uid).collection("clients").add(client.toJson())
        .then((value) => emit(CreateClientSuccessfullyState()));
  }
  void restoreCreateClientState()=>emit(CreateClientState());

  Future<void> getClientsList() async {
    emit(GetClientsLoadingState());
    await FirebaseFirestore.instance.collection("test_users/"+_uid+"/clients").get().then((value) {
      _clientsList.clear();
      for (var doc in value.docs) {
        _clientsList.add(Client.fromJson(doc.data()));
      }
      emit(GetClientsSuccessfullyState());
  });
  }
  List<Client> get clientsList => _clientsList ;

  Future<void> getProductsList() async {
    emit(GetProductsLoadingState());
    await FirebaseFirestore.instance.collection("test_users/"+_uid+"/stock").get().then((value) {
      _productsList.clear();
      for (var doc in value.docs) {
        _productsList.add(Product.fromJson(doc.data())..id = doc.id);
      }
      emit(GetProductsSuccessfullyState());
    });
  }
  List<Product> get productsList => _productsList ;

  void setFirstClientChoice(Client? client){
    _firstClientChoice = client;
    emit(SelectedClientState());
  }
  void setSecondClientChoice(Client? client){
    _secondClientChoice = client;
    emit(SelectedClientState());
  }


  void setFirstProductChoice(Product? product){
    _firstProductChoice = product;
    emit(SelectedProductState());
  }

  void setSecondProductChoice(Product? product){
    _firstProductChoice = product;
    emit(SelectedProductState());
  }

  Client? get firstClientChoice => _firstClientChoice ;
  Product? get firstProductChoice => _firstProductChoice ;


  void createOrder(){
    final Client selectedClient ;
    final Product selectedProduct ;
    selectedClient = _firstClientChoice ?? _secondClientChoice! ;
    selectedProduct = _firstProductChoice ?? _secondProductChoice! ;


  }

}

