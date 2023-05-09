
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit_states.dart';

import '../../../../moduls/trader/client_model.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({Key? key,  this.selectIsAvailable = false , this.options = false }) : super(key: key);
  final bool selectIsAvailable ;
  final bool options ;
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
        body: BlocBuilder<TraderFirebaseCubit, TraderFirebaseCubitState>(
          bloc: TraderFirebaseCubit(),
            buildWhen: (previous, current)=> current is GetClientsLoadingState || current is GetClientsSuccessfullyState,
            builder: (_, state) {
            if( state is GetClientsLoadingState){
              return Center(
                child: LoadingAnimationWidget.discreteCircle(
                    color: Colors.deepPurple,
                    size: 45,
                    secondRingColor: Colors.purple,
                    thirdRingColor: Colors.orange),
              );
            }
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: TraderFirebaseCubit().clientsList.length,
                itemBuilder: (_,index){
                   return Container(
                     padding: index == 0 ? const EdgeInsets.only(top: 20):null ,
                     child: ClientItem(
                         client: TraderFirebaseCubit().clientsList[index],
                           selectIsAvailable: selectIsAvailable,
                           options: options,
                     )
                   );

                }),
            );
          }
        ),
      ),
    );
  }
}





class ClientItem extends StatefulWidget {
  const ClientItem({Key? key, required this.client, this.selectIsAvailable = false, this.options = false}) : super(key: key);
   final Client client;
   final bool selectIsAvailable ;
  final bool options ;
  @override
  State<ClientItem> createState() => _ClientItemState();
}

class _ClientItemState extends State<ClientItem> {

  bool _open = false;
  @override
  Widget build(BuildContext context) {
    final color =  COLORS[Random().nextInt(COLORS.length)];
    return Stack
      (
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 12),
          child: GestureDetector(
            onLongPress: (){
              if(widget.selectIsAvailable){
              TraderFirebaseCubit().setFirstClientChoice(widget.client);
              Navigator.of(context).pop();
              }
            },
            onTap: (){
             if(widget.options){
               setState(() {
                 _open = !_open;
               });
             }
            },
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
                        Text(widget.client.fullName , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22 , fontWeight: FontWeight.w400),),

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
                            Text(widget.client.phoneNumber ,
                              style: const  TextStyle(
                                  fontSize: 15.5,
                                  color: Colors.black54
                              ),)
                          ],
                        ),
                        if(widget.client.optionalPhoneNumber!.isNotEmpty)...[
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
                              Text(widget.client.optionalPhoneNumber! ,
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
                            Text("${widget.client.wilaya} , ${widget.client.baladia}" ,
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
    );
  }
}

