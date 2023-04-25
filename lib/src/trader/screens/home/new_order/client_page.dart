import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit_states.dart';

import '../../../../constant/constant.dart';
import '../../../../moduls/trader/client_model.dart';
import '../clients/clients_screen.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController ;
  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> with AutomaticKeepAliveClientMixin<ClientPage> {

  @override
  bool get wantKeepAlive => true;


  String _wilaya = "Wilaya";
  String _baladia = "Towne (Commune)";



  // Client Controllers
  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _optionalPhoneNumberController;
  late TextEditingController _addressController;


  @override
  void initState() {
    super.initState();
    // Client Controllers
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _optionalPhoneNumberController = TextEditingController();
    _addressController = TextEditingController();
  }

  void dispose() {
    // Client Controllers
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _optionalPhoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TraderFirebaseCubit, TraderFirebaseCubitState>(
      bloc: TraderFirebaseCubit(),
        buildWhen: (previous, current)=> current is SelectedClientState,
        builder: (_, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Client selection", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
                    SizedBox(height: 5.h,),
                    Text(
                      "2 of 3" ,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const ClientsScreen(selectIsAvailable: true,)),
                    );
                  },
                  child: Container(
                    height: 120.w,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select Client from Client List" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                        Icon(CupertinoIcons.right_chevron , color: Colors.white, size: 22,),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
               TraderFirebaseCubit().firstClientChoice != null?
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       GestureDetector(
                         onTap: (){
                           TraderFirebaseCubit().setFirstClientChoice(null);
                         },
                         child: Padding(
                           padding: const EdgeInsets.only(right: 18.0, bottom: 10),
                           child: Container(
                             padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                             decoration: BoxDecoration(
                               color: Colors.red,
                               borderRadius: BorderRadius.all(Radius.circular(24)),
                               boxShadow: [BoxShadow(
                                 color: Colors.grey.shade200,
                                 spreadRadius: 5,
                                 blurRadius: 1,
                                 offset: Offset(1, 1),
                               ),
                               ],
                             ),
                             child: Icon(Icons.close, color: Colors.white,size: 22,),
                           ),
                         ),
                       ),
                       ClientItem(client: TraderFirebaseCubit().firstClientChoice!, options: false,),
                     ],
                   )
                   :
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [if(true)...[
                    Text("Client Information" , style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(height: 10.h,),
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
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
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
                  ],],
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
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
                          border: Border.all(color: Colors.purple , width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(24.w)),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 64.w),
                        child: Text("Back" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.purple),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        if(TraderFirebaseCubit().firstClientChoice != null){
                          widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                        }else{
                          if(_fullNameController.text.isNotEmpty && _phoneNumberController.text.isNotEmpty && _addressController.text.isNotEmpty && _wilaya != "Wilaya" && _baladia != "Towne (Commune)"){
                            final Client client = Client(fullName: _fullNameController.text, phoneNumber: _phoneNumberController.text, optionalPhoneNumber: _optionalPhoneNumberController.text, wilaya: _wilaya, baladia: _baladia,address: _addressController.text, createdAt: createdTime());
                            TraderFirebaseCubit().setSecondClientChoice(client);
                            widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                          }else{
                            debugPrint("Invalid Inputs  ccc");
                          }
                        }
                      },
                      child: Container(
                        height: 85.w,
                        width: width*.4,
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
                  ],
                ),
              ),
              SizedBox(height: 25.h,),


            ],
          ),
        );
      }
    );
  }
}

