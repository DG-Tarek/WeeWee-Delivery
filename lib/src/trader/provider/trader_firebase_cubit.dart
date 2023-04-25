
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/moduls/shared/package_model.dart';
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
        _clientsList.add(Client.fromJson(doc.data())..id = doc.id);
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
    _secondProductChoice = product;
    emit(SelectedProductState());
  }

  Client? get firstClientChoice => _firstClientChoice ;
  Product? get firstProductChoice => _firstProductChoice ;


  Future<void> createPackage() async {
    final Client selectedClient ;
    final Product selectedProduct ;
    final int stock ;
    final int minStock ;
    final bool fromStock;

    selectedClient = _firstClientChoice ?? _secondClientChoice! ;
    selectedProduct = _firstProductChoice ?? _secondProductChoice! ;

    if (_firstProductChoice != null){
      selectedProduct.subtractFromStock(count: 1);
      stock = selectedProduct.stock;
      minStock = selectedProduct.minStock;
      fromStock = true;
    }else{
      stock = 0;
      minStock = 0;
      fromStock = false;
    }
    final Package package = Package(
        packageCreatedAt: createdTime(),
        packageState: "packageState",
        isFreeDelivery: true,
        preferredDeliveryDay: "preferredDeliveryDay",
        preferredDeliveryTime: "preferredDeliveryTime",
        deliveryCost: 0,
        senderFullName: "senderFullName",
        senderStoreName: "senderStoreName",
        senderMobileNumber: "senderMobileNumber",
        senderWilaia: "senderWilaia",
        senderBaladia: "senderBaladia",
        senderAddress: "senderAddress",
        senderGeolocation: "senderGeolocation",
        senderAnotherStoreName: "senderAnotherStoreName",
        senderAnotherMobileNumber: "senderAnotherMobileNumber",
        senderAnotherWilaia: "senderAnotherWilaia",
        senderAnotherBaladia: "senderAnotherBaladia",
        senderAnotherAddress: "senderAnotherAddress",
        senderAnotherGeolocation: "senderAnotherGeolocation",
        clientFullName: selectedClient.fullName,
        clientPhoneNumber: selectedClient.phoneNumber,
        clientOptionalPhoneNumber: selectedClient.optionalPhoneNumber
        , clientWilaya: selectedClient.wilaya,
        clientBaladia: selectedClient.baladia,
        clientAddress: selectedClient.address,
        clientGeolocation: selectedClient.geolocation,
        productName: selectedProduct.name,
        productDescription: selectedProduct.description,
        productPrice: selectedProduct.price,
        productHeight: selectedProduct.height,
        productWidth: selectedProduct.width,
        productLength: selectedProduct.length,
        productWeight: selectedProduct.width,
        productSelectedFromStock: fromStock,
        productNewStockState: fromStock ? "$stock / $minStock" : "The Product has not been shipped from The Stock." );
        // add package to Packages list
        await FirebaseFirestore.instance.collection(DateFormat.yMMMM().format(DateTime.now()))
        .add(package.toJson())
        .then((value) async {
          // add package id to Trader packages list
          await FirebaseFirestore.instance.collection('test_users')
              .doc(_uid).collection("packages").add({"package_id" : value.id})
              .then((value) async {
            // update product stock state
            await FirebaseFirestore.instance.collection('test_users')
                .doc(_uid).collection("stock").doc(selectedProduct.id).update({"stock" : selectedProduct.stock});
          });
           });




  }

}

