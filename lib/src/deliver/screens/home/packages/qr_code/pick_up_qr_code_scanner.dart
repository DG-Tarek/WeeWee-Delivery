import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit.dart';



class QRViewPickUp extends StatefulWidget {
  QRViewPickUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewPickUpState();
}

class _QRViewPickUpState extends State<QRViewPickUp> {



  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  bool _stop = false ;
  String _state = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pick Up Scaner"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildQrView(context),

          Positioned(
            top: 24,
            right: 24,
            child: GestureDetector(
                onTap: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                child: Container(
                    padding: const EdgeInsets.only(right: 16,left: 16,top: 18,bottom: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child:
                    FutureBuilder(
                        future: controller?.getFlashStatus(),
                        initialData: false,
                        builder: (context, snapshot) {
                          return Icon(snapshot.data ?? false ? Icons.flash_on_sharp : Icons.flash_off, color: Colors.deepPurple,size: 26,);
                        }
                    ))),
          ),
          if(_stop)
            Positioned(
                top: height*.175,
                child: Text(result!.code.toString(), style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600, fontSize: 27
                ),)),

          if(_stop && (_state=="Picked"))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5,),
                Container(
                    height: 85,
                    width: 85,
                    padding:   const EdgeInsets.only(left: 14, right: 4),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(12)),

                    ),
                    child: Image.asset(
                      "assets/icons/pickup.png", color: Colors.white,)),

                const SizedBox(height: 12,),
                Text("Picked Up",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.teal),)
              ],
            ),
          if(_stop && (_state == "AlreadyPicked"))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5,),
                Container(
                    height: 85,
                    width: 85,
                    padding:   const EdgeInsets.only(left: 14, right: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(12)),

                    ),
                    child: Image.asset(
                      "assets/icons/pickup.png", color: Colors.white,)),

                const SizedBox(height: 12,),
                Text("Already Picked",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.orange),)
              ],
            ),
          if(_stop && (_state == "Unpicked"))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5,),
                Container(
                    height: 85,
                    width: 85,
                    padding:   const EdgeInsets.only(left: 14, right: 4),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(Radius.circular(12)),

                    ),
                    child: Image.asset(
                      "assets/icons/warning.png", color: Colors.white,)),

                const SizedBox(height: 12,),
                Text("Unpicked",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.deepOrange),)
              ],
            ),
          if(_stop)
            Positioned(
              bottom: height*.075,
                height: 60,
                width: width*.5,
                child: DeliverFirebaseCubit().pickUpPackages > 0 ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: ()=> Navigator.of(context).pop(),
                              child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                          color:  Colors.white,
                                          shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.close, color: Colors.red,size: 30,),
                                        ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator
                                    .of(context)
                                    .pushReplacement( MaterialPageRoute(builder: (BuildContext context) => QRViewPickUp()));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 10),
                                decoration: const BoxDecoration(
                                  color:  Colors.deepPurple,
                                  borderRadius:  BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Icon(CupertinoIcons.refresh_bold, color: Colors.white,size: 30,),
                              ),
                            ),
      ],
    ):
                GestureDetector(
                  onTap: ()=> Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color:  Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, color: Colors.red,size: 30,),
                  ),
                ),
            )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        //overlayColor: Colors.black.withOpacity(.65),
          borderColor: Colors.deepPurple,
          borderRadius: 25,
          borderLength: 45,
          borderWidth: 12,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      controller.stopCamera();
      _stop = true;
      await DeliverFirebaseCubit().pickUpScannedPackage(pickedUpQRCode: result!.code )
          .then((exist){
        _state = exist;
        setState(() {
        });
      });


    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    /* if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.deepPurple,
            content: Center(child: Text('\nNo Permission'))),
      );
    }*/
    //remove this btw
    //DeliverFirebaseCubit().pickUpScannedPackage();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}