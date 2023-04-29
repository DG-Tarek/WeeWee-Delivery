
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/trader/screens/home/stock/stock_screen.dart';

import '../../../../moduls/shared/package_model.dart';
import '../../../../moduls/trader/product_model.dart';

class ProductHistoryScreen extends StatelessWidget {
  const ProductHistoryScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Product Details"),
          ],
        ),
      ),
      body: Column(
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
                    Text("1", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54),),
                  ],),
                  SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Sales", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.green)),
                    Text("3", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54),),
                  ],),
                  SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Returned" , style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red)),
                    Text("0", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54),),

                  ],),
                  const SizedBox(height: 10,),
                  Row(

                    children: [
                    Text("Total Salles", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
                    Spacer(),
                      Text("2000", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
                      Padding(
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
          ProductHistoryItem(),
          ProductHistoryItem(),
        ],
      ),
    );
  }
}


class ProductHistoryItem extends StatelessWidget {
  const ProductHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Kaddour" ,style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),  ),
                          SizedBox(height: 5,),
                          Text("05565656" ,style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w300 , color: Colors.black54), ),
                          Text("05565656" ,style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w300, color: Colors.black45), ),

                        ],)),
                  Expanded(
                      child: Container(
                        alignment: FractionalOffset.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("23" ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w400, color: Colors.black54),  ),
                            Text("Avril" ,style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w400, color: Colors.black54),  ),
                            Text("2023" ,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54),  ),

                          ],),
                      )),
                  Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 13,),
                        Row(
                          children: const [
                             Text("Quantity" ,style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w400, color: Colors.black54),  ),
                            SizedBox(width: 8,),
                             Text("1" ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600, color: Colors.green),  ),
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("2300" ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w400 , color: Colors.red),  ),
                            Padding(
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
                child:  Text("23" ,style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w600, color: Colors.deepPurple),  ),

              ))
        ],
      ),
    );
  }
}
