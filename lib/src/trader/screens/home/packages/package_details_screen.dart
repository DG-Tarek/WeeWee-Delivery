

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';
import '../../../../moduls/shared/package_model.dart';



class PackageDetailsScreen extends StatefulWidget {
  const PackageDetailsScreen({Key? key, required this.package}) : super(key: key);
  final Package package;
  @override
  State<PackageDetailsScreen> createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final String stateF = stateFlag();
    final Color stateC = stateColor();
    final color = COLORS[Random().nextInt(COLORS.length)];
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                              Text(widget.package.id! , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),),
                              const SizedBox(height: 10,),
                               Text( widget.package.preferredDeliveryDay.split(" ")[0] ,
                                style:  const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54 , fontWeight: FontWeight.w400
                                ),),
                              const SizedBox(height: 10,),
                               Text(widget.package.preferredDeliveryTime,
                                style:  TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54
                                ),),
                              const SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 65,
                          width: 65,
                          child: Image.asset(stateF , color: stateC,)),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 12),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16),
                      child: Container(
                        padding: EdgeInsets.only(left: 3),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: width - 40,
                                  child: Text(widget.package.productName, style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      height: 1.35),)),

                              const SizedBox(height: 16,),
                              Text(widget.package.productDescription,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey, fontWeight: FontWeight.w300
                                  )),
                              const SizedBox(height: 14,),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Price", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.red),),
                                  const SizedBox(width: 12,),
                                  Text(widget.package.productPrice.toString(), style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),),
                                  const SizedBox(width: 4,),
                                  Text("DZ", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87),),
                                  Spacer(),
                                  Text("Stock After Selection", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.red),),
                                  const SizedBox(width: 8,),
                                  Text(widget.package.productNewStockState, style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.brown),),

                                ],
                              ),


                            ],
                          ),

                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        right: 8,
                        height: 60,
                        width: 60,
                        child: Container(

                          padding: const EdgeInsets.only(left: 5,right: 7,top: 8,bottom: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, -2),
                              ),
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(2, 0),
                              ),
                              const BoxShadow(
                                color: Colors.white,
                                spreadRadius: 3,
                                blurRadius: 0,
                                offset: Offset(-2, 2),),
                            ],
                          ),
                          child: Image.asset("assets/icons/packagelogo.png"),
                        ))],
                ),
              ),

              const SizedBox(height: 10,),

              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 3),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: Offset(3, 3),
                              ),
                            ],
                          ),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.package.clientFullName , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22 , fontWeight: FontWeight.w400),),

                                const SizedBox(height: 20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children:  [
                                    const SizedBox(width: 7,),
                                    SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: Image.asset("assets/icons/phone.png", color: color,),),

                                    const SizedBox(width: 16,),
                                    Text(widget.package.clientPhoneNumber ,
                                      style: const  TextStyle(
                                          fontSize: 15.5,
                                          color: Colors.black54
                                      ),)
                                  ],
                                ),
                                if(widget.package.clientOptionalPhoneNumber!.isNotEmpty)...[
                                  SizedBox(height: 12,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children:  [
                                      const SizedBox(width: 7,),
                                      SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: Image.asset("assets/icons/phone.png", color: color,),),
                                      const SizedBox(width: 16,),
                                      Text(widget.package.clientOptionalPhoneNumber! ,
                                        style: const  TextStyle(
                                            fontSize: 15.5,
                                            color: Colors.black54
                                        ),)
                                    ],
                                  ),
                                ],
                                SizedBox(height: 20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children:  [
                                    const SizedBox(width: 6,),
                                    SizedBox(
                                      width: 17.5,
                                      height: 17.5,
                                      child: Image.asset("assets/icons/location.png", color: color,),),
                                    const SizedBox(width: 16,),
                                    Text("${widget.package.clientWilaya} , ${widget.package.clientBaladia}" ,
                                      style:  const TextStyle(
                                          fontSize: 15.5,
                                          color: Colors.black54
                                      ),),
                                  ],
                                ),


                              ],
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 8,
                    height: 60,
                    width: 60,
                    child:  Container(
                        padding: const EdgeInsets.only(bottom: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow:  <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, -2),
                            ),
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(2, 0),
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              spreadRadius: 3,
                              blurRadius: 0,
                              offset: Offset(-2, 2),),
                          ],
                        ),
                        child: Icon(Icons.person, color: Colors.deepPurple,size: 50,)),
                  )
                ],
              ),
              SizedBox(height: 50,),
              Container(
                width: width,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 16),
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
                      color: Colors.orange,
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

            ],
          ),
        )
    );
  }


  String stateFlag() {

    switch(widget.package.packageState){
      case "online":
        return "assets/icons/pickup.png";
      case "pickup":
        return "assets/icons/pickup.png";
      case "inroad":
        return "assets/icons/inroad.png";
      case "delivered":
        return "assets/icons/approved.png";
      case "delivered+":
        return "assets/icons/approved.png";
      case "returned":
        return "assets/icons/returned.png";
      case "returned+":
        return "assets/icons/returned.png";

    }
    return " error";
  }

  Color stateColor() {
    switch(widget.package.packageState){
      case "online":
        return Colors.teal;
      case "pickup":
        return Colors.teal;
      case "inroad":
        return Colors.teal;
      case "delivered":
        return Colors.green;
      case "delivered+":
        return Colors.green;
      case "returned":
        return Colors.red;
      case "returned+":
        return Colors.red;
    }
    return Colors.black;
  }
}
