
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

class PackageDetailsScreen extends StatefulWidget {
  const PackageDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PackageDetailsScreen> createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Package Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              alignment: Alignment.centerLeft,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                    height: 80,
                      child: Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          SizedBox(height: 12,),
                          const Text("Morning (9:00-13:00)",
                            style:  TextStyle(
                                fontSize: 17,
                                color: Colors.black54
                            ),),
                          SizedBox(height: 10,),
                          Text("321424W-22454" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22, fontWeight: FontWeight.w500),),
                        ],
                      ),
              ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child:  Image.asset("assets/icons/qrcode.png"),
                  ),
                ],
              ),
            ),


            SizedBox(height: 20,),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Cle multefunction  " , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:  [
                            const SizedBox(width: 4,),
                            Icon(Icons.calendar_today, color: Colors.red,size: 22,),
                            const SizedBox(width: 12,),
                            const Text("12-12-2012" ,
                              style:  TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54
                              ),)
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            const SizedBox(width: 4,),
                            Text("DZ" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.red),),
                            const SizedBox(width: 10,),
                            Text("3200" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black54),),

                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child:  Image.asset("assets/icons/packagelogo.png"),
                  ),
                ],
              ),

            ),
            SizedBox(height: 20,),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdelrahmen" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(height: 8,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  [
                              const SizedBox(width: 2,),
                              Icon(CupertinoIcons.phone_circle, size: 26,color: Colors.red,),
                              const SizedBox(width: 10,),
                              const Text("+213 556836200" ,
                                style:  TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54
                                ),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  [
                              const SizedBox(width: 4,),
                              SizedBox(
                                  height: 22.5,
                                  width: 22.5,
                                  child: Image.asset("assets/icons/package.png")),
                              const SizedBox(width: 14,),
                              const Text("Alger, Mohammadia" ,
                                style:  TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54
                                ),)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 36,
                    child: RotatedBox(
                        quarterTurns: 1,
                        child:  Container(
                          alignment: Alignment.center,
                          child: const Text("Sender", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),),
                        )),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Zakaria" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20 , fontWeight: FontWeight.w500),),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  [
                              const SizedBox(width: 2,),
                              Icon(CupertinoIcons.phone_circle, size: 26,color: Colors.green,),
                              const SizedBox(width: 8,),
                              const Text("+213 778854321" ,
                                style:  TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54
                                ),)
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              const SizedBox(width: 2,),
                              Icon(Icons.pin_drop_rounded, color: Colors.green,size: 26,),
                              const SizedBox(width: 12,),
                              const Text("Blida, Blida" ,
                                style:  TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54
                                ),),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 36,
                    child: RotatedBox(
                        quarterTurns: 1,
                        child:  Container(
                          alignment: Alignment.center,
                          child: const Text("Client", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),),
                        )),),
                ],
              ),
            ),

            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
