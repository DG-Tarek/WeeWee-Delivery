
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(CupertinoIcons.person_2, size: 34,color: Colors.white,),
              SizedBox(width: 12,),
              Text("Clients"),


            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            ClientItem(),
            ClientItem(),
            ClientItem(),
 
          ],
        ),
      ),
    );
  }
}





class ClientItem extends StatefulWidget {
  const ClientItem({Key? key}) : super(key: key);

  @override
  State<ClientItem> createState() => _ClientItemState();
}

class _ClientItemState extends State<ClientItem> {

  bool _open = false;
  @override
  Widget build(BuildContext context) {
    final color =  COLORS[Random().nextInt(COLORS.length)];
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: width,
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
            child: Row(
              children: [
                SizedBox(width: 6,),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("AbdelMoumen " , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22 , fontWeight: FontWeight.w400),),
                            GestureDetector(
                                onTap: ()=>setState(() {
                                  _open = !_open;
                                }),
                                child: Icon(Icons.more_horiz , color: color, size: 26,))
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:  [
                            const SizedBox(width: 12,),
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset("assets/icons/phone.png", color: color,),),

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
                            const SizedBox(width: 12,),
                            SizedBox(
                              width: 17.5,
                              height: 17.5,
                              child: Image.asset("assets/icons/location.png", color: color,),),
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

              ],
            ),
          ),
          if(_open)...[
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                  child:  Icon(CupertinoIcons.phone_fill,color: color,size: 26,),
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
                  child:  Icon(Icons.comment,color: color,size: 26,),
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
                  child:  Icon(CupertinoIcons.location_solid,color: color,size: 26,),
                ),
                SizedBox(width: 8,),
              ],
            ),
            SizedBox(height: 10,),
          ]
        ],
      ),
    );
  }
}

