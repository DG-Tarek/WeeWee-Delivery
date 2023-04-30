
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/moduls/trader/product_history_model.dart';
import 'package:weewee_delivery/src/trader/screens/home/stock/stock_screen.dart';
import '../../../../moduls/trader/product_model.dart';
import '../../../provider/trader_firebase_cubit.dart';
import '../../../provider/trader_firebase_cubit_states.dart';

class ProductHistoryScreen extends StatelessWidget {
  const ProductHistoryScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: Image.asset("assets/icons/open-box.png",color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("Product Details"),
          ],
        ),
      ),
      body:  BlocBuilder<TraderFirebaseCubit, TraderFirebaseCubitState>(
          bloc: TraderFirebaseCubit(),
          buildWhen: (previous, current)=> current is GetProductHistoryLoadingState || current is GetProductHistorySuccessfullyState,
          builder: (_, state) {
            if( state is GetProductHistoryLoadingState){
              return Center(
                child: LoadingAnimationWidget.discreteCircle(
                    color: Colors.deepPurple,
                    size: 45,
                    secondRingColor: Colors.purple,
                    thirdRingColor: Colors.orange),
              );
            }
            int inProgress = 0;
            int returned = 0 ;
            int sales = 0;
            double total = 0;
            for(var p in TraderFirebaseCubit().productHistory){
              if(p.state == "sale") {
                total+=p.totalPrice;}
              switch (p.state){
                case "inProgress":
                  inProgress +=1;break;
                case "sale":
                  sales +=1;break;
                case "returned":
                  returned +=1;break;
              }
            }
            return SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: TraderFirebaseCubit().productHistory.length + 1 ,
                  itemBuilder: (_,index){
                    return index == 0 ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.h,),
                        StockItem(product: product),
                        SizedBox(height: 3.h,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            padding: EdgeInsets.only(top: 16, bottom: 16,left: 16,right: 24),
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(1, 1),
                                ),
                              ],
                              //up
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("In Progress", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.blueAccent),),
                                    Text(inProgress.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54),),
                                  ],),
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Sales", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.green)),
                                    Text(sales.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54),),
                                  ],),
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Returned" , style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red)),
                                    Text(returned.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54),),

                                  ],),
                                const SizedBox(height: 10,),
                                Row(

                                  children: [
                                    Text("Total Salles", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
                                    const Spacer(),
                                    Text(total.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
                                    const Padding(
                                      padding: const EdgeInsets.only(top: 2.0, left: 2),
                                      child: Text("DZ", style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w600)),
                                    ),
                                  ],),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 15.h,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text("Sales History" , style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),),
                        ),
                        const SizedBox(height: 3),
                      ],
                    )
                        : ProductHistoryItem(
                        productHistory: TraderFirebaseCubit().productHistory[index-1]);

                  }),
            );
          }
      )
    );
  }
}


class ProductHistoryItem extends StatelessWidget {
  const ProductHistoryItem({Key? key, required this.productHistory}) : super(key: key);
  final ProductHistory productHistory ;
  @override
  Widget build(BuildContext context) {
    final List<String> date = productHistory.saleDate.split(" ");
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 16),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 1),
                  ),
                ],
                //up
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                           Text(productHistory.clientFullName ,style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),  ),
                          SizedBox(height: 5,),
                          Text(productHistory.clientPhoneNumber ,style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.w300 , color: Colors.black54), ),
                          Text(productHistory.clientOptionalPhoneNumber,style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.w300, color: Colors.black45), ),

                        ],)),
                  Expanded(
                    flex: 2,
                      child: Container(
                        alignment: FractionalOffset.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(date[1] ,style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.w400, color: Colors.black54),  ),
                            Text(date[0] ,style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.w400, color: Colors.black54),  ),
                            Text(date[2] ,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54),  ),

                          ],),
                      )),
                  Expanded(
                    flex: 3,
                      child: Container(
                        alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 13,),
                        Row(
                          children:  [
                            const Text("Quantity" ,style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w400, color: Colors.black54),  ),
                            const SizedBox(width: 8,),
                             Text(productHistory.quantity.toString() ,style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w600, color: Colors.green),  ),
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            Flexible(child: Text(productHistory.totalPrice.toString() ,style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.w400 , color: Colors.red),  )),
                            const Padding(
                              padding: EdgeInsets.only(top: 6.0),
                              child: Text(" DZ" ,style: TextStyle(fontSize: 12 , color: Colors.red),  ),
                            ),
                          ],
                        ),

                      ],),
                  )),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              right: 8,
              child: Container(

                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:  Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, -2),
                    ),
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(2, 0),
                    ),

                    const BoxShadow(
                      color: Colors.white,
                      spreadRadius: 3,
                      blurRadius: 0,
                      offset: Offset(-2, 2),)
                  ],
                ),
                child:  Text(productHistory.stockState ,style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.w600, color: Colors.deepPurple),  ),

              ))
        ],
      ),
    );
  }
}
