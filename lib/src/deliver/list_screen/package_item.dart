
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

class PackageItem extends StatelessWidget {
  const PackageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =  COLORS[Random().nextInt(COLORS.length)];
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: color,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Container(
            width: width,
            decoration: const BoxDecoration(
              color:  Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20,bottom: 10, left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("424W-22454" , style: Theme.of(context).textTheme.titleSmall!.copyWith(color: color),),
                SizedBox(height: 14,),
                Text("Bourak" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26),),
                SizedBox(height: 18,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  [
                    const SizedBox(width: 2,),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/icons/package.png")),
                    const SizedBox(width: 8,),
                     const Text("Alger, Mohammadia" ,
                      style:  TextStyle(
                      fontSize: 16,
                        color: Colors.grey
                    ),)
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  const [
                    Icon(Icons.pin_drop_rounded, color: Colors.green,size: 26,),
                     SizedBox(width: 5,),
                    Text("Blida, Blida",
                      style:  TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                      ),)
                  ],
                ),
                SizedBox(height: 20,),
                Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 4,  horizontal: 22),
                          alignment: Alignment.center,
                          child: Text("Sender" , style: TextStyle(color: Colors.white),),
                        ),
                        Container(
                          color: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(vertical: 4,  horizontal: 22),
                          alignment: Alignment.center,
                          child: Text("Deliver 1" , style: TextStyle(color: Colors.white),),
                        ),

                        Column(
                          children: [
                            Container(
                              color: Colors.red,
                              padding: EdgeInsets.symmetric(vertical: 4,  horizontal: 22),
                              alignment: Alignment.center,
                              child: Text("Me" , style: TextStyle(color: Colors.white),),
                            ),
                            SizedBox(height: 4,),
                            Icon(CupertinoIcons.arrowtriangle_up_fill , size: 14,color: Colors.red,),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 22),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                              border: Border.all(color: color , width: 0),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),

                          ),
                          child: Text("Client" , style: TextStyle(color: color,),),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
