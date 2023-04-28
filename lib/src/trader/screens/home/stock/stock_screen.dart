
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/moduls/trader/product_model.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit_states.dart';
import 'package:weewee_delivery/src/trader/screens/home/stock/product_history_screen.dart';

import '../../../../constant/constant.dart';
import '../../../provider/trader_firebase_cubit.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({Key? key, this.selectIsAvailable = false}) : super(key: key);
  final bool selectIsAvailable;
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
      body: BlocBuilder<TraderFirebaseCubit, TraderFirebaseCubitState>(
        bloc: TraderFirebaseCubit(),
        buildWhen: (previous, current)=> current is GetProductsLoadingState || current is GetProductsSuccessfullyState,
        builder:(_,state){
          if( state is GetProductsLoadingState){
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
              itemCount: TraderFirebaseCubit().productsList.length,
              itemBuilder: (_,index){
                return Container(
                  padding: index == 0 ? const EdgeInsets.only(top: 20):null ,
                  child: StockItem(
                product: TraderFirebaseCubit().productsList[index],
                  selectIsAvailable: selectIsAvailable,
                    showHistory: true,
                  ));

              }),
          );},
      ),
    );
  }
}



class StockItem extends StatelessWidget {
  const StockItem(
      {Key? key, required this.product, this.selectIsAvailable = false, this.showHistory = false})
      : super(key: key);

  final Product product;
  final bool selectIsAvailable;
  final bool showHistory;

  @override
  Widget build(BuildContext context) {
    final color = COLORS[Random().nextInt(COLORS.length)];
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 12),
      child: GestureDetector(
          onTap: (){
            if(showHistory){
              Navigator.of(context).push(_createRoute());
            }
          },
          child: Stack(
          alignment: Alignment.center,
          children: [
          Padding(
          padding: const EdgeInsets.only(top: 16.0, right: 16),
      child: GestureDetector(
        onLongPress: () {
          if (selectIsAvailable) {
            if (product.stock > 0) {
              TraderFirebaseCubit().setFirstProductChoice(product);
              Navigator.of(context).pop();
            } else {
              debugPrint("This Product is out of your Stock");
            }
          }
        },
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
                    child: Text(product.name, style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 1.35),)),

                const SizedBox(height: 16,),
                Text(product.description,
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
                    Text(product.price.toString(), style: Theme
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
                    Text("Stock", style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.red),),
                    const SizedBox(width: 8,),
                    Text("${product.stock} / ${product.minStock}", style: Theme
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
    ),
    Positioned(
    top: 0,
    right: 8,
    height: 60,
    width: 60,
    child: Container(

    padding: const EdgeInsets.only(left: 5,right: 7,top: 8,bottom: 4),
    decoration: BoxDecoration(
    color: product.stock< product.minStock ? Colors.red : Colors.white,
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
    product.stock >= product.minStock ?
    const BoxShadow(
    color: Colors.white,
    spreadRadius: 3,
    blurRadius: 0,
    offset: Offset(-2, 2),):
    const BoxShadow(
    color: Colors.red,
    spreadRadius: 1,
    blurRadius: 0,
    offset: Offset(-1, 1),),
    ],
    ),
    child: Image.asset("assets/icons/packagelogo.png"),
    ))],
    ),
    ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation,
          secondaryAnimation) => ProductHistoryScreen(product: product),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}