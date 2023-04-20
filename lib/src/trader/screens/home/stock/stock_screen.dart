
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(CupertinoIcons.collections, size: 30,color: Colors.white,),
            SizedBox(width: 12,),
            Text("Stock"),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          StockItem(),
          StockItem(),
          StockItem(),
        ],
      ),
    );
  }
}
class StockItem extends StatelessWidget {
  const StockItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =  COLORS[Random().nextInt(COLORS.length)];
    return  Padding(
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
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
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
                       Spacer(),
                        Text("Stock" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.red),),
                        const SizedBox(width: 8,),
                        Text("23 / 5" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.brown),),

                      ],
                    ),


                  ],
                ),

              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 2,
            height: 80,
            width: 80,
            child:  Image.asset("assets/icons/packagelogo.png"),
          )],
      ),

    );
  }
}
