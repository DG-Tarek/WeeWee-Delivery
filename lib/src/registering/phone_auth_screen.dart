
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/registering/phone_otp_screen.dart';

import '../constant/constant.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Verify Your Number",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.deepPurple, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16,),
                Text(
                  "Please enter your Phone Number, We will send you a confirmation code.",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.4),
                ),
              ],
            ),

            SizedBox(
              height: height * .05,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)),),
                  child: Text(
                    "+213",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(width: 12,),
                SizedBox(
                  width: 130,
                  child: SizedBox(
                    width: 130,
                    child:  TextField(
                      maxLength: 9,
                      onChanged: (_)=>setState(() {}),
                      keyboardType: TextInputType.number,
                      controller: _controller,
                      decoration:  InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          hintText: '556836200',
                          labelStyle: Theme.of(context).textTheme.titleMedium
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),),
              ],
            ),
            Spacer(),
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _controller.text.length == 9 ? 1 : 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => PhoneOTPScreen(
                          phoneNumber: "+213" + _controller.text)));
                },
                child: Container(
                  height: 85.w,
                  width: 400.w,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    border: Border.all(color: Colors.deepPurple , width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(24.w)),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 64.w),
                  child: Text("Next" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                ),
              ),
            ),
            SizedBox(
              height: height * .15,
            )
          ],
        ),
      ),
    );
  }
}
