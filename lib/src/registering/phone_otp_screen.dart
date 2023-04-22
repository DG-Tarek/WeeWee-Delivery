import 'dart:async';

import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../constant/constant.dart';

class PhoneOTPScreen extends StatefulWidget {
  const PhoneOTPScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<PhoneOTPScreen> createState() => _PhoneOTPScreenState();
}

class _PhoneOTPScreenState extends State<PhoneOTPScreen> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String _verificationId = "";
  final formKey = GlobalKey<FormState>();
  bool _next = false;

  @override
  void initState() {
    verifyPhoneNumber();
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  Future<bool> verifyOTP(String otp) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: _verificationId, smsCode: otp));
    return credential.user != null;
  }

  void verifyPhoneNumber() {
    print(widget.phoneNumber);
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential) {
        _auth.signInWithCredential(authCredential).then((result) {
          setState(() {
            _next = true;
          });
        }).catchError((e) {
          print(e);
        });
      },
      verificationFailed: (FirebaseAuthException authException) {
        print(authException.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 35.h,),
            SizedBox(
              height: 22.h,
              child: Row(
                  children: [
                    Image.asset("assets/icons/logo.png" ,),
                    SizedBox(width: 6,),
                    Text(
                      "WeeWee Delivery Platform",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple , fontWeight: FontWeight.w600),
                    ),
                  ]
              ),
            ),
            SizedBox(height: 35.h,),
            SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Verification Code",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.deepPurple, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16,),
                  Text(
                    "Please enter Code sent to +213 "+widget.phoneNumber.substring(4),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.4),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: height * .05,
            ),
            Container(
              height: 60,
              width: width*.8,
              child: Form(
                key: formKey,
                child: PinCodeTextField(
                  appContext: context,
                  textStyle: TextStyle(),
                  length: 6,
                  obscureText: false,
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,

                  pinTheme: PinTheme(
                      selectedFillColor: Colors.white,
                      inactiveColor: Colors.white,
                      activeColor: Colors.deepPurple,
                      selectedColor: Colors.deepPurple,
                      inactiveFillColor: Colors.white,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      fieldHeight: 60,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      borderWidth: 1),
                  cursorColor: Colors.deepPurple,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [],
                  onCompleted: (v) async {
                    await verifyOTP(v).then((value) {
                      setState(() {
                        _next = value;
                      });
                    });
                  },

                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    return true;
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Text(
              "Resend code in !!!",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.4),

      ),
            Spacer(),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _next ? 1 : 0,
              onEnd: () async {
                print("done");
                /*
                await FirebaseCubit().getAccountFromFirebase();
                if(FirebaseCubit().account == null){
                  Timer(const Duration(milliseconds: 750), () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => InformationScreen()));
                  });
                }else{
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                        (Route<dynamic> route) => false,
                  );
                }*/
              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.deepPurple)),
                alignment: Alignment.center,
                child: Icon(
                  Icons.check,
                  size: 42,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(
              height: height * .2,
            )
          ],
        ),
      ),
    );
  }
}
