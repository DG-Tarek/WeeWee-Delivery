
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<ChartData> chartData = [
    ChartData(1924, 90, '100%', Colors.blue),
    ChartData(1925, 50, '100%', Colors.green),
    ChartData(1926, 70, '100%', Colors.red),
  ];




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(28), bottomLeft: Radius.circular(28)),
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
                  SizedBox(height: height*.075,),
                  Text(DateFormat("MMMM, dd, yyyy").format(DateTime.now()).toString(), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white70),),
                  const SizedBox(height: 20,),
                  Text('Hello,', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white.withOpacity(.9)),),
                  const SizedBox(height: 4,),
                  Text('Kaddour', style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),),
                  const SizedBox(height: 12,),
                  Text("WeeWee Delivery wishes you a nice Day", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white70, fontWeight: FontWeight.w400),),
                 const  SizedBox(height: 30,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  Text(' Packages States', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 24),),
                  const SizedBox(height: 20,),
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
                            Row(
                              children: [
                                SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: Image.asset("assets/icons/half-circle.png", color: Colors.red,),
                                ),
                                SizedBox(width: 4,),
                                Text('Processing', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.red, fontWeight: FontWeight.w300),),
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
                                SizedBox(width: 4,),
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
                                SizedBox(width: 4,),
                                Text('Returned', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.blue, fontWeight: FontWeight.w300),),
                              ],
                            ),
                            const SizedBox(height: 24,),
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
                                      cornerStyle: CornerStyle.endCurve,
                                      dataSource: chartData,
                                      pointRadiusMapper: (ChartData data, _) => data.text,
                                      pointColorMapper: (ChartData data, _) => data.color,
                                      xValueMapper: (ChartData sales, _) => sales.x,
                                      yValueMapper: (ChartData sales, _) => sales.y,
                                      dataLabelSettings: DataLabelSettings(
                                        // Renders the data label
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
                  const SizedBox(height: 40,),
                  Container(
                    height: 94,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.teal,
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
                            Text('Clients', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.white),),
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
                  const SizedBox(height: 20,),
                  Container(
                    height: 94,
                    width: width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
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
                            Text('Packages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.white),),
                            const SizedBox(height: 5,),
                            Text('11 packages', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13),),
                          ],
                        ),
                        Spacer(),
                        Icon(CupertinoIcons.collections, size: 40,color: Colors.white,),
                        SizedBox(width: 8,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Text(' Packages Details', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 24),),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 8,),
                      Expanded(
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
                              Text('All Packages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.deepPurple),),
                              Spacer(),
                              Icon(CupertinoIcons.collections, size: 40,color: Colors.deepPurple,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
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
                              Text('Picked Up Packages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.teal),),
                              Spacer(),
                              Icon(CupertinoIcons.collections, size: 40,color: Colors.teal,),
                            ],
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
                              Text('Deliverd Packages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.green),),
                              SizedBox(height: 4,),
                              Spacer(),
                              Icon(CupertinoIcons.collections, size: 40,color: Colors.green,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
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
                              Text('Returned Packages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.red),),
                              SizedBox(height: 4,),
                              Spacer(),
                              Icon(CupertinoIcons.collections, size: 40,color: Colors.red,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                    ],
                  ),
                  SizedBox(height: 80,),
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
  final double y;
  final String text;
  final Color color;
}

