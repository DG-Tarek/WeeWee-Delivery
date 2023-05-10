

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
    final double price = widget.package.productPrice+widget.package.deliveryCost;
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
                            Text("id" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 10,),
                            Text( widget.package.preferredDeliveryDay.split(" ")[0] ,
                              style:  const TextStyle(
                                  fontSize: 16,
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
                                  width: width - 120,
                                  child: Text(widget.package.productName*3, style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      height: 1.35),)),

                              const SizedBox(height: 20,),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset("assets/icons/store.png", color: Colors.deepPurple,)),
                                  const SizedBox(width: 10,),
                                  Text("Store Name", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.deepPurple),),
                                  const Spacer(),
                                  Text(widget.package.productNewStockState, style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54
                                  ),),
                                ],),
                              const SizedBox(height: 12,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children:  [
                                  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset("assets/icons/package.png")),
                                  const SizedBox(width: 10,),
                                  Text("Pick Up", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.orange),),
                                  const Spacer(),
                                  Text("${widget.package.senderWilaya}, ${widget.package.senderBaladia}" ,
                                    style:  const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54),)
                                ],
                              ),
                              const SizedBox(height: 12,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children:  [
                                  const SizedBox(width: 4,),
                                  SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: Image.asset("assets/icons/phone.png", color: stateC,),),

                                  const SizedBox(width: 10,),
                                  Text("Contact", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: stateC),),
                                  const Spacer(),
                                  Text(widget.package.clientPhoneNumber ,
                                    style: const  TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54
                                    ),)
                                ],
                              ),

                              const SizedBox(height: 30,),
                              widget.package.packageState == "returned+" || widget.package.packageState == "returned"?
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Price", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: stateC),),


                                  const Spacer(),
                                  Text( price.toString(), style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87),),
                                  const SizedBox(width: 8,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text("DZ", style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87),),
                                  ),
                                ],
                              ):
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Price", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: stateC),),

                                  const Spacer(),
                                  Text( price.toString(), style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87),),
                                  const SizedBox(width: 8,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text("DZ", style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87),),
                                  ),

                                ],
                              ),
                              const SizedBox(height: 25,),
                              SizedBox(
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(16)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(-2, 2),
                                          ),
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(2, 2),),
                                        ],
                                      ),
                                      child:  Icon(CupertinoIcons.phone_fill,color: stateC,size: 26,),
                                    ),

                                    Container(
                                      padding: EdgeInsets.symmetric( horizontal: 20, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(16)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(-2, 2),
                                          ),
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(2, 2),),


                                        ],
                                      ),
                                      child:  Icon(Icons.comment,color: stateC,size: 26,),
                                    ),

                                    Container(
                                      padding: EdgeInsets.symmetric( horizontal: 20, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(16)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(-2, 2),
                                          ),
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(2, 2),),

                                        ],
                                      ),
                                      child:  Icon(CupertinoIcons.location_solid,color: stateC,size: 26,),
                                    ),

                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
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
                                      width: 18,
                                      height: 18,
                                      child: Image.asset("assets/icons/phone.png", color: stateC,),),

                                    const SizedBox(width: 16,),
                                    Text(widget.package.clientPhoneNumber ,
                                      style: const  TextStyle(
                                          fontSize: 16,
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
                                        width: 18,
                                        height: 18,
                                        child: Image.asset("assets/icons/phone.png", color: stateC,),),
                                      const SizedBox(width: 16,),
                                      Text(widget.package.clientOptionalPhoneNumber! ,
                                        style: const  TextStyle(
                                            fontSize: 16,
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
                                      width: 20,
                                      height: 20,
                                      child: Image.asset("assets/icons/location.png", color: stateC,),),
                                    const SizedBox(width: 16,),
                                    Text("${widget.package.clientWilaya} , ${widget.package.clientBaladia}" ,
                                      style:  const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54
                                      ),),
                                  ],
                                ),
                                const SizedBox(height: 35,),
                                SizedBox(
                                  width: width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(16)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade200,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(-2, 2),
                                            ),
                                            BoxShadow(
                                              color: Colors.grey.shade200,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(2, 2),),
                                          ],
                                        ),
                                        child:  Icon(CupertinoIcons.phone_fill,color: stateC,size: 26,),
                                      ),

                                      Container(
                                        padding: EdgeInsets.symmetric( horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(16)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade200,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(-2, 2),
                                            ),
                                            BoxShadow(
                                              color: Colors.grey.shade200,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(2, 2),),


                                          ],
                                        ),
                                        child:  Icon(Icons.comment,color: stateC,size: 26,),
                                      ),

                                      Container(
                                        padding: EdgeInsets.symmetric( horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(16)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade200,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(-2, 2),
                                            ),
                                            BoxShadow(
                                              color: Colors.grey.shade200,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(2, 2),),

                                          ],
                                        ),
                                        child:  Icon(CupertinoIcons.location_solid,color: stateC,size: 26,),
                                      ),

                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5,),

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

              const SizedBox(height: 60,),
            ],
          ),
        )
    );
  }


  String stateFlag() {

    switch(widget.package.packageState){
      case "online":
        return "assets/icons/online.png";
      case "pickUp":
        return "assets/icons/pickup.png";
      case "onRoad":
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
      case "pickUp":
        return Colors.blue;
      case "onRoad":
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

