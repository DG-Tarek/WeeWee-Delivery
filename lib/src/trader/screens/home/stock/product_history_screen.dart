
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/trader/screens/home/stock/stock_screen.dart';

import '../../../../moduls/shared/package_model.dart';
import '../../../../moduls/trader/product_model.dart';

class ProductHistoryScreen extends StatelessWidget {
  const ProductHistoryScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h,),
          StockItem(product: product),
          SizedBox(height: 10.h,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24.0),
             child: Text("Product Sales History" , style: Theme.of(context).textTheme.titleLarge,),
           ),
          const SizedBox(height: 5),
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
      padding: const EdgeInsets.only(bottom: 10, left: 16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(2, 2),
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
                          Text("Kaddour" ,style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),  ),
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
                            Text("23" ,style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w400, color: Colors.black54),  ),
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
                        const SizedBox(height: 15,),
                        Row(
                          children: const [
                             Text("Quantity" ,style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w400, color: Colors.black54),  ),
                            SizedBox(width: 8,),
                             Text("1" ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600, color: Colors.green),  ),
                          ],
                        ),
                        const SizedBox(height: 2,),
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

                padding: const EdgeInsets.all(14),
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
