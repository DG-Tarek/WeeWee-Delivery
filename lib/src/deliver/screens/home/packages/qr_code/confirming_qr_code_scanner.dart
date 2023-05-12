import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit.dart';

import '../../../../../moduls/shared/package_model.dart';

 

class QRViewConfirming extends StatefulWidget {
  QRViewConfirming({Key? key,required this.package, required this.event}) : super(key: key);
  final String event ;
  final Package package;
  @override
  State<StatefulWidget> createState() => _QRViewConfirmingState();
}

class _QRViewConfirmingState extends State<QRViewConfirming> {



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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   }

  bool _stop = false ;
  bool _confirmed = false ;

  @override
  Widget build(BuildContext context) {
    final Color color = stateColor();
    final String flag = stateFlag();
    final String state = stateName();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Package Scaner"),
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
              top: height*.2,
                child: Text(result!.code.toString(), style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600, fontSize: 27
                ),)),
          if(_stop)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5,),
                Container(
                    height: 85,
                    width: 85,
                    padding:   const EdgeInsets.only(left: 14, right: 4),
                    decoration: BoxDecoration(
                      color: _confirmed?color:Colors.deepOrange,
                      borderRadius: BorderRadius.all(Radius.circular(12)),

                    ),
                    child: Image.asset(
                      _confirmed?flag:"assets/icons/warning.png", color: Colors.white,)),

                const SizedBox(height: 12,),
                Text(_confirmed?state:"Wrong Package",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: _confirmed ? color : Colors.deepOrange),)
              ],

            ),
          if(_stop)
            Positioned(
              bottom: height*.075,
              height: 60,
              width: width*.5,
              child:
              GestureDetector(
                onTap: ()=> Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color:  Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child:  Icon(Icons.close, color: _confirmed?color:Colors.deepOrange,size: 30,),
                ),
              ),
            )

        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
  return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
     borderColor: Colors.deepPurple,
          borderRadius: 25,
          borderLength: 45,
          borderWidth: 12,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async  {
        _stop = true;
        result = scanData;
        controller.stopCamera();
        if(result!.code == widget.package.id!){
          _confirmed = true ;
          await DeliverFirebaseCubit().changePackageState(
              packageID: widget.package.id!,
              savedCollection: widget.package.savedCollection,
              packageNewState: widget.event);
        }
        setState(() {});


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


  String stateFlag() {
    switch(widget.event){
      case "delivered":
        return "assets/icons/approved.png";
      case "returned":
        return "assets/icons/returned.png";
    }
    return " error";
  }

  String stateName(){
    switch(widget.event){
      case "delivered":
        return "Delivered";
      case "returned":
        return "Returned";
    }
    return "";
  }
  Color stateColor() {
    switch(widget.event){
      case "delivered":
        return Colors.green;
      case "returned":
        return Colors.red;
    }
    return Colors.black;
  }
}