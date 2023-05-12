import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit.dart';

import '../../../../moduls/shared/package_model.dart';

 

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
    // DeliverFirebaseCubit().setPickedUpQRCode("");
  }

  bool _stop = false ;
  bool _confirmed = false;

  @override
  Widget build(BuildContext context) {
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
          Positioned(
            bottom: 50,
            width: width *.65,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _stop?1:0,
              onEnd: () async {
                if(_confirmed){
                  await DeliverFirebaseCubit().changePackageState(
                      packageID: widget.package.id!,
                      savedCollection: widget.package.savedCollection,
                      packageNewState: widget.event).then((value) => Navigator.of(context).pop());
                }else{
                  Navigator.of(context).pop();
                }
              },
              child: _confirmed ?
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Package Confirmed", style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),),
                    Icon(Icons.verified, color: Colors.white,),

                  ],
                ),
              ):
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Wrong Package", style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),),
                    const Icon(Icons.warning_outlined, color: Colors.white,),
                  ],
                ),
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
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        //overlayColor: Colors.black.withOpacity(.65),
          borderColor: Colors.black,
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
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.stopCamera();
        _stop = true;
        _confirmed = (result == widget.package!.id!);
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