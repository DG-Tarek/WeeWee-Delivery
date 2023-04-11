
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

class PackageDetailsScreen extends StatefulWidget {
  const PackageDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PackageDetailsScreen> createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {

  bool _openProcesses = false ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: Text("Package Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
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
                            SizedBox(height: 14,),
                            Text("321424W-22454" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 6,),
                            const Text("Morning (9:00-13:00)",
                              style:  TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54
                              ),),
                           ],
                        ),
                ),
                    ),
                    SizedBox(
                      height: 65,
                      width: 65,
                      child:  Image.asset("assets/icons/qrcode.png"),
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 16),
                    child: Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: width - 135,
                            child: Text("Cle multefunction" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w400 , height: 1.35),)),
                        const SizedBox(height: 8,),
                        const Text("12-12-2012" ,
                          style:  TextStyle(
                              fontSize: 14,
                              color: Colors.grey , fontWeight: FontWeight.w300
                          ),),
                        const SizedBox(height: 12,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Total Price" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.red),),
                          const SizedBox(width: 12,),
                          Text("3200" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),),
                          const SizedBox(width: 4,),
                          Text("DZ" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

                        ],
                      )
                      ],
                    ),

                ),
                  ),
                  Positioned(
                    top: 6,
                    right: 2,
                    height: 100,
                    width: 100,
                    child:  Image.asset("assets/icons/packagelogo.png"),
                  )],
              ),
            ),


            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                SizedBox(width: 3,),
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset("assets/icons/person.png", color: Colors.red,),),

                                const SizedBox(width: 16,),
                                Text("Abdelrahmane" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20 , fontWeight: FontWeight.w400),),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:  [
                                SizedBox(width: 4,),
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset("assets/icons/phone.png", color: Colors.red,),),

                                const SizedBox(width: 16,),
                                const Text("0778854321" ,
                                  style:  TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54
                                  ),)
                              ],
                            ),
                            SizedBox(height: 12,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:  [
                                const SizedBox(width: 4,),
                                SizedBox(
                                    height: 22.5,
                                    width: 22.5,
                                    child: Image.asset("assets/icons/package.png")),
                                const SizedBox(width: 16,),
                                const Text("Alger, Mohammadia" ,
                                  style:  TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54
                                  ),)
                              ],
                            ),
                            const SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 5,),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.45),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),),
                                    ],
                                  ),
                                  child:  Icon(CupertinoIcons.phone_fill,color: Colors.red,size: 26,),
                                ),
                                const SizedBox(width: 24,),
                                Container(
                                  padding: EdgeInsets.symmetric( horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.425),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),),

                                    ],
                                  ),
                                  child:  Icon(Icons.comment,color: Colors.red,size: 26,),
                                ),
                                const SizedBox(width: 24,),
                                Container(
                                  padding: EdgeInsets.symmetric( horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.425),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),),

                                    ],
                                  ),
                                  child:  Icon(CupertinoIcons.location_solid,color: Colors.red,size: 26,),
                                ),



                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 28,
                      child: RotatedBox(
                          quarterTurns: 1,
                          child:  Container(
                            alignment: Alignment.center,
                            child: const Text("Sender", style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),),
                          )),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                SizedBox(width: 1,),
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset("assets/icons/person.png", color: Colors.green,),),

                                const SizedBox(width: 17,),
                                Text("Zakaria" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20 , fontWeight: FontWeight.w400),),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:  [
                                SizedBox(width: 1,),
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset("assets/icons/phone.png", color: Colors.green,),),

                                const SizedBox(width: 17,),
                                const Text("0778854321" ,
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

                                SizedBox(
                                    width: 22.5,
                                    height: 22.5,
                                    child: Image.asset("assets/icons/location.png", color: Colors.green,),),
                                const SizedBox(width: 16,),
                                const Text("Blida, Blida" ,
                                  style:  TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54
                                  ),),

                              ],
                            ),
                            const SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                               SizedBox(width: 5,),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.45),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),),
                                    ],
                                  ),
                                  child:  Icon(CupertinoIcons.phone_fill,color: Colors.green,size: 26,),
                                ),
                                SizedBox(width: 24,),
                                Container(
                                  padding: EdgeInsets.symmetric( horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.425),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),),

                                    ],
                                  ),
                                  child:  Icon(Icons.comment,color: Colors.green,size: 26,),
                                ),
                                const SizedBox(width: 24,),
                                Container(
                                  padding: EdgeInsets.symmetric( horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.425),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(-2, 2),),

                                    ],
                                  ),
                                  child:  Icon(CupertinoIcons.location_solid,color: Colors.green,size: 26,),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 28,
                      child: RotatedBox(
                          quarterTurns: 1,
                          child:  Container(
                            alignment: Alignment.center,
                            child: const Text("Client", style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),),
                          )),),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: (){
                  showModalBottomSheet<void>(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        alignment: Alignment.center,
                        height: height*.4,


                        child: Text(" Package Processes")
                      );
                    },
                  );
                },
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 5,
                        blurRadius: 3,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Text("Processes" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
