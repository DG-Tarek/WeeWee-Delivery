
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/moduls/shared/package_model.dart';
import 'package:weewee_delivery/src/moduls/trader/delivery_options_model.dart';
import 'package:weewee_delivery/src/moduls/trader/product_history_model.dart';
import 'package:weewee_delivery/src/moduls/trader/weewee_wallet_model.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit_states.dart';

import '../../moduls/trader/product_model.dart';
import '../../moduls/trader/client_model.dart';



class TraderFirebaseCubit extends Cubit<TraderFirebaseCubitState> {
  static final TraderFirebaseCubit _instance = TraderFirebaseCubit._internal();
  TraderFirebaseCubit._internal() : super(CreateTraderFirebaseBlocState());
  factory TraderFirebaseCubit() {
    return _instance;
  }
  final String _uid = "kF6ffq2JGtlLESh0L7cw" ;

  List<Client> _clientsList = [];

  List<Product> _productsList = [];

  List<Package> _packagesList = [];

  double _incomeMoney = 0;
  double _totalPrice = 0;
  int _deliveredPackages = 0;
  int _returnedPackages = 0;
  int _deliveredPackagesReadyToReceive = 0;
  int _returnedPackagesReadyToReceive = 0;
  double _walletDeliveredCost = 0 ;
  double _walletReturnedCost = 0 ;

  List<Package> _readyPackagesToReceive = [];



  List<Package> _packagesListByDay = [];
  List<ProductHistory> _productHistory = [];

  Client? _firstClientChoice ;
  Client? _secondClientChoice ;

  Product? _firstProductChoice ;
  Product? _secondProductChoice ;

  DeliveryOptions? _deliveryOptions ;

  bool _freeProduct = false;
  // this when you create a new order;
  double _productPrice = 0;
  // this for calcullate the price based on the distance beetwin sender and reciever
  double _deliveryCost = 0;

