

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';



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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: width,
                  padding: EdgeInsets.only(left: 16, top: 8,bottom: 8,right: 8),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            crossAxisAlignment:  CrossAxisAlignment.start,
                            children:  [

                              Spacer(),

                              const Text("12-12-2012" ,
                                style:  TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54 , fontWeight: FontWeight.w400
                                ),),
                              const SizedBox(height: 10,),
                              Text("321424W-22454" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),),
                              const SizedBox(height: 8,),
                              const Text("Morning (9:00-13:00)",
                                style:  TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54
                                ),),
                              const SizedBox(height: 9,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 65,
                          width: 65,
                          child: Image.asset("assets/icons/pickedup.png" , color: Colors.teal,)),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 5,),

              Padding(
                padding: const EdgeInsets.only(left:16.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0, right: 16),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
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

                            const SizedBox(height: 16,),
                            SizedBox(
                              width: width - 110,
                              child: const Text("To switch to da w route, use the .push() method. The push() method adds a Route to the stack of routes managed. " ,
                                style:  TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey , fontWeight: FontWeight.w300
                                ),),
                            ),
                            const SizedBox(height: 14,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Price" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.red),),
                                const SizedBox(width: 12,),
                                Text("3200" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),),
                                const SizedBox(width: 4,),
                                Text("DZ" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 22,
                      height: 80,
                      width: 80,
                      child:  Image.asset("assets/icons/packagelogo.png"),
                    )],
                ),
              ),


              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.teal,
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
                          SizedBox(width: 3,),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(24)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text("AbdelMoumen " , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22 , fontWeight: FontWeight.w400),),

                                  const SizedBox(height: 12,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children:  [
                                      const SizedBox(width: 4,),
                                      SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: Image.asset("assets/icons/phone.png", color: Colors.teal,),),

                                      const SizedBox(width: 16,),
                                      const Text("0778854321" ,
                                        style:  TextStyle(
                                            fontSize: 15.5,
                                            color: Colors.black54
                                        ),)
                                    ],
                                  ),
                                  SizedBox(height: 12,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children:  [
                                      const SizedBox(width: 3,),
                                      SizedBox(
                                        width: 17.5,
                                        height: 17.5,
                                        child: Image.asset("assets/icons/location.png", color: Colors.teal,),),
                                      const SizedBox(width: 16,),
                                      const Text("Blida, Blida" ,
                                        style:  TextStyle(
                                            fontSize: 15.5,
                                            color: Colors.black54
                                        ),),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 3,),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: 5,),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                          child:  Icon(CupertinoIcons.phone_fill,color: Colors.teal,size: 26,),
                        ),
                        SizedBox(width: 24,),
                        Container(
                          padding: EdgeInsets.symmetric( horizontal: 20, vertical: 12),
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
                          child:  Icon(Icons.comment,color: Colors.teal,size: 26,),
                        ),
                        const SizedBox(width: 24,),
                        Container(
                          padding: EdgeInsets.symmetric( horizontal: 20, vertical: 12),
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
                          child:  Icon(CupertinoIcons.location_solid,color: Colors.teal,size: 26,),
                        ),
                        SizedBox(width: 8,),
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Container(
                alignment: Alignment.centerRight,
                width: width,
                child: Padding(
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


                              child: Text(" Report this package")
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      //alignment: Alignment.center,
                      decoration:  BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.report_gmailerrorred, color: Colors.white,),
                          SizedBox(width: 6,),
                          Text("Report this Package" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                          SizedBox(width: 4,),
                        ],
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24,),

            ],
          ),
        )
    );
  }
}
