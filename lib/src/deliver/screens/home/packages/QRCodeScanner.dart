import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit.dart';

 

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key, this.event = "confirming"}) : super(key: key);
  final String event ;
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
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
    DeliverFirebaseCubit().setSelectedQRCode("");
  }

  bool _stop = false ;
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
          if(_stop)
          Positioned(
            bottom: 40,
            child: GestureDetector(
              onTap: (){
                if(widget.event == "pickingUp"){
                  DeliverFirebaseCubit().setPickedUpQRCode(result!.code);
                  Navigator.of(context).pop();
                }else if(widget.event == "")
                {
                  DeliverFirebaseCubit().setPickedUpQRCode(result!.code);
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                height: 46,
                width: width*.6,
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.deepPurple , width: 0),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16 ),
                child: Text("Confirm" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
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
          borderColor: Colors.white,

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
      });

    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.deepPurple,
            content: Center(child: Text('\nNo Permission'))),
      );
    }
    //remove this btw
    DeliverFirebaseCubit().pickUpScannedPackage();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}