

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
  return  Scaffold(

        appBar: AppBar(
          title: Text("Package Details"),
          backgroundColor: stateC,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16,),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 36,left: 16, right: 16,bottom: 12),
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
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,

                          children:  [
                            const SizedBox(height: 16 ,),
                            Text(widget.package.id! , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),),
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
                            const SizedBox(height: 16,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(widget.package.packageState == "delivered+" || widget.package.packageState == "returned+")
                          Container(
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.only(top: 12, left: 8 ,right: 7),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: Offset(-1, 2),
                                  ),
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "assets/icons/logo.png", color: Colors.deepPurple,)),

                        const SizedBox(width: 15,),
                        Column(
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                padding: EdgeInsets.only(top: 6, left: 8, bottom: 6),
                                decoration: BoxDecoration(
                                  color: stateC,
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(-1, 2),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  stateF, color: Colors.white,)),
                            if(widget.package.isFreeDelivery)...[
                              const SizedBox(height: 12,),
                              Container(
                                  height: 60,
                                  width: 60,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(-1, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text("FREE" ,textAlign: TextAlign.center, style:  TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                                      Text("Delivery" ,textAlign: TextAlign.center, style:  TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),),
                                      SizedBox(height: 2,)
                                    ],
                                  )),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  if(widget.package.closedPackage)
                    Positioned(
                      top: 47.5,
                      right: 77.5,
                      child: Container(
                          height: 65,
                          width: 65,
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            "assets/icons/closed.png",)),
                    ),
                ],
              ),
            const SizedBox(height: 5,),
              if(widget.package.coment.isNotEmpty)...[
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0,left: 16,right: 16),
                      child: Container(
                        padding: EdgeInsets.only(left: 3),
                        decoration: BoxDecoration(
                          color: stateC,
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
                          padding: const EdgeInsets.only(top: 18 , left: 20,right: 60,bottom: 18),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                          child: Text(widget.package.coment),

                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 8,
                      height: 60,
                      width: 60,
                      child:  Container(
                          padding: const EdgeInsets.only(top: 10,right: 4,left: 4, bottom: 10),
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
                          child: Image.asset("assets/icons/coment.png")),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
              ],
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
                          color: stateC,
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
                                      color: Colors.black54, fontWeight: FontWeight.w400
                                  )),
                              const SizedBox(height: 25,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children:  [
                                  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset("assets/icons/package.png")),
                                  const SizedBox(width: 8,),
                                  Text("Pick Up", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.orange),),
                                  const Spacer(),
                                   Text("${widget.package.senderWilaya}, ${widget.package.senderBaladia}" ,
                                    style:  const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54),)
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(children: [
                                const SizedBox(width: 1,),
                                SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset("assets/icons/logo.png")),
                                const SizedBox(width: 7,),
                                Text("New Stock", style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.deepPurple),),
                                const Spacer(),
                                Text(widget.package.productNewStockState, style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54
                                ),),
                              ],),
                              const SizedBox(height: 25,),
                              widget.package.packageState == "returned+" || widget.package.packageState == "returned"?
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Price", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: stateC),),
                                  const SizedBox(width: 12,),
                                  Text(widget.package.productPrice.toString(), style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black87),),
                                  if (widget.package.packageState == "returned+" || widget.package.packageState == "returned")...[
                                    const SizedBox(width: 8,),
                                    Text("0.0", style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87),),
                                  ],
                                  const SizedBox(width: 4,),
                                  Text("DZ", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87),),
                                  const Spacer(),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset(
                                      "assets/icons/delivery-truck-return.png", color: Colors.red,),),
                                  const SizedBox(width: 8,),
                                  Text("150.0", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),),
                                  const SizedBox(width: 4,),
                                  Text("DZ", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87),),
                                ],
                              ):
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Price", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: stateC),),
                                  const SizedBox(width: 12,),
                                  Text(widget.package.isFreeProduct ? "0.0":widget.package.productPrice.toString(), style: Theme
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
                                  const Spacer(),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset(
                                      "assets/icons/delivery-cost.png", color: Colors.deepPurple,),),
                                  const SizedBox(width: 8,),
                                  Text(widget.package.deliveryCost.toString(), style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),),
                                  const SizedBox(width: 4,),
                                  Text("DZ", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87),),
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
                          child: Image.asset("assets/icons/packagelogo.png"),
                        ))],
                ),
              ),
              const SizedBox(height: 5,),
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
                            color: stateC,
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
                                      child: Image.asset("assets/icons/phone.png", color: stateC,),),

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
                                        child: Image.asset("assets/icons/phone.png", color: stateC,),),
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
                                      child: Image.asset("assets/icons/location.png", color: stateC,),),
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
            ],
          ),
        )
    );
  }


  String stateFlag() {

    switch(widget.package.packageState){
      case "online":
        return "assets/icons/online.png";
      case "pickup":
        return "assets/icons/pickup.png";
      case "onroad":
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
        return Colors.purple;
      case "onhold":
        return Colors.purple;
      case "pickedup":
        return Colors.blue;
      case "onroad":
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
