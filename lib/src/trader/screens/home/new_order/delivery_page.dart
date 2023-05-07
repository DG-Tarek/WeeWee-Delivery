import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/moduls/trader/delivery_options_model.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit_states.dart';
import 'package:weewee_delivery/src/trader/screens/home/new_order/new_order.dart';

import '../../../../constant/constant.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController ;
  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage>  with AutomaticKeepAliveClientMixin<DeliveryPage> {
  @override
  bool get wantKeepAlive => true;
  bool _freeDelivery = false;
  bool _addComent = false;
  bool _anotherPickupPlace = false;
  String _deliveryDay = "Preferred Delivery Day";
  String _deliveryTime = "Preferred Delivery Time";

  String _wilaya = "Wilaya";
  String _baladia = "Towne (Commune)";


  double _deliveryCost  = 0;


  late TextEditingController _storeNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _addressController;
  late TextEditingController _comentController;


  @override
  void initState() {
    super.initState();
    _storeNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _addressController = TextEditingController();
    _comentController = TextEditingController();
  }
  @override
  void dispose() {
    _storeNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _comentController.dispose();
    super.dispose();
  }

  final Duration _animatedDuration = const Duration(milliseconds: 300) ;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TraderFirebaseCubit, TraderFirebaseCubitState>(
      bloc: TraderFirebaseCubit(),
      buildWhen: (previous, current)=> current is NewOrderLoadingState || current is NewOrderSuccessfullyState,
      builder: (_, state) {
        if(state is NewOrderLoadingState || state is NewOrderSuccessfullyState){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(height: 15.h,),
                AnimatedSwitcher(
                  duration: _animatedDuration,
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition( opacity: animation, child: child);
                  },
                  child: state is NewOrderLoadingState ?
                  Container(
                    height: 150,width: 160,
                    alignment: Alignment.center,
                    key: ValueKey<bool>(state is NewOrderSuccessfullyState),
                    child: LoadingAnimationWidget.discreteCircle(
                        color: Colors.deepPurple,
                        size: 45,
                        secondRingColor: Colors.purple,
                        thirdRingColor: Colors.orange),
                  )

                      :Container(

                    key: ValueKey<bool>(state is NewOrderSuccessfullyState),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const SizedBox(height: 150,width: 160,),
                            Container(
                                padding: const EdgeInsets.only(top: 24, bottom: 24,right: 18,left: 30),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 3, color: Colors.green)
                                ),
                                height: 120,
                                width: 120,
                                child: Image.asset("assets/icons/order.png", color: Colors.deepPurple,)),
                            const Positioned(
                                top: 10,
                                right: 0,
                                child: Icon(Icons.done,color: Colors.green,size: 62,))
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
                AnimatedSwitcher(
                  duration: _animatedDuration,
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition( opacity: animation, child: child);
                  },
                  child: state is NewOrderLoadingState ?
                  Container(

                  ) :Container(

                    key: ValueKey<bool>(state is NewOrderSuccessfullyState),
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text: "This ",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black87, height: 1.45 ),
                            children: const  <TextSpan>[
                              TextSpan(text: "Package", style: TextStyle(  color: Colors.deepPurple)),
                               TextSpan(text: ' added Successfully to your '),
                               TextSpan(text: "Orders List.", style: TextStyle(  color: Colors.deepPurple)),

                            ],
                          ),
                        ),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: (){
                                TraderFirebaseCubit().setFirstProductChoice(null);
                                TraderFirebaseCubit().setSecondProductChoice(null);
                                TraderFirebaseCubit().setFirstClientChoice(null);
                                TraderFirebaseCubit().setSecondClientChoice(null);
                                TraderFirebaseCubit().restoreOrderState();
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 85.w,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.deepPurple , width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(24.w)),
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 64.w),
                                child: Text("Back" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple),),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                TraderFirebaseCubit().setFirstProductChoice(null);
                                TraderFirebaseCubit().setSecondProductChoice(null);
                                TraderFirebaseCubit().setFirstClientChoice(null);
                                TraderFirebaseCubit().setSecondClientChoice(null);
                                TraderFirebaseCubit().setFreeProduct(isFree: false);
                                TraderFirebaseCubit().restoreOrderState();

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) =>   const NewOrderScreen()),
                                );
                              },
                              child: Container(
                                height: 85.w,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  border: Border.all(color: Colors.deepPurple , width: 0),
                                  borderRadius: BorderRadius.all(Radius.circular(24.w)),
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 64.w),
                                child: Text("Add Another Order" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),

                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h,),
                Text("Delivery Options", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5.h,),
                Text(
                  "3 of 3" ,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[400]),
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add a Coment" , style: Theme.of(context).textTheme.titleMedium,),
                    Switch(
                      value: _addComent,
                      onChanged: (bool value) {
                        setState(() {
                          _addComent = value;
                        });
                      },
                    )
                  ],
                ),
                if(_addComent)...[
                  SizedBox(height: 5.h,),
                  TextField(
                    controller: _comentController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelText: 'Write a Coment',
                        labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                    ),
                    style:const TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 15.h,),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Is a Free Delivery ?" , style: Theme.of(context).textTheme.titleMedium,),
                    Switch(
                      value: _freeDelivery,
                      onChanged: (bool value) {
                        setState(() {
                          _freeDelivery = value;
                        });
                      },
                    )
                  ],
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: "By setting this option ON your ",
                    style: const TextStyle(color: Colors.black54 , height: 1.45),
                    children: <TextSpan>[
                      TextSpan(text: 'CLIENT', style: TextStyle(  color: Colors.deepPurple.shade400)),
                      const TextSpan(text: ', will '),
                      TextSpan(text: 'NOT BAY', style: TextStyle(  color: Colors.deepPurple.shade400)),
                      const TextSpan(text: ' for this package.'),

                    ],
                  ),
                ),
                SizedBox(height: 15.h,),
                GestureDetector(

                  onTap: () {
                    final DateTime now = DateTime.now();
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime( now.year, now.month , now.day),
                        maxTime: DateTime( now.year, now.month +1, now.day),
                        onConfirm: (date) {
                          setState(() {
                            _deliveryDay = DateFormat.yMMMMd().format(date);
                          });
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.en);
                  },
                  child: Container(

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: Colors.deepPurple, width: .5)
                    ),
                    height: 60,
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(

                        children: [
                          Text(_deliveryDay,
                            style: TextStyle(color: Colors.deepPurple, fontSize: 16),),
                          Spacer(),
                          Icon(CupertinoIcons.calendar , color: Colors.deepPurple.withOpacity(.8),),
                          const SizedBox(width: 4,)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple,width: .5),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  isExpanded: true,
                  hint:  const Text(
                    "Preferred Delivery Time",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 16),),
                  items: PICKUPTIME
                      .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple
                          ),
                        ),
                      ))
                      .toList(),
                  onChanged: (value) {
                    _deliveryTime = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    height: 60,
                    padding: EdgeInsets.only(right: 10),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      CupertinoIcons.time,
                      color: Colors.deepPurple,
                    ),
                    iconSize: 26,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                // use another pick up place
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Use Another Pickup Place" , style: Theme.of(context).textTheme.titleMedium,),
                    Switch(
                      value: _anotherPickupPlace,
                      onChanged: (bool value) {
                        setState(() {
                          _anotherPickupPlace = value;
                          TraderFirebaseCubit().setDeliveryCost();
                        });
                      },
                    )
                  ],
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: "By setting this option ON ",
                    style: const TextStyle(color: Colors.black54 , height: 1.35),
                    children: <TextSpan>[
                      TextSpan(text: 'WeeWee Services', style: TextStyle(  color: Colors.deepPurple.shade400)),
                      const TextSpan(text: ' will use this '),
                      TextSpan(text: 'Pickup Place ', style: TextStyle(  color: Colors.deepPurple.shade400)),
                      const TextSpan(text: 'automatically.'),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                if(_anotherPickupPlace)...[
                  TextField(
                    controller: _storeNameController,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelText: 'Custom Name (Store)',
                        labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _phoneNumberController,
                    keyboardType:  TextInputType.number,
                    maxLength: 10,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10,),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    isExpanded: true,
                    hint:  const Text(
                      "Wilaya",
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                    ),
                    items: WILAYA
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ))
                        .toList(),
                    onChanged: (value) {
                      _wilaya = value.toString();
                      TraderFirebaseCubit().setDeliveryCost(anotherPickUpWilia: _wilaya);
                    },
                    buttonStyleData: const ButtonStyleData(
                      height: 60,
                      padding: EdgeInsets.only(right: 10),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 26,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    isExpanded: true,
                    hint:   const Text(
                      "Town (Commune)",
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                    ),
                    items: WILAYA
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ))
                        .toList(),
                    onChanged: (value) {
                      _baladia = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      height: 60,
                      padding: EdgeInsets.only(right: 10),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 26,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelText: 'Pickup Address',
                        labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 40,),
                  Text("Pickup point on the Map" , style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 16,),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: "If you don't know exactly ",
                      style: const TextStyle(color: Colors.black54 , height: 1.35),
                      children: <TextSpan>[
                        TextSpan(text: 'Geolocation', style: TextStyle(  color: Colors.deepPurple.shade400)),
                        const TextSpan(text: ' on '),
                        TextSpan(text: 'Map ', style: TextStyle(  color: Colors.deepPurple.shade400)),
                        const TextSpan(text: ' for your Pickup point, you can skip this option.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 12),

                    decoration:   BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(color: Colors.deepPurple , width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(24.w)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(" Select on Map" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                        const Icon(Icons.location_searching , color: Colors.white,)
                      ],
                    ),),
                ],
                SizedBox(height: 15.h,),
                BlocBuilder<TraderFirebaseCubit, TraderFirebaseCubitState>(
                    bloc: TraderFirebaseCubit(),
                    buildWhen: (previous, current)=>current is UpdateDeliveryOptionsState,
                    builder: (_, state){
                       _deliveryCost = _freeDelivery ? 0 : TraderFirebaseCubit().deliveryCost ;
                       return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
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
                        child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(height: 10.h,),
                              Text("Product Price", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text( TraderFirebaseCubit().productPrice.toString(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
                            ],),
                          SizedBox(height: 8.h,),
                          Row(
                            children: [
                              SizedBox(height: 7.h,),
                              Text("Delivery Cost", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black54, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text( "+ " + _deliveryCost.toString(), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black54, fontWeight: FontWeight.w500)),
                            ],),
                        ],
                    ),
                      );}),

                SizedBox(height: 25.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        widget.pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);

                      },
                      child: Container(
                        height: 85.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.teal , width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(24.w)),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 64.w),
                        child: Text("Back" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.teal),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        if(!_anotherPickupPlace){
                          final DeliveryOptions deliveryOptions = DeliveryOptions(
                              isFreeDelivery: _freeDelivery,
                              isFreeProduct: TraderFirebaseCubit().productPrice == 0,
                              deliveryCost: TraderFirebaseCubit().deliveryCost,
                              preferredDeliveryDay: _deliveryDay,
                              preferredDeliveryTime: _deliveryTime,
                              useAnotherPlace: false,
                              coment: _comentController.text,);
                              TraderFirebaseCubit().newOrder();
                              TraderFirebaseCubit().setDeliveryOptions(options: deliveryOptions);
                        }else{
                          if(_storeNameController.text.isNotEmpty && _phoneNumberController.text.isNotEmpty && _wilaya != "Wilaya" && _baladia != "Town (Commune)" && _addressController.text.isNotEmpty){
                            final DeliveryOptions deliveryOptions = DeliveryOptions(
                              isFreeDelivery: _freeDelivery,
                                isFreeProduct: TraderFirebaseCubit().productPrice == 0,
                                deliveryCost: TraderFirebaseCubit().deliveryCost,
                                preferredDeliveryDay: _deliveryDay,
                                preferredDeliveryTime: _deliveryTime,
                                useAnotherPlace: true,
                                anotherStoreName: _storeNameController.text,
                                anotherPhoneNumber: _phoneNumberController.text,
                                anotherAddress: _addressController.text,
                                anotherWilaya: _wilaya,
                                anotherBaladia: _baladia,
                                anotherGeolocation: "Geolocation",
                              coment: _comentController.text,
                            );
                            TraderFirebaseCubit().setDeliveryOptions(options: deliveryOptions);
                            TraderFirebaseCubit().newOrder();
                          }else{
                            debugPrint("You Inputs");
                          }

                        }

                      },
                      child: Container(
                        height: 85.w,

                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          border: Border.all(color: Colors.deepPurple , width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(24.w)),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 64.w),
                        child: Text("Raise The Order" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h,),
              ],
            ),
          ),
        );
      }
    );
  }
}

/**/