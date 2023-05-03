
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit.dart';
import 'package:weewee_delivery/src/trader/screens/home/clients/clients_screen.dart';
import 'package:weewee_delivery/src/trader/screens/home/new_order/new_order.dart';
 import 'package:weewee_delivery/src/trader/screens/home/packages/all_packages_screen.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/delivered_packages_screen.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/pick_up_packages.dart';
import 'package:weewee_delivery/src/trader/screens/home/packages/returned_packages_screen.dart';
import 'package:weewee_delivery/src/trader/screens/home/stock/stock_screen.dart';

import 'new_client/new_client_screen.dart';
import 'new_product/new_product_screen.dart';

class HomeScreen extends StatelessWidget {


  final List<ChartData> chartData = [
    ChartData(1924, 90, '100%', Colors.blue),
    ChartData(1925, 50, '100%', Colors.green),
    ChartData(1926, 70, '100%', Colors.red),
  ];




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.all( Radius.circular(28)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*.0875,),
                  Text(DateFormat("MMMM, dd, yyyy").format(DateTime.now()).toString(), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white.withOpacity(.9)),),
                  const SizedBox(height: 20,),
                  Text('Hello,', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white.withOpacity(.925)),),
                  const SizedBox(height: 4,),
                  Text('Kaddour', style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),),
                  const SizedBox(height: 12,),
                  Text("WeeWee Delivery wishes you a nice Day", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white.withOpacity(.9), fontWeight: FontWeight.w400),),
                  const  SizedBox(height: 25,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                 const SizedBox(height: 35,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(24),),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(left: 24),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        SizedBox(height: height*.25,width: width,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Packages\nStates', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, fontSize: 22, color: Colors.black),),
                            const SizedBox(height: 16,),
                            Row(
                              children: [
                                SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: Image.asset("assets/icons/half-circle.png", color: Colors.red,),
                                ),
                                const SizedBox(width: 4,),
                                Text('In Progress', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.red, fontWeight: FontWeight.w300),),
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              children: [
                                SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: Image.asset("assets/icons/half-circle.png", color: Colors.green,),
                                ),
                                const SizedBox(width: 4,),
                                Text('Delivered', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.green , fontWeight: FontWeight.w300),),
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              children: [
                                SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: Image.asset("assets/icons/half-circle.png", color: Colors.blue,),
                                ),
                                const SizedBox(width: 4,),
                                Text('Returned', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.blue, fontWeight: FontWeight.w300),),
                              ],
                            ),
                            const SizedBox(height: 32,),
                            //Text('This state is only about\nthe current month', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w300, fontSize: 14, color: Colors.black54),),

                          ],
                        ),
                        Positioned(
                          right: -40,
                          top: -10,
                          height: height*.275,
                          child: Container(
                            height: height*.25,
                            child:  SfCircularChart(
                                series:  <RadialBarSeries<ChartData, int>>[
                                  RadialBarSeries<ChartData, int>(
                                      useSeriesColor: true,
                                      trackOpacity: 0.2,
                                      cornerStyle: CornerStyle.bothCurve,
                                      dataSource: chartData,
                                      pointRadiusMapper: (ChartData data, _) => data.text,
                                      pointColorMapper: (ChartData data, _) => data.color,
                                      xValueMapper: (ChartData sales, _) => sales.x,
                                      yValueMapper: (ChartData sales, _) => sales.y,
                                      dataLabelSettings: DataLabelSettings(
                                          textStyle: TextStyle(fontWeight: FontWeight.w600 , fontSize: 14, height: 1.35),
                                          isVisible: true
                                      )
                                  )
                                ]
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Text(' Business Management', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),),
                  const SizedBox(height: 25,),
                  SizedBox(
                      height: 160,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>   NewOrderScreen()),
                                  );
                                },
                                child: Container(
                                  height: 160,

                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all( 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('New\nOrder', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: Colors.white),),
                                      Spacer(),
                                      SizedBox(
                                        height: 45,
                                        width: 55,
                                        child: Image.asset("assets/icons/order.png",color: Colors.white,),
                                      ),
                                      SizedBox(height: 5,),
                                    ],
                                  ),

                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  NewProductScreen()),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(16)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text('New\nProduct', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.purple),),
                                              SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset("assets/icons/product.png",color: Colors.purple,),
                                              )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  NewClientScreen()),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(16)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('New\nClient', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.teal),),
                                            SizedBox(
                                              height: 31.5,
                                              width: 45,
                                              child: Image.asset("assets/icons/add-client.png",color: Colors.teal,),
                                            ) ],
                                        ),

                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ],
                        ),
                      )),

                  const SizedBox(height: 25,),
                  GestureDetector(
                    onTap: (){
                      TraderFirebaseCubit().getProductsList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const StockScreen(showDetails: true,)),
                      );
                    },
                    child: Container(
                      height: 94,
                      width: width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Stock', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: Colors.white),),
                              const SizedBox(height: 5,),
                              Text('11 Products', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13),),
                            ],
                          ),
                          Spacer(),
                          Icon(CupertinoIcons.collections, size: 40,color: Colors.white,),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      TraderFirebaseCubit().getClientsList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const ClientsScreen(options: true,)),
                      );
                    },
                    child: Container(
                      height: 94,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.teal ,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Clients', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: Colors.white),),
                              const SizedBox(height: 5,),
                              Text('33 Clients', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13),),
                            ],
                          ),
                          Spacer(),
                          Icon(CupertinoIcons.person_2, size: 46,color: Colors.white,),
                          SizedBox(width: 8,),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Text(' Packages Details', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),),
                  const SizedBox(height: 25,),
                  Row(
                    children: [
                      SizedBox(width: 8,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            TraderFirebaseCubit().getPackagesList();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  AllPackagesScreen()),
                            );
                          },
                          child: Container(
                            height: 160,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('All\nPackages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.deepPurple),),
                                Spacer(),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("assets/icons/packages.png",color: Colors.deepPurple,),
                                ),
                              const SizedBox(height: 5,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  PickUpPackagesScreen()),
                            );
                          },
                          child: Container(
                            height: 160,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Pick Up Packages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.teal),),
                                Spacer(),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("assets/icons/pickedup.png",color: Colors.teal,),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 8,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  DeliveredPackagesScreen()),
                            );
                          },
                          child: Container(
                            height: 160,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Delivered Packages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.green),),
                                SizedBox(height: 4,),
                                Spacer(),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("assets/icons/approved.png",color: Colors.green,),
                                )],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ReturnedPackagesScreen()),
                            );
                          },
                          child: Container(
                            height: 160,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Returned Packages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.red),),
                                SizedBox(height: 4,),
                                Spacer(),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("assets/icons/returned.png",color: Colors.red,),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                    ],
                  ),

                  const SizedBox(height: 50,),
                  Container(
                      width: width,
                      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 5,
                            blurRadius: 8,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        //mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('My WeeWee', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400,fontSize: 18, color: Colors.white),),
                              const SizedBox(height: 4,),
                              Text('Wallet', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 26, color: Colors.white),),
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                            height: 55,
                            width: 55,
                            child: Image.asset("assets/icons/wallet.png",color: Colors.white,),
                          ),
                        ],
                      )),

                  SizedBox(height: 50,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text, this.color);
  final int x;
  final int y;
  final String text;
  final Color color;
}
