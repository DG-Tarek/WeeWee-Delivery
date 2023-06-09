
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/trader/screens/home/new_order/client_page.dart';
import 'package:weewee_delivery/src/trader/screens/home/new_order/delivery_page.dart';
import 'package:weewee_delivery/src/trader/screens/home/new_order/product_page.dart';

import '../../../provider/trader_firebase_cubit.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {

  late PageController _pageController ;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset("assets/icons/order.png",color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("New Order"),
          ],
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron ),
          onPressed: (){
            TraderFirebaseCubit().setFirstClientChoice(null);
            TraderFirebaseCubit().setSecondClientChoice(null);
            TraderFirebaseCubit().setFirstProductChoice(null);
            TraderFirebaseCubit().setSecondProductChoice(null);
            TraderFirebaseCubit().restoreOrderState();
            TraderFirebaseCubit().setFreeProduct(isFree: false);
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SizedBox(
        height: height,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ProductPage(pageController: _pageController),
            ClientPage(pageController: _pageController,),
            DeliveryPage(pageController: _pageController,),
          ],
        ),
      ),
    );
  }
}






