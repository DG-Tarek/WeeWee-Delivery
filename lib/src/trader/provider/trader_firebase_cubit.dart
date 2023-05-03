
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/moduls/shared/package_model.dart';
import 'package:weewee_delivery/src/moduls/trader/delivery_options_model.dart';
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
  List<Package> _packagesListByDay = [];

  List<ProductHistory> _productHistory = [];

  Client? _firstClientChoice ;
  Client? _secondClientChoice ;

  Product? _firstProductChoice ;
  Product? _secondProductChoice ;

  DeliveryOptions? _deliveryOptions ;

  bool _freeProduct = false;
  double _productPrice = 0;
  double _deliveryCost = 0;




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
    final String path = DateFormat.yMMM().format(DateTime.now());

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
    final String date = DateFormat.yMMMd().format(DateTime.now()).replaceAll(",", "");
    if(fromStock){
  ProductHistory productHistory = ProductHistory(clientFullName: selectedClient.fullName,
      clientPhoneNumber: selectedClient.phoneNumber,
      clientOptionalPhoneNumber: selectedClient.optionalPhoneNumber!,
      state: "inProgress",
      saleDate: DateFormat.yMMMd().format(DateTime.now()).replaceAll(",", ""),
      quantity: 1,
      totalPrice: selectedProduct.price,
      stockState: stock.toString());

 await FirebaseFirestore.instance.collection('test_users')
      .doc(_uid).collection("stock").doc(selectedProduct.id).collection("history").add(productHistory.toJson())
      .then((value) async {
        final Package package = Package(
        packageCreatedAt: createdTime(),
        packageCreatedDay: "$_uid@DAY#$date",//find package by day (this is related to the calender screen)
        packageState: "pickup",
        isFreeDelivery: _deliveryOptions!.isFreeDelivery,
        isFreeProduct: _deliveryOptions!.isFreeProduct,
        preferredDeliveryDay: _deliveryOptions!.preferredDeliveryDay,
        preferredDeliveryTime: _deliveryOptions!.preferredDeliveryTime,
        deliveryCost: _deliveryOptions!.deliveryCost,
        totalPrice: _deliveryOptions!.totalPrice,
        senderId: _uid ,
        senderFullName: "senderFullName",
        senderStoreName: "senderStoreName",
        senderMobileNumber: "senderMobileNumber",
        senderWilaya: "senderWilaya",
        senderBaladia: "senderBaladia",
        senderAddress: "senderAddress",
        senderGeolocation: "senderGeolocation",
        senderAnotherStoreName: _deliveryOptions!.anotherStoreName!,
        senderAnotherPhoneNumber: _deliveryOptions!.anotherPhoneNumber!,
        senderAnotherWilaia: _deliveryOptions!.anotherWilaya!,
        senderAnotherBaladia: _deliveryOptions!.anotherBaladia!,
        senderAnotherAddress: _deliveryOptions!.anotherAddress!,
        senderAnotherGeolocation: _deliveryOptions!.anotherGeolocation!,
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
        productHistoryPath: "${selectedProduct.id}@PATH#${value.id}",
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
            .doc(_uid).collection("stock").doc(selectedProduct.id)
            .update({"stock" : selectedProduct.stock})
            .then((value) => emit(NewOrderSuccessfullyState()));
    });
  });
}else{
  final Package package = Package(
      packageCreatedAt: createdTime(),
      packageCreatedDay: "$_uid@DAY#$date",
      packageState: "pickup",
      isFreeDelivery: _deliveryOptions!.isFreeDelivery,
      isFreeProduct: _deliveryOptions!.isFreeProduct,
      preferredDeliveryDay: _deliveryOptions!.preferredDeliveryDay,
      preferredDeliveryTime: _deliveryOptions!.preferredDeliveryTime,
      deliveryCost: _deliveryOptions!.deliveryCost,
      totalPrice: _deliveryOptions!.totalPrice,
      senderId: _uid ,
      senderFullName: "senderFullName",
      senderStoreName: "senderStoreName",
      senderMobileNumber: "senderMobileNumber",
      senderWilaya: "senderWilaya",
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
      productHistoryPath: "The Product has not been shipped from The Stock.",
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
    await FirebaseFirestore.instance.collection(DateFormat.yMMM().format(DateTime.now())).where("senderId",isEqualTo: _uid).get().then((value) {
      _packagesList.clear();
      for (var doc in value.docs) {
        _packagesList.add(Package.fromJson(doc.data())..id = doc.id);
      }
      emit(GetPackagesSuccessfullyState());
    });
  }

  List<Package> get packagesList => _packagesList ;







  Future<void> getPackagesListByDay({required String date}) async {
    emit(GetPackagesByDayLoadingState());
    final List<String> d = date.split(" ");
    await FirebaseFirestore.instance.collection("${d[0]} ${d[2]}").where("packageCreatedDay",isEqualTo: "$_uid@DAY#$date").get().then((value) {
      _packagesListByDay.clear();
      for (var doc in value.docs) {
        _packagesListByDay.add(Package.fromJson(doc.data())..id = doc.id);
      }
      emit(GetPackagesByDaySuccessfullyState());
    });
  }
  List<Package> get packagesListByDay => _packagesListByDay ;







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




  void setFreeProduct({required isFree})=> _freeProduct = isFree ;
  bool get isFreeProduct =>_freeProduct ;


    void  setProductPrice() {
      if (_firstProductChoice != null ){
        if(_freeProduct == true){
          _productPrice = 0;
        }else{
          _productPrice = _firstProductChoice!.price;
        }
      }
      else{
        _productPrice = _secondProductChoice!.price;
      }
      print(_productPrice);
      emit(UpdateDeliveryOptionsState());
    }
    double get productPrice => _productPrice ;



  void  setDeliveryCost({String anotherPickUpWilia=""}){
    double theSameWilya = 500;
    double isNotTheSameWilya = 600;
    if(anotherPickUpWilia.isNotEmpty){

      if(_firstClientChoice != null ){

        if( _firstClientChoice!.wilaya  == anotherPickUpWilia){
          _deliveryCost = theSameWilya;
        }
        else {
          _deliveryCost = isNotTheSameWilya  ;
        }
      }
      else{
        if(_secondClientChoice!.wilaya  == anotherPickUpWilia)
          {_deliveryCost = theSameWilya;}
      else{
          _deliveryCost = isNotTheSameWilya  ;
        }
      }
    }else{
      if(_firstClientChoice != null ){
        if( _firstClientChoice!.wilaya == "16 - Alger"){
          _deliveryCost = theSameWilya;
        }
        else {
          _deliveryCost = isNotTheSameWilya  ;
        }
      }
      else{
        if(_secondClientChoice!.wilaya == "16 - Alger")
        {_deliveryCost = theSameWilya;}
        else{
          _deliveryCost = isNotTheSameWilya  ;
        }
      }
    }
    emit(UpdateDeliveryOptionsState());
  }

  double get deliveryCost => _deliveryCost ;

  void setDeliveryOptions({required DeliveryOptions options})=> _deliveryOptions = options ;

  DeliveryOptions get deliveryOptions => _deliveryOptions! ;
}

