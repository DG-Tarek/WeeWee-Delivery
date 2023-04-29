
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/moduls/shared/package_model.dart';
import 'package:weewee_delivery/src/moduls/trader/product_history_model.dart';
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

  List<Package> _packagesList = [];

  List<ProductHistory> _productHistory = [];

  Client? _firstClientChoice ;
  Client? _secondClientChoice ;

  Product? _firstProductChoice ;
  Product? _secondProductChoice ;

  Future<void> NewProduct({required Product product}) async {
    emit(NewProductLoadingState());
    await FirebaseFirestore.instance.collection('test_users')
        .doc(_uid).collection("stock").add(product.toJson())
        .then((value) => emit(NewProductSuccessfullyState())
    );
  }
  void restoreProductState()=>emit(NewProductState());

  Future<void> NewClient({required Client client}) async {
    emit(NewClientLoadingState());
    await FirebaseFirestore.instance.collection('test_users')
        .doc(_uid).collection("clients").add(client.toJson())
        .then((value) => emit(NewClientSuccessfullyState()));
  }
  void restoreClientState()=>emit(NewClientState());

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





  Future<void> newOrder() async {

    emit(NewOrderLoadingState());
    final Client selectedClient ;
    final Product selectedProduct ;
    final int stock ;
    final int minStock ;
    final bool fromStock;

    selectedClient = _firstClientChoice ?? _secondClientChoice! ;
    selectedProduct = _firstProductChoice ?? _secondProductChoice! ;
    final String path = DateFormat.yMMMM().format(DateTime.now());

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

if(fromStock){
  ProductHistory productHistory = ProductHistory(clientFullName: selectedClient.fullName,
      clientPhoneNumber: selectedClient.phoneNumber,
      clientOptionalPhoneNumber: selectedClient.optionalPhoneNumber!,
      state: "inProgress",
      saleDate: DateFormat.yMMMMd().format(DateTime.now()).replaceAll(",", ""),
      quantity: 1,
      totalPrice: selectedProduct.price,
      stockState: stock.toString());

  await FirebaseFirestore.instance.collection('test_users')
      .doc(_uid).collection("stock").doc(selectedProduct.id).collection("history").add(productHistory.toJson())
      .then((value) async {
        final Package package = Package(
        packageCreatedAt: createdTime(),
        packageState: "Up",
        isFreeDelivery: true,
        preferredDeliveryDay: "preferredDeliveryDay",
        preferredDeliveryTime: "preferredDeliveryTime",
        deliveryCost: 0,
        senderId: _uid + "!weewee!" + selectedProduct.id! + "!weewee!" + value.id,
        senderFullName: "senderFullName",
        senderStoreName: "senderStoreName",
        senderMobileNumber: "senderMobileNumber",
        senderWilaia: "senderWilaia",
        senderBaladia: "senderBaladia",
        senderAddress: "senderAddress",
        senderGeolocation: "senderGeolocation",
        senderAnotherStoreName: "senderAnotherStoreName",
        senderAnotherPhoneNumber: "senderAnotherMobileNumber",
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
        productNewStockState: "$stock / $minStock" );
        await FirebaseFirestore.instance.collection(path)
        .add(package.toJson())
        .then((value) async {
        await FirebaseFirestore.instance.collection('test_users')
            .doc(_uid).collection("stock").doc(selectedProduct.id).update({"stock" : selectedProduct.stock})
            .then((value) => emit(NewOrderSuccessfullyState()));
    });
  });
}else{
  final Package package = Package(
      packageCreatedAt: createdTime(),
      packageState: "Up",
      isFreeDelivery: true,
      preferredDeliveryDay: "preferredDeliveryDay",
      preferredDeliveryTime: "preferredDeliveryTime",
      deliveryCost: 0,
      senderId: _uid,
      senderFullName: "senderFullName",
      senderStoreName: "senderStoreName",
      senderMobileNumber: "senderMobileNumber",
      senderWilaia: "senderWilaia",
      senderBaladia: "senderBaladia",
      senderAddress: "senderAddress",
      senderGeolocation: "senderGeolocation",
      senderAnotherStoreName: "senderAnotherStoreName",
      senderAnotherPhoneNumber: "senderAnotherMobileNumber",
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
      productNewStockState:"The Product has not been shipped from The Stock." );
      await FirebaseFirestore.instance.collection(path)
          .add(package.toJson())
          .then((value){
          emit(NewOrderSuccessfullyState());
  });
}



  }




  void restoreOrderState()=>emit(NewOrderState());

  Future<void> getPackagesList() async {
    
    emit(GetPackagesLoadingState());
    await FirebaseFirestore.instance.collection(DateFormat.yMMMM().format(DateTime.now())).where("senderId",isEqualTo: _uid).get().then((value) {
      _packagesList.clear();
      for (var doc in value.docs) {
        _packagesList.add(Package.fromJson(doc.data())..id = doc.id);
      }
      emit(GetPackagesSuccessfullyState());
    });
  }

  List<Package> get packagesList => _packagesList ;


  Future<void> getProductHistory({required String productId}) async {

    emit(GetProductHistoryLoadingState());
    await FirebaseFirestore.instance.collection("test_users").doc(_uid).collection("stock").doc(productId)
        .collection("history").get().then((value) {
      _productHistory.clear();
      for (var doc in value.docs) {
        _productHistory.add(ProductHistory.fromJson(doc.data()));
      }
      emit(GetProductHistorySuccessfullyState());
    });
  }
  List<ProductHistory> get productHistory => _productHistory ;
}

