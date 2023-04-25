
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/moduls/trader/client_model.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit_states.dart';

import '../../../../constant/constant.dart';

class NewClientScreen extends StatefulWidget {
  const NewClientScreen({Key? key}) : super(key: key);

  @override
  State<NewClientScreen> createState() => _NewClientScreenState();
}

class _NewClientScreenState extends State<NewClientScreen> {

  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _optionalPhoneNumberController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _optionalPhoneNumberController = TextEditingController();
    _addressController = TextEditingController();

  }
  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _optionalPhoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }
  final Duration _animatedDuration = const Duration(milliseconds: 300) ;
  String _wilaya = "Wilaya";
  String _baladia = "Towne (Commune)";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 27,
              width: 27,
              child: Image.asset("assets/icons/add-client.png",color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("New Client"),

          ],
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron ),
          onPressed: (){
            TraderFirebaseCubit().restoreCreateClientState();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<TraderFirebaseCubit,TraderFirebaseCubitState>(
        bloc: TraderFirebaseCubit(),
        buildWhen: (previous, current)=> current is CreateClientState || current is CreateClientLoadingState || current is  CreateClientSuccessfullyState,
        builder: (_,state) {

          if(state is CreateClientLoadingState || state is CreateClientSuccessfullyState){
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
                    child: state is CreateClientLoadingState ?
                    Container(
                      height: 150,width: 160,
                      alignment: Alignment.center,
                      key: ValueKey<bool>(state is CreateClientSuccessfullyState),
                      child: LoadingAnimationWidget.discreteCircle(
                          color: Colors.deepPurple,
                          size: 45,
                          secondRingColor: Colors.purple,
                          thirdRingColor: Colors.orange),
                    )

                        :Container(

                      key: ValueKey<bool>(state is CreateClientSuccessfullyState),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              const SizedBox(height: 150,width: 160,),
                              Container(
                                  padding: EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 3, color: Colors.green)
                                  ),
                                  height: 120,
                                  width: 120,
                                  child: Icon(CupertinoIcons.person, color: Colors.green , size: 66,)),
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
                    child: state is CreateClientLoadingState ?
                    Container(

                    ) :Container(

                      key: ValueKey<bool>(state is CreateClientSuccessfullyState),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Client ",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black87, height: 1.45 ),
                              children: <TextSpan>[
                                TextSpan(text: _fullNameController.text, style: TextStyle(  color: Colors.deepPurple)),
                                const TextSpan(text: ' added Successfully to your '),
                                const TextSpan(text: "Clients List.", style: TextStyle(  color: Colors.deepPurple)),

                              ],
                            ),
                          ),
                          const SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  TraderFirebaseCubit().restoreCreateClientState();
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
                                  TraderFirebaseCubit().restoreCreateClientState();
                                  _fullNameController.clear();
                                  _phoneNumberController.clear();
                                  _optionalPhoneNumberController.clear();
                                  _addressController.clear();
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
                                  child: Text("Add Another Client" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
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
            //  physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h,),
                  Text("Client Information" , style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: 15.h,),
                   TextField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelText: 'Client Full Name',
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
                   TextField(
                     controller: _optionalPhoneNumberController,
                    keyboardType: TextInputType.number,
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
                        labelText: 'Optional Phone Number',
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
                        labelText: 'Client Address',
                        labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 40,),
                  Text("Delivery point on the Map" , style: Theme.of(context).textTheme.titleLarge,),
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
                        const TextSpan(text: ' for your Client, you can skip this option.'),
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
                    ),
                  ),

                  SizedBox(height: 20.h,),
                  SizedBox(
                    width: width,
                    child: GestureDetector(
                      onTap: (){
                        if(_fullNameController.text.isNotEmpty && _phoneNumberController.text.isNotEmpty && _addressController.text.isNotEmpty && _wilaya != "Wilaya" && _baladia != "Towne (Commune)"){
                          final Client client = Client(fullName: _fullNameController.text, phoneNumber: _phoneNumberController.text, optionalPhoneNumber: _optionalPhoneNumberController.text, wilaya: _wilaya, baladia: _baladia,address: _addressController.text,createdAt: createdTime());
                        TraderFirebaseCubit().createClient(client: client);
                        }else{
                          debugPrint("Invalid Inputs");
                        }
                      },
                      child: Container(
                        height: 85.w,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          border: Border.all(color: Colors.deepPurple , width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(24.w)),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 64.w),
                        child: Text("Save Client" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h,),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
