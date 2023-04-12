import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/registering/information/second_screen.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({ super.key,});


  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _type = "";
  final Duration _animatedDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,

                ),
                Text("Type of Account", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5.h,),
                Text(
                  "1 of 3" ,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[400]),
                ),
                SizedBox(height: 12.5.h,),
                Stack(children: [
                  Container(height: 2.h,width:  850.w,decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),),
                  Container(
                    height: 2.h,
                    width:  90.w
                    ,decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),),
                ],),
                SizedBox(height: 15.h,),
                Text("Select your Account Type" , style: Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: 8.h,),
                SizedBox(
                  height: 280.w,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: ()=>setState(() {
                          _type = "driver";
                        }),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration: _animatedDuration,
                              height: _type == "driver" ? 200.w + 5 : 200.w,
                              width: _type == "driver" ? 200.w + 5 : 200.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.deepPurple , width: _type == "driver" ? 1 : 0 ),
                                  borderRadius: BorderRadius.all(Radius.circular(24.w))
                              ),
                              padding: EdgeInsets.all(32.w),
                              child: Image.asset("assets/icons/driver.png"),
                            ),
                            SizedBox(height: 4.h,),
                            Text("Driver" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple),)
                          ],
                        ),
                      ),
                      SizedBox(width: 40.w,),
                      GestureDetector(
                        onTap: ()=>setState(() {
                          _type = "trader";
                        }),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration: _animatedDuration,
                              height: _type == "trader" ? 200.w + 5 : 200.w,
                              width: _type == "trader" ? 200.w + 5 : 200.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.deepPurple, width: _type == "trader" ?1:0 ),
                                  borderRadius: BorderRadius.all(Radius.circular(24.w))
                              ),
                              padding: EdgeInsets.all(32.w),
                              child: Image.asset("assets/icons/trader.png"),
                            ),
                            SizedBox(height: 4.h,),
                            Text("Trader" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                      child: Image.asset("assets/icons/logo.png" ,),
                    ),
                    SizedBox(width: 4.h,),
                    Text("Let me help you",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color:  Colors.deepPurple),),

                  ],
                ),
                SizedBox(height: 4.h,),
                Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.w),
                  topRight: Radius.circular(82.w),
                  bottomLeft: Radius.circular(82.w), bottomRight: Radius.circular(82.w)),
              border: Border.all(color: Colors.deepPurple, width: 0.75),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric( horizontal: 40.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //SizedBox(height: 4.h,),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: _type == "driver" ?
                  Text(
                    "Deliver is someone who delivers packages, thier involves transporting parcels from one location to another." ,
                    key: ValueKey<String>(_type),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color:Colors.deepPurple.shade500 , fontWeight: FontWeight.w500),)
                      :
                  _type == "trader" ?
                  Text("Trader is a person who owns or operates a business that sells good or services, it's can be on line or through an e-commerce platefrom." ,
                    key: ValueKey<String>(_type),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color:Colors.deepPurple.shade500 , fontWeight: FontWeight.w500),)
                      :
                  Text("I can give you a simple definition about Driver or Trader, after you choose one of them." ,
                    key: ValueKey<String>(_type),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.deepPurple.shade500 , fontWeight: FontWeight.w500),)

                  ,
                ),
              ],
            ),
          ),
                SizedBox(height: 40.h,),
                Container(
                  width: width,
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: ()=>Navigator.of(context).push(_createRoute()),
                    child: Container(
                      height: 85.w,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        border: Border.all(color: Colors.deepPurple , width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(24.w)),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 64.w),
                      child: Text("Next" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                    ),
                  ),
                )
              ],
            ),

        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  SecondPage(accountType: _type,),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

}