  List<WeeWeeWallet> _walletList = [] ;
  List<Package> _walletPackagesListHistory = [] ;



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
        packageCreatedDay: "$_uid@DAY#$date",
            savedCollection: path,//find package by day (this is related to the calender screen)
        packageState: "online",
        closedPackage: false,
        isFreeDelivery: _deliveryOptions!.isFreeDelivery,
        isFreeProduct: _deliveryOptions!.isFreeProduct,
        preferredDeliveryDay: _deliveryOptions!.preferredDeliveryDay,
        preferredDeliveryTime: _deliveryOptions!.preferredDeliveryTime,
        deliveryCost: _deliveryOptions!.deliveryCost,
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
        productNewStockState: "$stock / $minStock",
          coment: _deliveryOptions!.coment,
        );
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
      savedCollection: path,
      packageState: "online",
      closedPackage: false,
      isFreeDelivery: _deliveryOptions!.isFreeDelivery,
      isFreeProduct: _deliveryOptions!.isFreeProduct,
      preferredDeliveryDay: _deliveryOptions!.preferredDeliveryDay,
      preferredDeliveryTime: _deliveryOptions!.preferredDeliveryTime,
      deliveryCost: _deliveryOptions!.deliveryCost,
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
      productNewStockState:"The Product has not been shipped from The Stock.",
      coment: _deliveryOptions!.coment,
  );

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
      _incomeMoney = 0;
      _totalPrice = 0;
      _deliveredPackages = 0;
      _returnedPackages = 0;
      _returnedPackagesReadyToReceive=0;
      _deliveredPackagesReadyToReceive = 0;
      _walletDeliveredCost = 0 ;
      _walletReturnedCost = 0 ;
      _readyPackagesToReceive.clear();
      double returnCost = 150;
      for (var doc in value.docs) {
        final Package package = Package.fromJson(doc.data())..id = doc.id;
        if(!package.closedPackage){
          switch(package.packageState){
            case "delivered+":
              {
                _deliveredPackages +=1;
                _deliveredPackagesReadyToReceive +=1;
                _totalPrice += package.productPrice;
                _walletDeliveredCost += package.deliveryCost;
                _incomeMoney += (package.productPrice - package.deliveryCost);
                _readyPackagesToReceive.add(package);
              }
              break;
            case "delivered":
              {
                _deliveredPackages +=1;
                break;
              }
            case "returned+":
              {
                _returnedPackages+=1;
                _returnedPackagesReadyToReceive +=1;
                _walletReturnedCost += returnCost;
                _incomeMoney -= returnCost;
                _readyPackagesToReceive.add(package);
              }
              break;
            case "returned":
              {
                _returnedPackages+=1;
                break;
              }
          }
        }

        _packagesList.add(package);
      }
      emit(GetPackagesSuccessfullyState());
    });
  }


  double get incomeMoney => _incomeMoney;
  double get totalPrice => _totalPrice;
  double get walletDeliveryCost => _walletDeliveredCost;
  double get walletReturnedCost => _walletReturnedCost;
  int get deliveredPackages => _deliveredPackages;
  int get deliveredPackagesReadyToReceive => _deliveredPackagesReadyToReceive;
  int get returnedPackagesReadyToReceive => _returnedPackagesReadyToReceive;
  int get returnedPackages => _returnedPackages;

  List<Package> get packagesList => _packagesList ;
  List<Package> get readyPackagesToReceive => _readyPackagesToReceive ;







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







  Future<void> newWeeWeeWallet()async{
    final String receivedDay = DateFormat.yMMMd().format(DateTime.now());
    emit(NewWeeWeeWalletLoadingState());
    List<String> packages = [];
    for(Package package in _readyPackagesToReceive){
      packages.add(package.savedCollection!+"@COLLECTION#"+package.id!);
      await FirebaseFirestore.instance.collection(package.savedCollection).doc(package.id).update({"closedPackage":true});
      }
    final WeeWeeWallet weeWeeWallet = WeeWeeWallet(
        createdAt: createdTime(),
        receivedDay: receivedDay,
        confirmed: false,
        moneyReceiverFullName: "Select by Admin",
        totalPrice: _totalPrice,
        moneyReceived: _incomeMoney,
        numberOfPackages: _readyPackagesToReceive.length,
        numberOfDeliveredPackages: _deliveredPackagesReadyToReceive,
        numberOfReturnedPackages: _returnedPackagesReadyToReceive,
        deliveryCost: _walletDeliveredCost,
        returnCost: _walletReturnedCost,
      packages: packages,
   );

    await FirebaseFirestore.instance.collection('test_users')
        .doc(_uid).collection("wallet").add(weeWeeWallet.toJson())
        .then((value)  {
      emit(NewWeeWeeWalletSuccessfullyState());
    }
    );

  }








  Future<void> getMyWeeWeeWallet() async {
    emit(GetWeeWeeWalletLoadingState());
    await FirebaseFirestore.instance.collection("test_users").doc(_uid).collection("wallet").get().then((value) {
      _walletList.clear();
      for (var doc in value.docs) {
        _walletList.add(WeeWeeWallet.fromJson(doc.data())..id = doc.id);
      }
      emit(GetWeeWeeWalletSuccessfullyState());
    });
  }

  List<WeeWeeWallet> get walletList => _walletList;


  Future<void> getWalletPackagesListHistory(
      {required WeeWeeWallet wallet}
      ) async {
    emit(GetWalletPackagesListHistoryLoadingState());
    _walletPackagesListHistory.clear();
    for(String package in wallet.packages){
      final List<String> path = package.split("@COLLECTION#");
      await FirebaseFirestore.instance.collection(path[0]).doc(path[1]).get().then((value) {
        _walletPackagesListHistory.add(Package.fromJson(value.data()!)..id = value.id);
        emit(GetProductHistorySuccessfullyState());
      });
    }
  }

  List<Package> get walletPackagesListHistory => _walletPackagesListHistory;
}

