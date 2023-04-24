

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

import '../../../../moduls/trader/client_model.dart';
import '../../../../moduls/trader/product_model.dart';

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
      ),
      body: SizedBox(
        height: height,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ProductPage(pageController: _pageController,),
            ClientPage(pageController: _pageController,),
            DeliveryPage(pageController: _pageController,),
          ],
        ),
      ),
    );
  }
}

class ProductPage extends StatefulWidget {
   ProductPage({Key? key, required this.pageController }) : super(key: key);

  final PageController pageController ;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with AutomaticKeepAliveClientMixin<ProductPage> {

  @override
  bool get wantKeepAlive => true;

  String _weight = "0";
  String _width = "0";
  String _height = "0";
  String _length = "0";



  // Product Controllers
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;



  @override
  void initState() {
    super.initState();
    // Product Controllers
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();

  }

  void dispose() {
    // Product Controllers
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();


    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                Text("Product selection", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5.h,),
                Text(
                  "1 of 3" ,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[400]),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: 120.w,
              width: width,
              decoration: BoxDecoration(
                color: Colors.purple,
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
                  Text("Select Product from Stock" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                  Icon(CupertinoIcons.collections , color: Colors.white, size: 22,),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                  Text("Product Information" , style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height: 10.h,),
                  TextField(
                    controller: _nameController,
                    decoration: const  InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelText: 'Product Name',
                        labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelText: 'Product Description',
                        labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                    ),
                    style:const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelText: 'Price (DA )',
                        labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 40,),
                  Text("Product Dimension" , style: Theme.of(context).textTheme.titleMedium,),
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
                    hint: const Text(
                      'Weight',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                    ),
                    items: PRODUCT_WEIGHT
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
                      _weight = value.toString();
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
                    hint: const Text(
                      'Width',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                    ),
                    items: PRODUCT_DIMENSIONS
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
                      _width = value.toString();
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
                    hint: const Text(
                      'Height',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                    ),
                    items: PRODUCT_DIMENSIONS
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
                      _height=value.toString();
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
                    hint: const Text(
                      'Length',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                    ),
                    items: PRODUCT_DIMENSIONS
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
                      _length = value.toString();
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

              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              alignment: Alignment.centerRight,
              width: width,
              child: GestureDetector(
                onTap: (){
                  if(_nameController.text.isEmpty || _descriptionController.text.isEmpty || _priceController.text.isEmpty ){
                    debugPrint("Information");
                  }else if( _height =='0' || _weight =='0' || _width =='0' || _length =='0' ){
                    debugPrint("Demontion");}
                  else{
                    try{
                      final Product product = Product(name: _nameController.text, description: _descriptionController.text, price: double.parse(_priceController.text), height: _height,
                          width: _width, length: _length, wight: _weight, stock: 0, minStock: 0, createdAt: createdTime());
                      widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                    }catch(e){
                      debugPrint("Invalid Inputs");
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
            ),
          ),
          SizedBox(height: 25.h,),
        ],
      ),
    );
  }
}




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
          SizedBox(height: 15.h,),
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
                     if(_fullNameController.text.isNotEmpty && _phoneNumberController.text.isNotEmpty && _addressController.text.isNotEmpty && _wilaya != "Wilaya" && _baladia != "Towne (Commune)"){
                      final Client client = Client(fullName: _fullNameController.text, phoneNumber: _phoneNumberController.text, optionalPhoneNumber: _optionalPhoneNumberController.text, wilaya: _wilaya, baladia: _baladia, createdAt: createdTime());
                      widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                    }else{
                      debugPrint("Invalid Inputs  ccc");
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
}



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
  bool _anotherPickupPlace = false;
  String _deliveryDay = "Preferred Delivery Day";
  String _deliveryTime = "Preferred Delivery Time";

  String _wilaya = "Wilaya";
  String _baladia = "Towne (Commune)";



  late TextEditingController _storeNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _addressController;


  @override
  void initState() {
    super.initState();
    _storeNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _addressController = TextEditingController();
  }

  void dispose() {
    _storeNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                    widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);

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
}
