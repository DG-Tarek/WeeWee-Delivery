
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/deliver/screens/home/packages/packages_list_screen.dart';
import 'package:weewee_delivery/src/deliver/screens/home/packages/pickup_packages_screen.dart';

import '../../../constant/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.purple,
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
                  const SizedBox(height: 30,),
                  Text(' Packages Details', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),),
                  const SizedBox(height: 25,),
                  Row(
                    children: [
                      SizedBox(width: 8,),
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
                                Text('To Pick Up\nPackages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.blue),),
                                const Spacer(),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("assets/icons/pickup.png",color: Colors.blue,),
                                )
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
                              MaterialPageRoute(builder: (context) =>  PackagesListScreen(state: "onRoad")),
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
                                Text('On Road\nPackages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.teal),),
                                Spacer(),
                                SizedBox(
                                  height: 52.5,
                                  width: 52.5,
                                  child: Image.asset("assets/icons/inroad.png",color: Colors.teal,),
                                ),

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
                              MaterialPageRoute(builder: (context) =>  PackagesListScreen(state: "delivered")),
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
                                Text('Delivered\nPackages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.green),),
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
                              MaterialPageRoute(builder: (context) =>  PackagesListScreen(state: "returned")),
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
                                Text('Returned\nPackages', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.red),),
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
                 const SizedBox(height: 35,),
                  Text(' ', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),),
                  const SizedBox(height: 35,),
                  GestureDetector(
                    onTap: (){

                    },

                    child: Container(
                        width: width,
                        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.purple,
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
                                Text('WeeWee', textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500,fontSize: 18, color: Colors.white),),
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
                  ),
                  const SizedBox(height: 50,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
